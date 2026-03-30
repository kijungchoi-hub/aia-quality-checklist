# AIA Quality Checklist

AI 품질 점검 체크리스트와 관련 산출물을 관리하는 저장소입니다.  
현재 저장소에는 답변 품질, 요약 품질, 범용 AI RAG 서비스 품질 점검 문서와 이를 표·트래커·PPTX 형태로 가공한 결과물이 포함되어 있습니다.

## 목적

- 원본 품질 점검 데이터를 정리하고 재사용 가능한 체크리스트로 구조화
- 답변 품질과 요약 품질 개선 항목을 최종 문서로 정리
- AI RAG 서비스 전반에 적용 가능한 범용 체크리스트와 프로젝트 트래커 제공
- Markdown 문서를 기반으로 PowerPoint 보고서를 생성

## 디렉터리 구조

```text
.
├─ data/
│  ├─ quality_checklist_raw.csv
│  ├─ quality_checklist_raw_answer.csv
│  ├─ quality_checklist_raw_summary.csv
│  └─ quality_improvement_260109.xlsx
├─ docs/
│  ├─ answer_quality_checklist_final.md
│  ├─ answer_quality_checklist_final_table.md
│  ├─ answer_quality_checklist_final_table.csv
│  ├─ summary_quality_checklist_final.md
│  ├─ summary_quality_checklist_final_table.md
│  ├─ summary_quality_checklist_final_table.csv
│  ├─ ai_rag_service_checklist.md
│  ├─ ai_rag_service_checklist_table.md
│  ├─ ai_rag_service_checklist_table.csv
│  ├─ ai_rag_service_project_tracker.md
│  ├─ ai_rag_service_project_tracker.csv
│  └─ backup/
└─ scripts/
   ├─ generate_ai_rag_service_pptx.ps1
   └─ localize_ai_rag_pptx.ps1
```

## 주요 문서

### 1. 답변 품질 체크리스트

- `docs/answer_quality_checklist_final.md`
- 기준 데이터: `data/quality_checklist_raw_answer.csv`
- 답변 생성 품질 개선을 위한 최종 체크리스트와 개선활동 정리

### 2. 요약 품질 체크리스트

- `docs/summary_quality_checklist_final.md`
- 기준 데이터: `data/quality_checklist_raw_summary.csv`
- 요약 품질 개선을 위한 최종 체크리스트와 개선활동 정리

### 3. AI RAG 서비스 체크리스트

- `docs/ai_rag_service_checklist.md`
- 범용 AI + RAG 서비스에 공통 적용 가능한 점검 항목 정리
- 데이터, 검색, 컨텍스트, 프롬프트, 모델, 평가, 보안, 운영, 출시 전 점검 포함

### 4. 프로젝트 트래커

- `docs/ai_rag_service_project_tracker.md`
- 체크리스트 항목을 우선순위, 상태, 진행률 기준으로 관리할 수 있는 실행형 문서

## 스크립트

### `scripts/generate_ai_rag_service_pptx.ps1`

`docs/ai_rag_service_checklist.md`를 기반으로 PowerPoint 보고서를 생성합니다.

예시:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\generate_ai_rag_service_pptx.ps1
```

옵션 예시:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\generate_ai_rag_service_pptx.ps1 `
  -InputMarkdown .\docs\ai_rag_service_checklist.md `
  -OutputPath .\docs\ai_rag_service_checklist_report.pptx
```

### `scripts/localize_ai_rag_pptx.ps1`

생성된 PPTX의 슬라이드 내용을 한글 중심 보고서 형식으로 교체합니다.

예시:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\localize_ai_rag_pptx.ps1 `
  -InputPath .\docs\ai_rag_service_checklist_report.pptx `
  -OutputPath .\docs\ai_rag_service_checklist_report.pptx
```

## 권장 작업 순서

1. `data/`의 원본 데이터를 확인합니다.
2. `docs/`의 최종 체크리스트 문서를 검토합니다.
3. 필요 시 `docs/ai_rag_service_project_tracker.md`로 실행 상태를 관리합니다.
4. 보고서가 필요하면 `scripts/generate_ai_rag_service_pptx.ps1`를 실행합니다.
5. 한글형 보고서로 정리하려면 `scripts/localize_ai_rag_pptx.ps1`를 추가 실행합니다.

## 참고

- `docs/*.md`와 `docs/*.csv`는 체크리스트와 표 형식 결과물을 함께 제공합니다.
- `docs/backup/`에는 이전 버전 또는 중간 산출물이 보관되어 있습니다.
