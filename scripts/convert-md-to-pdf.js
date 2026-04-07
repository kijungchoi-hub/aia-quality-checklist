const fs = require("fs");
const path = require("path");
const os = require("os");
const { spawnSync } = require("child_process");

const rootDir = process.cwd();
const docsDir = path.join(rootDir, "docs");
const outDir = path.join(docsDir, "pdf");

function escapeHtml(text) {
  return text
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;");
}

function escapeAttribute(text) {
  return escapeHtml(text).replace(/"/g, "&quot;");
}

function toFileUrl(filePath) {
  return `file:///${filePath.replace(/\\/g, "/")}`;
}

function resolveDocLink(targetPath, currentFilePath) {
  if (!targetPath || /^(https?:|mailto:|tel:)/i.test(targetPath) || targetPath.startsWith("#")) {
    return targetPath;
  }

  const [rawPath, hash = ""] = targetPath.split("#");
  const normalizedPath = rawPath.replace(/\//g, path.sep);
  const candidates = [];

  if (path.isAbsolute(normalizedPath)) {
    candidates.push(normalizedPath);
  } else {
    candidates.push(path.resolve(path.dirname(currentFilePath), normalizedPath));
    candidates.push(path.resolve(rootDir, normalizedPath));
    if (rawPath.startsWith("docs/") || rawPath.startsWith("docs\\")) {
      candidates.push(path.resolve(rootDir, normalizedPath.replace(/^docs[\\/]/, "")));
    }
  }

  const existingPath = candidates.find((candidate) => fs.existsSync(candidate));
  if (!existingPath) {
    return targetPath;
  }

  let finalPath = existingPath;
  if (path.extname(existingPath).toLowerCase() === ".md" && existingPath.startsWith(docsDir)) {
    finalPath = path.join(outDir, path.relative(docsDir, existingPath)).replace(/\.md$/i, ".pdf");
  }

  return `${toFileUrl(finalPath)}${hash ? `#${hash}` : ""}`;
}

function renderInline(text, currentFilePath) {
  let result = escapeHtml(text);
  result = result.replace(/\[([^\]]+)\]\(([^)]+)\)/g, (_, label, href) => {
    const resolvedHref = resolveDocLink(href.trim(), currentFilePath);
    return `<a href="${escapeAttribute(resolvedHref)}">${escapeHtml(label)}</a>`;
  });
  result = result.replace(/`([^`]+)`/g, (_, codeText) => {
    const resolvedHref = resolveDocLink(codeText.trim(), currentFilePath);
    const codeHtml = `<code>${escapeHtml(codeText)}</code>`;
    if (resolvedHref !== codeText.trim()) {
      return `<a href="${escapeAttribute(resolvedHref)}">${codeHtml}</a>`;
    }
    return codeHtml;
  });
  result = result.replace(/\*\*([^*]+)\*\*/g, "<strong>$1</strong>");
  result = result.replace(/\*([^*]+)\*/g, "<em>$1</em>");
  return result;
}

function isTableSeparator(line) {
  return /^\s*\|?(\s*:?-{3,}:?\s*\|)+\s*:?-{3,}:?\s*\|?\s*$/.test(line);
}

function splitTableRow(line) {
  return line
    .trim()
    .replace(/^\|/, "")
    .replace(/\|$/, "")
    .split("|")
    .map((cell) => cell.trim());
}

function renderMarkdown(md, currentFilePath) {
  const lines = md.replace(/\r\n/g, "\n").split("\n");
  const html = [];
  let inCodeBlock = false;
  let inList = false;
  let inTable = false;
  let paragraph = [];

  function closeParagraph() {
    if (paragraph.length) {
      html.push(`<p>${renderInline(paragraph.join(" "), currentFilePath)}</p>`);
      paragraph = [];
    }
  }

  function closeList() {
    if (inList) {
      html.push("</ul>");
      inList = false;
    }
  }

  function closeTable() {
    if (inTable) {
      html.push("</tbody></table>");
      inTable = false;
    }
  }

  for (let i = 0; i < lines.length; i += 1) {
    const line = lines[i];

    if (line.trim().startsWith("```")) {
      closeParagraph();
      closeList();
      closeTable();
      if (!inCodeBlock) {
        html.push("<pre><code>");
        inCodeBlock = true;
      } else {
        html.push("</code></pre>");
        inCodeBlock = false;
      }
      continue;
    }

    if (inCodeBlock) {
      html.push(`${escapeHtml(line)}\n`);
      continue;
    }

    if (!line.trim()) {
      closeParagraph();
      closeList();
      closeTable();
      continue;
    }

    if (line.includes("|") && i + 1 < lines.length && isTableSeparator(lines[i + 1])) {
      closeParagraph();
      closeList();
      closeTable();
      const headers = splitTableRow(line);
      html.push("<table><thead><tr>");
      for (const header of headers) {
        html.push(`<th>${renderInline(header, currentFilePath)}</th>`);
      }
      html.push("</tr></thead><tbody>");
      inTable = true;
      i += 1;
      continue;
    }

    if (inTable && line.includes("|")) {
      const cells = splitTableRow(line);
      html.push("<tr>");
      for (const cell of cells) {
        html.push(`<td>${renderInline(cell, currentFilePath)}</td>`);
      }
      html.push("</tr>");
      continue;
    }

    if (/^#{1,6}\s+/.test(line)) {
      closeParagraph();
      closeList();
      closeTable();
      const [, hashes, text] = line.match(/^(#{1,6})\s+(.*)$/);
      html.push(`<h${hashes.length}>${renderInline(text, currentFilePath)}</h${hashes.length}>`);
      continue;
    }

    if (/^\s*[-*]\s+\[[ xX]\]\s+/.test(line) || /^\s*[-*]\s+/.test(line) || /^\s*\d+\.\s+/.test(line)) {
      closeParagraph();
      closeTable();
      if (!inList) {
        html.push("<ul>");
        inList = true;
      }
      const checked = /^\s*[-*]\s+\[[xX]\]\s+/.test(line);
      const unchecked = /^\s*[-*]\s+\[\s\]\s+/.test(line);
      const itemText = line
        .replace(/^\s*[-*]\s+\[[ xX]\]\s+/, "")
        .replace(/^\s*[-*]\s+/, "")
        .replace(/^\s*\d+\.\s+/, "");
      const checkbox = checked ? '<span class="checkbox">☑</span> ' : unchecked ? '<span class="checkbox">☐</span> ' : "";
      html.push(`<li>${checkbox}${renderInline(itemText, currentFilePath)}</li>`);
      continue;
    }

    if (/^\s*>\s?/.test(line)) {
      closeParagraph();
      closeList();
      closeTable();
      html.push(`<blockquote>${renderInline(line.replace(/^\s*>\s?/, ""), currentFilePath)}</blockquote>`);
      continue;
    }

    closeList();
    closeTable();
    paragraph.push(line.trim());
  }

  closeParagraph();
  closeList();
  closeTable();
  if (inCodeBlock) {
    html.push("</code></pre>");
  }

  return html.join("\n");
}

function buildHtml(title, body) {
  return `<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>${escapeHtml(title)}</title>
  <style>
    @page { size: A4; margin: 16mm 14mm; }
    body {
      font-family: "Malgun Gothic", "Apple SD Gothic Neo", "Noto Sans CJK KR", sans-serif;
      color: #1f2937;
      line-height: 1.6;
      font-size: 11pt;
      word-break: keep-all;
      margin: 0;
    }
    h1, h2, h3, h4, h5, h6 {
      color: #111827;
      line-height: 1.25;
      margin: 1.2em 0 0.5em;
    }
    h1 { font-size: 24pt; border-bottom: 2px solid #e5e7eb; padding-bottom: 0.2em; }
    h2 { font-size: 18pt; border-bottom: 1px solid #e5e7eb; padding-bottom: 0.15em; }
    h3 { font-size: 14pt; }
    p, ul, ol, blockquote, pre, table { margin: 0 0 0.8em; }
    ul, ol { padding-left: 1.4em; }
    li { margin: 0.2em 0; }
    code {
      font-family: Consolas, "Courier New", monospace;
      font-size: 0.92em;
      background: #f3f4f6;
      padding: 0.08em 0.35em;
      border-radius: 4px;
    }
    pre {
      background: #111827;
      color: #f9fafb;
      padding: 12px;
      border-radius: 8px;
      overflow: hidden;
      white-space: pre-wrap;
      word-break: break-word;
    }
    pre code {
      background: transparent;
      padding: 0;
      color: inherit;
    }
    blockquote {
      border-left: 4px solid #9ca3af;
      padding-left: 12px;
      color: #4b5563;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      table-layout: fixed;
    }
    th, td {
      border: 1px solid #d1d5db;
      padding: 8px;
      vertical-align: top;
      text-align: left;
    }
    th {
      background: #f3f4f6;
    }
    a {
      color: #1d4ed8;
      text-decoration: none;
    }
    .checkbox {
      font-family: "Segoe UI Symbol", "Malgun Gothic", sans-serif;
    }
  </style>
</head>
<body>
${body}
</body>
</html>`;
}

function findChrome() {
  const candidates = [
    process.env.CHROME_PATH,
    "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe",
    "C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe",
    "C:\\Program Files\\Microsoft\\Edge\\Application\\msedge.exe",
    "C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe",
  ].filter(Boolean);

  for (const candidate of candidates) {
    if (fs.existsSync(candidate)) {
      return candidate;
    }
  }
  throw new Error("Chrome or Edge executable not found.");
}

function collectMarkdownFiles(dir) {
  const entries = fs.readdirSync(dir, { withFileTypes: true });
  const files = [];

  for (const entry of entries) {
    if (entry.name === "pdf") {
      continue;
    }
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      files.push(...collectMarkdownFiles(fullPath));
    } else if (entry.isFile() && entry.name.toLowerCase().endsWith(".md")) {
      files.push(fullPath);
    }
  }

  return files;
}

function main() {
  fs.mkdirSync(outDir, { recursive: true });
  const chrome = findChrome();
  const markdownFiles = collectMarkdownFiles(docsDir);
  let converted = 0;

  for (const mdPath of markdownFiles) {
    const relativePath = path.relative(docsDir, mdPath);
    const pdfPath = path.join(outDir, relativePath.replace(/\.md$/i, ".pdf"));
    const tempHtmlPath = path.join(os.tmpdir(), `md-pdf-${Date.now()}-${Math.random().toString(36).slice(2)}.html`);
    const md = fs.readFileSync(mdPath, "utf8");
    const title = path.basename(mdPath, ".md");
    const body = renderMarkdown(md, mdPath);
    const html = buildHtml(title, body);

    fs.mkdirSync(path.dirname(pdfPath), { recursive: true });
    fs.writeFileSync(tempHtmlPath, html, "utf8");

    const result = spawnSync(
      chrome,
      [
        "--headless=new",
        "--disable-gpu",
        "--allow-file-access-from-files",
        `--print-to-pdf=${pdfPath}`,
        tempHtmlPath,
      ],
      { stdio: "pipe", encoding: "utf8" }
    );

    fs.unlinkSync(tempHtmlPath);

    if (result.status !== 0 || !fs.existsSync(pdfPath)) {
      throw new Error(`Failed to convert ${relativePath}\n${result.stderr || result.stdout}`);
    }

    converted += 1;
    process.stdout.write(`Converted: ${relativePath}\n`);
  }

  process.stdout.write(`Done. Generated ${converted} PDF files in ${outDir}\n`);
}

main();
