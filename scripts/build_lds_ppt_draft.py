from __future__ import annotations

import shutil
import tempfile
import zipfile
from pathlib import Path
import xml.etree.ElementTree as ET


NS = {"a": "http://schemas.openxmlformats.org/drawingml/2006/main"}
ET.register_namespace("", "http://schemas.openxmlformats.org/presentationml/2006/main")
ET.register_namespace("a", "http://schemas.openxmlformats.org/drawingml/2006/main")
ET.register_namespace("r", "http://schemas.openxmlformats.org/officeDocument/2006/relationships")


SLIDE_TEXTS: dict[int, list[str]] = {
    1: [
        "1",
        "Answer Quality Checklist 기반 LDS 보고",
        "데이터, 검색, 생성, 운영 관점에서 정리한 답변 품질 개선 방향",
        "2026.04.02 (",
        "목",
        ")",
    ],
    2: [
        "LDS",
        "1. ",
        "추진 ",
        "배경",
        "2. ",
        "전체 현황",
        "3. ",
        "핵심 ",
        "학습",
        "실행 과제",
        "1. ",
        "즉시 실행 과제",
        "2. ",
        "확산 및 다음 단계",
        "Q&A",
    ],
    3: [
        "I. LDS",
        "1. ",
        "체크리스트 전체 현황 ",
        ": ",
        "34건",
        "중",
        "25건 진행 ",
        "요약표",
        "구분",
        "전체",
        "진행중",
        "미착수",
        "높음 우선순위",
        "높음+미착수",
        "설명",
        "점검 대상 전체 규모",
        "현재 실행 중인 과제",
        "즉시 보완이 필요한 항목",
        "리스크 집중 구간",
        "우선 조치 필요 구간",
        "현황",
        "34건",
        "25건",
        "9건",
        "24건",
        "5건",
        "해석",
        "개선 과제는 충분히 발굴됨",
        "실행은 진행 중이나",
        "미착수 9건이 남아 있음",
        "우선순위는 높게 잡혀 있고",
        "그중 5건은 즉시 착수 필요",
    ],
    4: [
        "I. LDS",
        "2. ",
        "Learn 1",
        "구분",
        "핵심 포인트",
        "설명",
        "중요성",
        "미흡 시 의미",
        "우선 조치",
        "예시",
        "평가 기반",
        "골든셋 정합성",
        "질문-정답-Chunk ID가 맞아야 평가 해석 가능",
        "기준이 흔들리면 모든 수치가 흔들림",
        "개선 효과를 신뢰하기 어려움",
        "검증 세트 최신화",
        "정답지, Chunk 매핑 정비",
        "검색",
        "검색 성공 분리 측정",
        "검색 실패와 생성 실패를 분리해 봐야 원인 파악 가능",
        "원인별 개선 우선순위 정리에 필요",
        "검색 문제를 모델 문제로 오해할 수 있음",
        "실패 코드북 도입",
        "DATA/INDEX/META/QUERY/RANK 분리",
        "생성",
        "생성 안정성",
        "근거 누락, hallucination, 표현 품질을 별도 관리",
        "정답 문서를 찾아도 답변 품질은 별개",
        "검색 성공 후에도 오류가 남음",
        "출처 생성 규칙 강화",
        "생성 실패 케이스북 관리",
    ],
    5: [
        "I. LDS",
        "3. ",
        "Do 1",
        "No.",
        "구분",
        "필요성",
        "핵심 개선 내용",
        "적용 기술",
        "기대효과",
        "1",
        "데이터",
        "평가 신뢰도 확보",
        "검증 세트 최신화, 정답지/Chunk 정합성 확보",
        "데이터 정제, 버전 관리",
        "평가 결과 해석 가능",
        "2",
        "검색",
        "검색 품질 가시화",
        "Hybrid Search, BM25, Reranker, Top-K 최적화",
        "검색 조합 비교 실험",
        "회수율 향상",
        "3",
        "생성",
        "답변 안정화",
        "hallucination 억제, 출처 생성 흐름 검증",
        "프롬프트 규칙, 근거 인용",
        "근거 기반 답변 강화",
        "4",
        "운영",
        "배포 리스크 감소",
        "회귀 케이스, 부작용, 실패 추적 체계 정비",
        "주간 기록, 배포 게이트",
        "운영 안정화",
    ],
    6: [
        "II. ",
        "진행 현황",
        "1. ",
        "답변 품질 향상 ",
        ": ",
        "체크리스트 기준",
        "파트",
        "세부항목",
        "전주",
        "지표",
        "금주 지표",
        "금주 개선 활동",
        "차주 개선 활동",
        "목표",
        "데이터",
        "평가 기반 정비",
        "-",
        "-",
        "검증 세트 구조 재정리",
        "질문-정답-Chunk 정합성 보강",
        "평가 신뢰도 확보",
        "검색",
        "검색 실패 분류",
        "-",
        "-",
        "실패 코드 분리 기준 설계",
        "실패 로그 체계화",
        "원인 분석 가능",
        "생성",
        "출처/근거 흐름",
        "-",
        "-",
        "근거 인용 규칙 점검",
        "생성 실패 케이스 누적",
        "답변 안정화",
    ],
    7: [
        "II. ",
        "진행 현황",
        "2. ",
        "차주 우선 과제",
        "파트",
        "세부항목",
        "전주",
        "지표",
        "금주 지표",
        "금주 개선 활동",
        "차주 개선 활동",
        "목표",
        "요약",
        "·",
        "요약/분류 기능",
        "-",
        "-",
        "관련 경험 유지",
        "요약 품질 기준 정리",
        "-",
        "답변",
        "·",
        "미착수 5건",
        "-",
        "-",
        "우선순위 재정렬 완료",
        "상위 5건 즉시 착수",
        "리스크 구간 축소",
        "운영",
        "·",
        "주간 기록 포맷",
        "-",
        "-",
        "공통 기록 틀 초안 정리",
        "차주부터 동일 포맷 적용",
        "변경 추적 가능",
    ],
    8: [
        "III. ",
        "확산 및 다음 단계",
        "1. ",
        "조직 공유 포인트",
        "No.",
        "요청 항목",
        "세부 내용",
        "가이드",
        "1",
        "평가셋 정합성 기준 공유",
        "질문-정답-Chunk ID 기준을 공통 자산으로 문서화",
        "체크리스트/운영 문서 반영",
        "2",
        "검색 실패 코드북 확산",
        "DATA/INDEX/META/QUERY/RANK 기준 통일",
        "타 과제 재사용 가능",
        "3",
        "생성 실패 분리 관리",
        "검색 성공 후 생성 실패 케이스북 운영",
        "주간 회고와 연결",
        "4",
        "다음 단계",
        "상위 5개 미착수 과제 즉시 착수, 회귀 기준 정착",
        "운영 가능한 품질 체계 전환",
    ],
    9: ["Q&A"],
}


def replace_slide_texts(slide_path: Path, values: list[str]) -> None:
    tree = ET.parse(slide_path)
    root = tree.getroot()
    text_nodes = root.findall(".//a:t", NS)
    for idx, node in enumerate(text_nodes):
        node.text = values[idx] if idx < len(values) else ""
    tree.write(slide_path, encoding="UTF-8", xml_declaration=True)


def build_ppt(template_path: Path, output_path: Path) -> None:
    with tempfile.TemporaryDirectory() as tmp_dir:
        tmp_root = Path(tmp_dir)
        with zipfile.ZipFile(template_path) as src:
            src.extractall(tmp_root)

        slides_dir = tmp_root / "ppt" / "slides"
        for slide_no, values in SLIDE_TEXTS.items():
            replace_slide_texts(slides_dir / f"slide{slide_no}.xml", values)

        output_path.parent.mkdir(parents=True, exist_ok=True)
        with zipfile.ZipFile(output_path, "w", compression=zipfile.ZIP_DEFLATED) as dst:
            for file_path in sorted(tmp_root.rglob("*")):
                if file_path.is_file():
                    dst.write(file_path, file_path.relative_to(tmp_root))


def main() -> None:
    repo_root = Path(__file__).resolve().parents[1]
    template_path = repo_root / "docs" / "reports" / "report_template_v0.1_20260402.pptx"
    output_path = repo_root / "docs" / "reports" / "answer_quality_checklist_lds_ppt_draft_20260402.pptx"

    if not template_path.exists():
        raise FileNotFoundError(f"Template not found: {template_path}")

    build_ppt(template_path, output_path)
    print(output_path)


if __name__ == "__main__":
    main()
