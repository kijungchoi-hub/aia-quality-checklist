param(
  [string]$InputPath = '.\docs\ai_rag_service_checklist_report.pptx',
  [string]$OutputPath = '.\docs\ai_rag_service_checklist_report.pptx'
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
function W([string]$p,[string]$c){ [IO.File]::WriteAllText($p,$c,[Text.UTF8Encoding]::new($false)) }
function E([string]$t){ if($null -eq $t){''} else {[Security.SecurityElement]::Escape($t)} }
function P([string]$t,[int]$s=1600,[bool]$b=$false,[string]$c='243447'){
  $bv = if($b){' b="1"'}else{''}
  return "<a:p><a:r><a:rPr lang=`"ko-KR`" sz=`"$s`"$bv><a:solidFill><a:srgbClr val=`"$c`"/></a:solidFill><a:latin typeface=`"Malgun Gothic`"/><a:ea typeface=`"Malgun Gothic`"/></a:rPr><a:t>$(E $t)</a:t></a:r><a:endParaRPr lang=`"ko-KR`" sz=`"$s`"/></a:p>"
}
function T([string[]]$lines,[int]$s=1800,[bool]$b=$false,[string]$c='243447'){
  $x = if($null -eq $lines -or $lines.Count -eq 0){ P '' $s $b $c } else { ($lines|%{P $_ $s $b $c})-join "`n" }
  return "<p:txBody><a:bodyPr wrap=`"square`" anchor=`"t`"/><a:lstStyle/>$x</p:txBody>"
}
function B([int]$id,[string]$name,[int]$x,[int]$y,[int]$cx,[int]$cy,[string]$body,[string]$fill='',[string]$line='',[int]$r=0){
  $f=if($fill){"<a:solidFill><a:srgbClr val=`"$fill`"/></a:solidFill>"}else{'<a:noFill/>'}
  $l=if($line){"<a:ln><a:solidFill><a:srgbClr val=`"$line`"/></a:solidFill></a:ln>"}else{'<a:ln><a:noFill/></a:ln>'}
  $g=if($r -gt 0){"<a:avLst><a:gd name=`"adj`" fmla=`"val $r`"/></a:avLst>"}else{'<a:avLst/>'}
  return "<p:sp><p:nvSpPr><p:cNvPr id=`"$id`" name=`"$(E $name)`"/><p:cNvSpPr txBox=`"1`"/><p:nvPr/></p:nvSpPr><p:spPr><a:xfrm><a:off x=`"$x`" y=`"$y`"/><a:ext cx=`"$cx`" cy=`"$cy`"/></a:xfrm><a:prstGeom prst=`"roundRect`">$g</a:prstGeom>$f$l</p:spPr>$body</p:sp>"
}
function O([int]$id,[string]$name,[int]$x,[int]$y,[int]$d,[string]$body,[string]$fill='244A6A',[string]$line='FFFFFF'){
  $f=if($fill){"<a:solidFill><a:srgbClr val=`"$fill`"/></a:solidFill>"}else{'<a:noFill/>'}
  $l=if($line){"<a:ln w=`"12700`"><a:solidFill><a:srgbClr val=`"$line`"/></a:solidFill></a:ln>"}else{'<a:ln><a:noFill/></a:ln>'}
  return "<p:sp><p:nvSpPr><p:cNvPr id=`"$id`" name=`"$(E $name)`"/><p:cNvSpPr txBox=`"1`"/><p:nvPr/></p:nvSpPr><p:spPr><a:xfrm><a:off x=`"$x`" y=`"$y`"/><a:ext cx=`"$d`" cy=`"$d`"/></a:xfrm><a:prstGeom prst=`"ellipse`"><a:avLst/></a:prstGeom>$f$l</p:spPr>$body</p:sp>"
}
function Base([string]$content){
  return "<?xml version=`"1.0`" encoding=`"UTF-8`" standalone=`"yes`"?><p:sld xmlns:a=`"http://schemas.openxmlformats.org/drawingml/2006/main`" xmlns:r=`"http://schemas.openxmlformats.org/officeDocument/2006/relationships`" xmlns:p=`"http://schemas.openxmlformats.org/presentationml/2006/main`"><p:cSld><p:bg><p:bgPr><a:solidFill><a:srgbClr val=`"F4F7FB`"/></a:solidFill><a:effectLst/></p:bgPr></p:bg><p:spTree><p:nvGrpSpPr><p:cNvPr id=`"1`" name=`"`"/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr><p:grpSpPr><a:xfrm><a:off x=`"0`" y=`"0`"/><a:ext cx=`"0`" cy=`"0`"/><a:chOff x=`"0`" y=`"0`"/><a:chExt cx=`"0`" cy=`"0`"/></a:xfrm></p:grpSpPr>$content</p:spTree></p:cSld><p:clrMapOvr><a:masterClrMapping/></p:clrMapOvr></p:sld>"
}
function CardSlide([string]$tag,[string]$title,[string[]]$body,[string[]]$side,[string]$sideTitle='핵심 포인트'){ $chip=B 2 'Chip' 685800 274320 2600000 411480 (T @($tag) 1200 $true '244A6A') 'E6EDF3' '' 18000; $ttl=B 3 'Title' 685800 731520 10515600 640080 (T @($title) 2500 $true '20384F'); $main=B 4 'Body' 685800 1463040 8610600 4709160 (T $body 1750 $false '243447') 'FFFFFF' 'C9D3DD' 5000; $sh=B 5 'SideHeader' 9753600 1463040 1615440 411480 (T @($sideTitle) 1350 $true 'FFFFFF') '244A6A' '' 18000; $sb=B 6 'Side' 9753600 1965960 1615440 4206240 (T $side 1450 $false '445869') 'F4F7FA' 'C9D3DD' 5000; $ft=B 7 'Footer' 685800 6309360 10515600 228600 (T @('출처: docs/ai_rag_service_checklist.md') 1050 $false '6B7885'); Base($chip+$ttl+$main+$sh+$sb+$ft) }
function Cover(){ $a=B 2 'Title' 685800 640080 5486400 2194560 (T @('AI RAG 서비스','품질 점검 보고서') 2800 $true '20384F') 'E8EEF3' '' 12000; $b=B 3 'Info' 6400800 640080 4343400 2194560 (T @('기준 문서 기반 요약','생성일: 2026-03-30','범용 AI + RAG 서비스 운영 기준') 1650 $false 'FFFFFF') '244A6A' '' 12000; $c=B 4 'Body' 685800 3291840 10363200 2377440 (T @('데이터 준비, 검색, 컨텍스트, 생성, 평가, 보안, 운영, 출시 전 점검까지 AI RAG 서비스 전 과정을 한 장표 흐름으로 검토할 수 있도록 재구성했습니다.','체크리스트를 프로젝트 게이트와 운영 리뷰 포맷으로 바로 재사용할 수 있도록 요약과 실행 우선순위를 함께 담았습니다.') 1750 $false '243447') 'FFFFFF' 'C9D3DD' 5000; Base($a+$b+$c) }
function MapSlide(){ $items=@(@('1. 데이터 및 지식베이스 준비','EEF3F7','01'),@('2. 검색 품질','EAF0F4','02'),@('3. 컨텍스트 구성','EEF3F7','03'),@('4. 프롬프트 및 생성 품질','EAF0F4','04'),@('5. 모델 선택 및 튜닝','EEF3F7','05'),@('6. 평가 체계','EAF0F4','06'),@('7. 오류 분석 및 개선 루프','EEF3F7','07'),@('8. 보안 및 정책','EAF0F4','08'),@('9. 운영 및 관측성','EEF3F7','09'),@('10. 운영 전 최종 점검','EAF0F4','10')); $s=''; $id=10; $chip=B 2 'Chip' 685800 274320 2400000 411480 (T @('CHECKLIST MAP') 1200 $true '244A6A') 'E6EDF3' '' 18000; $ttl=B 3 'Title' 685800 731520 10515600 640080 (T @('점검영역 도식화') 2500 $true '20384F'); for($i=0;$i -lt $items.Count;$i++){ $row=[math]::Floor($i/5); $col=$i%5; $x=685800+($col*2090000); $y=1700000+($row*1550000); $s += B ($id++) ('N'+$i) $x $y 1800000 900000 (T @('',$items[$i][0]) 1320 $true '20384F') $items[$i][1] 'C9D3DD' 9000; $s += O ($id++) ('Badge'+$i) ($x+630000) ($y-210000) 420000 (T @($items[$i][2]) 1100 $true 'FFFFFF') '244A6A' 'FFFFFF' }; $band=B ($id++) 'Band1' 685800 5400000 3400000 450000 (T @('기반 영역') 1300 $true 'FFFFFF') '244A6A' '' 18000; $band2=B ($id++) 'Band2' 4240000 5400000 3400000 450000 (T @('품질/평가 영역') 1300 $true 'FFFFFF') '4A6378' '' 18000; $band3=B ($id++) 'Band3' 7790000 5400000 3400000 450000 (T @('운영/출시 영역') 1300 $true 'FFFFFF') '6B7885' '' 18000; $footer=B ($id++) 'Footer' 685800 6120000 10515600 228600 (T @('10개 영역을 순차적으로 따라가며 현재 수준과 공백을 점검합니다.') 1050 $false '6B7885'); Base($chip+$ttl+$s+$band+$band2+$band3+$footer) }
function TracksSlide(){ $chip=B 2 'Chip' 685800 274320 2900000 411480 (T @('IMPROVEMENT TRACKS') 1200 $true '244A6A') 'E6EDF3' '' 18000; $ttl=B 3 'Title' 685800 731520 10515600 640080 (T @('핵심 개선활동 묶음') 2500 $true '20384F'); $colors=@('EEF3F7','EAF0F4','EEF3F7','EAF0F4','EEF3F7'); $titles=@('데이터 정비','검색 개선','생성 개선','평가 및 개선 루프','운영 및 관리'); $texts=@('수집, 정제, 중복 제거, 버전 관리','Hybrid Search, Reranker, Top-K 최적화','프롬프트 구조, 환각 억제, 근거 형식화','자동·수동 평가, 오류 유형 분류, 회귀 테스트','로그, 비용, 지연시간, 권한·보안 정책 관리'); $nums=@('1','2','3','4','5'); $s=''; $id=10; for($i=0;$i -lt 5;$i++){ $x=685800+($i*2070000); $s+=B ($id++) ('T'+$i) $x 1850000 1750000 2650000 (T @('',$titles[$i],'',$texts[$i]) 1450 $true '20384F') $colors[$i] 'C9D3DD' 8000; $s+=O ($id++) ('TB'+$i) ($x+640000) 1570000 460000 (T @($nums[$i]) 1400 $true 'FFFFFF') '244A6A' 'FFFFFF' }; $msg=B ($id++) 'Msg' 685800 4950000 10515600 900000 (T @('5개 묶음으로 관리하면 조직별 역할 배분과 분기별 개선 로드맵 운영이 쉬워집니다.') 1600 $true '445869') 'FFFFFF' 'C9D3DD' 5000; Base($chip+$ttl+$s+$msg) }
function RoadmapSlide(){ $chip=B 2 'Chip' 685800 274320 2500000 411480 (T @('ROLL-OUT PLAN') 1200 $true '244A6A') 'E6EDF3' '' 18000; $ttl=B 3 'Title' 685800 731520 10515600 640080 (T @('권장 추진 순서 도식화') 2500 $true '20384F'); $stepTitles=@('데이터 정비','검색 품질 확보','컨텍스트/프롬프트 안정화','평가 체계 구축','운영 게이트 설정'); $fills=@('EEF3F7','EAF0F4','EEF3F7','EAF0F4','EEF3F7'); $nums=@('1','2','3','4','5'); $s=''; $id=10; for($i=0;$i -lt 5;$i++){ $x=850000+($i*2150000); $s+=B ($id++) ('S'+$i) $x 2200000 1650000 1050000 (T @('',$stepTitles[$i]) 1400 $true '20384F') $fills[$i] 'C9D3DD' 9000; $s+=O ($id++) ('SB'+$i) ($x+590000) 1960000 460000 (T @($nums[$i]) 1400 $true 'FFFFFF') '244A6A' 'FFFFFF'; if($i -lt 4){ $s+=B ($id++) ('A'+$i) ($x+1710000) 2520000 350000 350000 (T @('→') 1800 $true 'FFFFFF') '4A6378' '' 18000 } }; $risk=B ($id++) 'Risk' 850000 4100000 10200000 900000 (T @('핵심 메시지: 검색 품질을 확보하기 전에 모델 튜닝만 강화하면 투자 대비 효과가 제한됩니다.') 1650 $true '445869') 'FFFFFF' 'C9D3DD' 5000; $note=B ($id++) 'Note' 850000 5200000 10200000 650000 (T @('데이터 → 검색 → 생성 → 평가 → 운영 순으로 축적 효과가 발생하도록 설계합니다.') 1450 $false '6B7885'); Base($chip+$ttl+$s+$risk+$note) }
$slides=@(
  (Cover),
  (CardSlide 'EXECUTIVE SUMMARY' '보고서 요약' @('• 총 10개 점검영역과 68개 실행 항목, 5개 핵심 개선활동 묶음으로 구성했습니다.','• 특정 도메인이나 데이터셋 이름을 제거하고 일반적인 AI + RAG 서비스에 공통 적용 가능한 기준만 남겼습니다.','• 구현뿐 아니라 평가, 보안, 운영, 개선 루프까지 전체 라이프사이클을 포함합니다.','• 프로젝트 킥오프, 품질 리뷰, 운영 점검, 출시 게이트 문서로 재활용할 수 있습니다.') @('• 도메인 중립적 구성','• 검색과 생성 이슈 분리','• 운영과 보안까지 포함','• 보고서형 메시지로 재정리')),
  (MapSlide),
  (CardSlide 'DOMAIN REVIEW' '핵심 점검영역 1' @('[데이터 및 지식베이스 준비]','• 데이터 소스 정의, 신뢰도와 권한 기준 분류','• 원문, 요약, 메타데이터, 출처를 함께 저장','• 청크 기준, 중복 정리, 재색인 정책 관리','','[검색 품질]','• Lexical, Vector, Hybrid 전략 비교','• BM25, Dense Retrieval, Reranker 조합 검증','• Top-K, Threshold, Weight 최적화와 실패 원인 분리','','[컨텍스트 구성]','• 정제된 컨텍스트 사용 여부 결정','• 중복·노이즈·충돌 청크 제거 규칙 정의','• 근거 문서와 답변 문맥의 연결 가능성 검증') @('• 검색 성능은 데이터 정합성에 크게 의존','• 컨텍스트 정제가 생성 품질을 좌우','• 초기 단계 우선 투자 영역')),
  (CardSlide 'DOMAIN REVIEW' '핵심 점검영역 2' @('[프롬프트 및 생성 품질]','• 시스템 프롬프트와 태스크 프롬프트 역할 분리','• Hallucination 억제 규칙과 안전한 거절 문구 정의','• Few-shot, Anchoring, Routing 등 실험 관리','','[모델 선택 및 튜닝]','• 성능, 비용, 지연시간, 운영 제약을 함께 평가','• SFT 및 선호도 학습 전략 비교','• 튜닝 효과와 검색 개선 효과를 분리 해석','','[평가 체계]','• 골든셋, 검증셋, 운영 샘플 분리 관리','• KPI와 자동 평가, 수동 검수 역할 정의','• 변경 전후를 같은 기준으로 비교') @('• 프롬프트와 튜닝은 검색 확보 이후 효과가 큼','• 평가는 KPI와 샘플 관리가 핵심','• 회귀 추적 체계가 반드시 필요')),
  (CardSlide 'DOMAIN REVIEW' '핵심 점검영역 3' @('[오류 분석 및 개선 루프]','• 검색 실패와 생성 실패를 구분해 분석','• 문서 미검색, 오매칭, 근거 불일치, 왜곡을 세분화','• 분석 결과를 프롬프트, 검색, 데이터, 모델 개선으로 연결','','[보안 및 정책]','• 접근권한 기반 검색 정책 적용','• 개인정보와 민감정보 별도 처리','• 프롬프트 인젝션, 데이터 유출, 금지 답변 정책 정의','','[운영 및 관측성 / 운영 전 최종 점검]','• 요청 수, 지연시간, 토큰, 실패율 수집','• 버전 이력, 실험 로그, 롤백 기준 관리','• 대표 시나리오와 엣지 케이스, 감사 로그 요구사항 점검') @('• 출시 직전보다 설계 초기 반영이 중요','• 운영 지표와 품질 지표를 함께 봐야 함','• 개선 루프가 반복될수록 품질 안정화')),
  (TracksSlide),
  (RoadmapSlide),
  (CardSlide 'MANAGEMENT TAKEAWAYS' '운영 적용 시 핵심 메시지' @('• 검색 실패와 생성 실패를 분리 추적해야 개선 비용이 줄어듭니다.','• 모델 튜닝 효과는 검색 개선 효과와 반드시 분리해서 해석해야 합니다.','• 접근권한, 개인정보, 감사 로그, 안전 정책은 출시 직전 점검이 아니라 설계 초기에 반영해야 합니다.','• 본 체크리스트는 주간 품질 리포트와 출시 승인 문서의 기본 골격으로 재사용할 수 있습니다.') @('• 품질관리 기준 문서','• 출시 전 게이트 문서','• 운영 리뷰 문서','• 개선활동 추적 문서'))
)
$tmp=Join-Path ([IO.Path]::GetTempPath()) ('ppt_diagram_'+[guid]::NewGuid().ToString('N')); $srcDir=Join-Path $tmp 'src'; New-Item -ItemType Directory -Path $srcDir -Force|Out-Null; [IO.Compression.ZipFile]::ExtractToDirectory((Resolve-Path $InputPath),$srcDir)
for($i=0;$i -lt $slides.Count;$i++){ W (Join-Path $srcDir ("ppt/slides/slide{0}.xml" -f ($i+1))) $slides[$i] }
$zip1=Join-Path $tmp 'stage.zip'; $zip2=Join-Path $tmp 'final.zip'; [IO.Compression.ZipFile]::CreateFromDirectory($srcDir,$zip1); $zin=[IO.Compression.ZipFile]::OpenRead($zip1); $zout=[IO.Compression.ZipFile]::Open($zip2,[IO.Compression.ZipArchiveMode]::Create); foreach($e in $zin.Entries){ $name=$e.FullName -replace '\\','/'; $ne=$zout.CreateEntry($name); $i=$e.Open(); $o=$ne.Open(); $i.CopyTo($o); $o.Dispose(); $i.Dispose() }; $zout.Dispose(); $zin.Dispose(); if(Test-Path $OutputPath){ Remove-Item $OutputPath -Force }; Move-Item $zip2 $OutputPath -Force; Remove-Item $tmp -Recurse -Force; Write-Output "Updated: $OutputPath"









