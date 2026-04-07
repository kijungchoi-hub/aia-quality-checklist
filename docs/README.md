# 문서 안내

이 폴더는 프로젝트관리자(PM)와 프로젝트 리더가 AI 품질 운영(개선/관리)에 사용할 기준 문서, 실행 문서, 판단 기준, 기록 문서를 모아 둔 영역입니다.

## 폴더 구성

- [`checklists`](checklists/): 프로젝트 시작 전에 기준으로 삼는 최종 체크리스트를 둡니다.
- [`projects`](projects/): 체크리스트를 실행 계획, 우선순위, 담당, 진행 상태로 전환하는 문서를 둡니다.
- [`governance`](governance/): 품질 운영 기준, 실패 분류, 배포 기준, 의사결정 기준을 관리합니다.
- [`records`](records/): 품질 운영 개요 문서와 검증, 회귀, 주간 기록 같은 운영 기록 문서를 관리합니다.
- [`templates`](records/templates/): 실험, 검증, 배포 점검, 주간 기록 템플릿을 보관합니다.

## 데이터와 문서 구분

- 평가셋, 검증셋, 회귀 테스트셋 같은 실제 데이터 파일은 [`../data`](../data/) 아래에 둡니다.
- 특히 평가용 원본 데이터는 [`../data/evaluation`](../data/evaluation/)을, 회귀 테스트 원본 데이터는 [`../data/regression`](../data/regression/)을 우선 사용합니다.
- 실행 계획서, 프로젝트 적용 범위, 우선순위, 담당자 관리 문서는 [`projects`](projects/)에 둡니다.
- 품질 판단 기준, 실패 분류 기준, 반영 여부 판단 문서는 [`governance`](governance/)에 둡니다.
- 검증 결과 요약, 회귀 판정 기록, 주간 품질 로그는 [`records`](records/)에 둡니다.

## 권장 사용 순서

1. [`checklists`](checklists/)에서 적용 기준 문서를 고릅니다.
2. [`projects`](projects/)에서 실행 계획과 품질 리스크 우선순위를 기록합니다.
3. [`governance`](governance/)에서 품질 운영 기준과 검증 기준, 반영 기준을 연결합니다.
4. [`templates`](records/templates/)에서 필요한 템플릿을 골라 산출물을 작성합니다.
5. [`records`](records/)에서 품질 운영 개요와 검증, 회귀, 주간 기록을 정리합니다.

## 품질 운영 원칙

- 최종 기준 문서는 [`checklists`](checklists/)에 둡니다.
- PM과 프로젝트 리더가 운영하는 실행 계획 문서는 [`projects`](projects/)에 둡니다.
- 정책, 실패 분류, 게이트 기준은 [`governance`](governance/)에 둡니다.
- 품질 운영 개요와 운영 기록은 [`records`](records/)에 둡니다.
- 평가셋과 회귀셋 자체는 문서 폴더로 옮기지 않고 [`../data`](../data/) 아래에서 관리합니다.
- 이전 버전과 중간 산출물은 최상위 [`archive`](../archive/)로 이동해 보관합니다.
