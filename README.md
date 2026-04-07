# AI 품질 체크리스트

AI 품질 점검과 개선활동 기준 문서를 관리하는 저장소입니다.
답변 품질, 요약 품질, 범용 AI RAG 서비스 품질 점검 항목을 같은 흐름으로 정리합니다.

## 목적

- 원본 품질 점검 데이터를 재사용 가능한 체크리스트로 구조화합니다.
- 답변 품질과 요약 품질 개선 항목을 실행형 문서로 정리합니다.
- AI RAG 서비스에 공통으로 적용할 수 있는 개선활동 기준과 점검 템플릿을 제공합니다.

## 디렉터리 구조

```text
.
├─ data/
│  ├─ quality_checklist_raw.csv
│  ├─ quality_checklist_raw_answer.csv
│  ├─ quality_checklist_raw_summary.csv
│  └─ quality_improvement_260109.xlsx
├─ docs/
│  ├─ checklists/
│  ├─ projects/
│  ├─ governance/
│  ├─ records/
│  └─ README.md
├─ archive/
└─ scripts/
```

## 프로젝트 진행 흐름

### 1. 기준 데이터 확인

- [`data`](data/)에서 원본 CSV/XLSX를 확인합니다.
- 답변형, 요약형, 공통 RAG형 중 어떤 흐름으로 시작할지 정합니다.

### 2. 체크리스트 선택

- 답변형: [`answer_checklist.md`](docs/checklists/answer_checklist.md)
- 요약형: [`summary_checklist.md`](docs/checklists/summary_checklist.md)
- 공통 RAG형: [`ai_rag_service_checklist.md`](docs/checklists/ai_rag_service_checklist.md)

### 3. 프로젝트 계획 수립

- [`ai_rag_service_project_tracker.md`](docs/projects/ai_rag_service_project_tracker.md)에서 우선순위, 상태, 담당, 완료 기준을 관리합니다.
- 필요하면 [`ai_rag_service_project_application_template.md`](docs/projects/ai_rag_service_project_application_template.md)로 착수 정보를 정리합니다.

### 4. 개선활동 기준 연결

- 개선활동 기준과 검증 기준은 [`governance`](docs/governance/)에서 관리합니다.
- 재사용 템플릿은 [`templates`](docs/records/templates/)에서 선택합니다.

### 5. 개선활동 기록 정리

- 핵심 정리 문서는 [`quality_checklist_overview.md`](docs/records/quality_checklist_overview.md)를 기준으로 관리합니다.
- 실험, 검증, 주간 기록 문서는 [`templates`](docs/records/templates/) 구조에 맞춰 작성합니다.

### 6. 이전 산출물 보관

- 중간 초안, 이전 버전, 백업본은 [`archive`](archive/)로 이동해 보관합니다.

## 주요 문서

- [`answer_checklist.md`](docs/checklists/answer_checklist.md): 답변 품질 최종 체크리스트
- [`summary_checklist.md`](docs/checklists/summary_checklist.md): 요약 품질 최종 체크리스트
- [`ai_rag_service_checklist.md`](docs/checklists/ai_rag_service_checklist.md): 범용 AI RAG 서비스 체크리스트
- [`ai_rag_service_project_tracker.md`](docs/projects/ai_rag_service_project_tracker.md): 프로젝트 진행 관리표
- [`quality_operating_framework.md`](docs/governance/quality_operating_framework.md): 개선활동 프레임워크
- [`quality_checklist_overview.md`](docs/records/quality_checklist_overview.md): 답변 품질 개선활동 개요 문서
- [`templates README.md`](docs/records/templates/README.md): 개선활동 기록 템플릿 안내

## 권장 운영 환경

- 개발, 스테이징, 운영 환경을 구분해 관리합니다.
- 프롬프트, 모델 설정, 검색 색인 기준 문서를 버전 관리합니다.
- 품질 결과를 이슈 트래커나 작업 도구와 연결해 담당자와 마감일을 관리합니다.
- 개인정보나 내부 문서가 포함되면 접근 권한과 로그 보관 정책을 먼저 정리합니다.

## 체크리스트 적용 방식

1. 서비스 유형을 답변형, 요약형, RAG형 중 하나 또는 복합형으로 분류합니다.
2. 해당 체크리스트 문서를 선택하고 적용 범위와 제외 범위를 정리합니다.
3. 항목별 측정 방법, 증빙 자료, 완료 기준을 [`ai_rag_service_project_tracker.md`](docs/projects/ai_rag_service_project_tracker.md)에 기록합니다.
4. 단계별 평가로 현재 수준을 확인하고 우선순위가 높은 결함부터 개선합니다.
5. 검증, 운영 반영, 회고에도 같은 기준을 반복 적용합니다.

## 빠른 시작

1. [`data`](data/)에서 기준 데이터를 확인합니다.
2. [`checklists`](docs/checklists/)에서 맞는 체크리스트를 고릅니다.
3. [`ai_rag_service_project_tracker.md`](docs/projects/ai_rag_service_project_tracker.md)에 실행 계획을 기록합니다.
4. [`governance`](docs/governance/)와 [`templates`](docs/records/templates/)에서 개선활동 기준과 템플릿을 연결합니다.
5. 결과는 [`quality_checklist_overview.md`](docs/records/quality_checklist_overview.md) 기준으로 정리합니다.

## 참고

- [`checklists`](docs/checklists/)에는 최종 체크리스트와 표 형식 산출물이 정리돼 있습니다.
- [`projects`](docs/projects/), [`records`](docs/records/), [`governance`](docs/governance/)에는 목적별 작업 문서를 분리해 보관합니다.
- [`archive`](archive/)에는 이전 버전과 중간 산출물을 보관합니다.
