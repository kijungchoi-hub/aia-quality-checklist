# 체크리스트 문서 안내

이 폴더는 프로젝트 착수 전에 기준으로 삼는 최종 체크리스트 문서를 보관합니다.

## 포함 문서

| 파일명 | 용도 |
|---|---|
| [`01_ai_rag_service_checklist.md`](01_ai_rag_service_checklist.md) | AI RAG 서비스 전반에 적용하는 기준 체크리스트 |
| [`01_ai_rag_service_checklist.pdf`](01_ai_rag_service_checklist.pdf) | 위 체크리스트의 PDF 버전 |
| [`02_ai_rag_service_checklist_table.md`](02_ai_rag_service_checklist_table.md) | AI RAG 서비스 체크리스트의 표형 문서 |
| [`02_ai_rag_service_checklist_table.csv`](02_ai_rag_service_checklist_table.csv) | AI RAG 서비스 체크리스트의 CSV 버전 |
| [`02_ai_rag_service_checklist_table.pdf`](02_ai_rag_service_checklist_table.pdf) | AI RAG 서비스 체크리스트 표형 문서의 PDF 버전 |
| [`03_answer_checklist.md`](03_answer_checklist.md) | 답변형 서비스에 초점을 둔 체크리스트 |
| [`03_answer_checklist.pdf`](03_answer_checklist.pdf) | 위 체크리스트의 PDF 버전 |
| [`04_answer_checklist_table.md`](04_answer_checklist_table.md) | 답변형 체크리스트의 표형 문서 |
| [`04_answer_checklist_table.csv`](04_answer_checklist_table.csv) | 답변형 체크리스트의 CSV 버전 |
| [`04_answer_checklist_table.pdf`](04_answer_checklist_table.pdf) | 답변형 체크리스트 표형 문서의 PDF 버전 |
| [`05_summary_checklist.md`](05_summary_checklist.md) | 요약형 서비스에 초점을 둔 체크리스트 |
| [`05_summary_checklist.pdf`](05_summary_checklist.pdf) | 위 체크리스트의 PDF 버전 |
| [`06_summary_checklist_table.md`](06_summary_checklist_table.md) | 요약형 체크리스트의 표형 문서 |
| [`06_summary_checklist_table.csv`](06_summary_checklist_table.csv) | 요약형 체크리스트의 CSV 버전 |
| [`06_summary_checklist_table.pdf`](06_summary_checklist_table.pdf) | 요약형 체크리스트 표형 문서의 PDF 버전 |

## 권장 사용 순서

1. 서비스 유형에 맞는 기준 문서(`01`, `03`, `05`)를 먼저 고릅니다.
2. 실제 점검이나 공유가 필요하면 대응하는 표형 문서(`02`, `04`, `06`)를 사용합니다.
3. 설명형 문서는 `*.md`, 표 기반 입력이나 엑셀 연계는 `*.csv`, 배포 공유본은 `*.pdf`를 사용합니다.

## 사용 원칙

- 같은 번호는 같은 문서의 확장자별 변형입니다.
- 평가용 원본 데이터는 [`../../data/evaluation`](../../data/evaluation/)을 우선 사용합니다.
- 회귀 테스트 원본 데이터는 [`../../data/regression`](../../data/regression/)을 우선 사용합니다.
- 프로젝트별 실행 계획과 진행 관리는 [`../projects`](../projects/)에서 이어서 관리합니다.
- 체크리스트 기준을 실제 검증 문서로 연결할 때는 [`../governance`](../governance/)와 [`../records/templates`](../records/templates/)를 함께 사용합니다.
