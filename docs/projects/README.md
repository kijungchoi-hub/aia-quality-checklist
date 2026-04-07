# 프로젝트 문서 안내

이 폴더는 PM과 프로젝트 리더가 AI 품질 운영(개선/관리)을 실제 실행 계획, 작업 분해, 진행 상태 관리로 전환할 때 사용하는 프로젝트 문서를 모아 둔 영역입니다.

## 포함 문서

| 파일명 | 용도 |
|---|---|
| [`07_ai_rag_service_project_application_template.md`](07_ai_rag_service_project_application_template.md) | 프로젝트 착수 시 적용 범위, 품질 목표, 준비 상태를 정리하는 템플릿 |
| [`07_ai_rag_service_project_application_template_sample.csv`](07_ai_rag_service_project_application_template_sample.csv) | 프로젝트 적용 템플릿 작성 예시 |
| [`08_ai_rag_service_project_tracker.md`](08_ai_rag_service_project_tracker.md) | 체크리스트 항목을 우선순위, 상태, 담당 기준으로 관리하는 실행 관리표 |
| [`08_ai_rag_service_project_tracker.csv`](08_ai_rag_service_project_tracker.csv) | 실행 관리표 입력용 CSV |
| [`09_ai_rag_service_wbs.md`](09_ai_rag_service_wbs.md) | PM 실행 관점의 품질 운영 WBS 문서 |
| [`09_ai_rag_service_wbs.csv`](09_ai_rag_service_wbs.csv) | WBS 입력 및 엑셀 연계용 CSV |

## 권장 사용 순서

1. [`07_ai_rag_service_project_application_template.md`](07_ai_rag_service_project_application_template.md)에서 프로젝트 기본 정보와 적용 범위를 정리합니다.
2. [`09_ai_rag_service_wbs.md`](09_ai_rag_service_wbs.md) 또는 [`09_ai_rag_service_wbs.csv`](09_ai_rag_service_wbs.csv)에서 전체 작업 구조를 확정합니다.
3. [`08_ai_rag_service_project_tracker.md`](08_ai_rag_service_project_tracker.md) 또는 [`08_ai_rag_service_project_tracker.csv`](08_ai_rag_service_project_tracker.csv)에서 실제 일정, 상태, 담당, 진행률을 운영합니다.

## 사용 원칙

- 착수 문서는 범위와 목표를 정리하는 데 사용합니다.
- WBS 문서는 작업 분해와 선행조건 정의에 사용합니다.
- Tracker 문서는 주간 단위 실행 관리와 상태 점검에 사용합니다.
- 상세 품질 기준은 [`../checklists`](../checklists/)를 기준으로 확인합니다.
- 판단 기준과 배포 기준은 [`../governance`](../governance/)와 연결해서 사용합니다.
- 실험, 검증, 회귀, 주간 기록은 [`../records`](../records/) 및 [`../records/templates`](../records/templates/)에서 이어서 관리합니다.
