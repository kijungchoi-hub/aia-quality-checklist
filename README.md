# AI 품질 체크리스트

프로젝트관리자(PM)와 프로젝트 리더가 AI 품질 운영(개선/관리)을 위한 기준 문서와 운영 문서를 관리하는 저장소입니다.
답변 품질, 요약 품질, 범용 AI RAG 서비스 품질 점검 항목을 같은 관리 흐름으로 정리합니다.

## 목적

- 원본 품질 점검 데이터를 PM과 프로젝트 리더가 재사용할 수 있는 체크리스트로 구조화합니다.
- 답변 품질과 요약 품질 개선 항목을 실행 계획과 리스크 관리 관점의 문서로 정리합니다.
- AI RAG 서비스에 공통으로 적용할 수 있는 품질 관리 기준, 의사결정 기준, 점검 템플릿을 제공합니다.

## 이 저장소가 필요한 이유

- AI 품질은 모델 하나로 설명되지 않고 데이터, 검색, 프롬프트, 평가, 회귀, 보안 정책이 함께 영향을 줍니다.
- PM과 프로젝트 리더는 품질 이슈를 개별 기술 문제로만 보지 않고 일정, 우선순위, 담당, 리스크로 연결해서 관리해야 합니다.
- 이 저장소는 체크리스트, 프로젝트 관리표, 기준 문서, 기록 문서를 연결해서 품질 관리를 반복 가능한 운영 체계로 만들기 위한 구조입니다.

## 디렉터리 구조

```text
.
├─ data/
│  ├─ evaluation/
│  ├─ regression/
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
- 평가셋 원본은 `data/evaluation/`, 회귀 테스트셋 원본은 `data/regression/`에 둡니다.
- 답변형, 요약형, 공통 RAG형 중 어떤 흐름으로 시작할지 정합니다.
- 이 단계에서 PM과 프로젝트 리더는 적용 범위와 주요 품질 리스크를 먼저 식별합니다.

### 2. 체크리스트 선택

- 답변형: [`03_answer_checklist.md`](docs/checklists/03_answer_checklist.md)
- 요약형: [`05_summary_checklist.md`](docs/checklists/05_summary_checklist.md)
- 공통 RAG형: [`01_ai_rag_service_checklist.md`](docs/checklists/01_ai_rag_service_checklist.md)

### 3. 프로젝트 계획 수립

- [`08_ai_rag_service_project_tracker.md`](docs/projects/08_ai_rag_service_project_tracker.md)에서 우선순위, 상태, 담당, 완료 기준을 관리합니다.
- 필요하면 [`07_ai_rag_service_project_application_template.md`](docs/projects/07_ai_rag_service_project_application_template.md)로 착수 정보를 정리합니다.
- 이 단계에서 체크리스트 항목을 실제 실행 과제와 관리 가능한 리스크로 전환합니다.

### 4. 품질 운영 기준 연결

- 품질 운영 기준과 검증 기준은 [`governance`](docs/governance/)에서 관리합니다.
- 재사용 템플릿은 [`templates`](docs/records/templates/)에서 선택합니다.
- PM과 프로젝트 리더는 이 문서들을 기준으로 품질 판단과 반영 여부를 일관되게 맞춥니다.

### 5. 품질 운영 기록 정리

- 핵심 정리 문서는 [`31_quality_operating_overview.md`](docs/governance/31_quality_operating_overview.md)를 기준으로 관리합니다.
- 실험, 검증, 주간 기록 문서는 [`templates`](docs/records/templates/) 구조에 맞춰 작성합니다.
- 검증 결과 요약, 회귀 판정 메모, 평가 이력 같은 기록 문서는 [`records`](docs/records/) 아래에서 관리합니다.
- 기록은 단순 보관용이 아니라 다음 의사결정과 회귀 방지를 위한 관리 근거로 남깁니다.

### 6. 이전 산출물 보관

- 중간 초안, 이전 버전, 백업본은 [`archive`](archive/)로 이동해 보관합니다.

## 주요 문서

- [`03_answer_checklist.md`](docs/checklists/03_answer_checklist.md): 답변 품질 최종 체크리스트
- [`05_summary_checklist.md`](docs/checklists/05_summary_checklist.md): 요약 품질 최종 체크리스트
- [`01_ai_rag_service_checklist.md`](docs/checklists/01_ai_rag_service_checklist.md): 범용 AI RAG 서비스 체크리스트
- [`08_ai_rag_service_project_tracker.md`](docs/projects/08_ai_rag_service_project_tracker.md): PM/프로젝트 리더용 프로젝트 진행 관리표
- [`09_quality_operating_framework.md`](docs/governance/09_quality_operating_framework.md): 품질 운영 및 의사결정 프레임워크
- [`31_quality_operating_overview.md`](docs/governance/31_quality_operating_overview.md): 품질 운영과 검증 결과 개요 문서
- [`README.md`](docs/records/templates/README.md): 품질 운영 기록 템플릿 안내

## 권장 운영 환경

- 개발, 스테이징, 운영 환경을 구분해 관리합니다.
- 프롬프트, 모델 설정, 검색 색인 기준 문서를 버전 관리합니다.
- 품질 결과를 이슈 트래커나 작업 도구와 연결해 담당자와 마감일을 관리합니다.
- 개인정보나 내부 문서가 포함되면 접근 권한과 로그 보관 정책을 먼저 정리합니다.
- 배포 전에는 회귀 여부와 주요 리스크를 PM과 프로젝트 리더 기준에서 다시 확인합니다.

## 체크리스트 적용 방식

1. 서비스 유형을 답변형, 요약형, RAG형 중 하나 또는 복합형으로 분류합니다.
2. 해당 체크리스트 문서를 선택하고 적용 범위와 제외 범위를 정리합니다.
3. 항목별 측정 방법, 증빙 자료, 완료 기준을 [`08_ai_rag_service_project_tracker.md`](docs/projects/08_ai_rag_service_project_tracker.md)에 기록합니다.
4. PM과 프로젝트 리더 관점에서 우선순위가 높은 품질 리스크부터 실행 계획으로 전환합니다.
5. 단계별 평가로 현재 수준을 확인하고 개선 여부, 보류 여부, 추가 검증 필요 여부를 판단합니다.
6. 검증, 운영 반영, 회고에도 같은 기준을 반복 적용합니다.

## 빠른 시작

1. [`data`](data/)에서 기준 데이터를 확인합니다.
2. [`checklists`](docs/checklists/)에서 맞는 체크리스트를 고릅니다.
3. [`08_ai_rag_service_project_tracker.md`](docs/projects/08_ai_rag_service_project_tracker.md)에 실행 계획과 품질 리스크를 기록합니다.
4. [`governance`](docs/governance/)와 [`templates`](docs/records/templates/)에서 품질 운영 기준과 템플릿을 연결합니다.
5. 결과는 [`31_quality_operating_overview.md`](docs/governance/31_quality_operating_overview.md) 기준으로 정리하고 다음 의사결정에 반영합니다.

## 참고

- [`checklists`](docs/checklists/)에는 최종 체크리스트와 표 형식 산출물이 정리돼 있습니다.
- [`projects`](docs/projects/), [`records`](docs/records/), [`governance`](docs/governance/)에는 목적별 작업 문서를 분리해 보관합니다.
- `data/evaluation/`, `data/regression/`은 실제 평가셋과 회귀 테스트셋 같은 데이터 저장 위치입니다.
- `docs/projects/`는 계획 문서, `docs/records/`는 실행 결과와 검증 기록 문서 저장 위치입니다.
- [`archive`](archive/)에는 이전 버전과 중간 산출물을 보관합니다.
