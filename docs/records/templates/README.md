# 품질 개선활동 템플릿 안내

| 항목 | 내용 |
|---|---|
| 작성일 | 2026-04-02 |

## 목적

이 폴더는 `생성형 AI 서비스 구축을 위한 Answer Quality Checklist`와 `Answer Quality Framework`를 실제 개선활동 문서로 연결하는 표준 템플릿 모음입니다.

## 폴더 구조

- [`operations`](operations/): 실험 설계와 실패 사례 축적에 사용하는 개선활동 템플릿
- [`validation`](validation/): 회귀 검증과 품질 비교에 사용하는 검증 템플릿
- [`release`](release/): 개선 반영 승인과 배포 판단에 사용하는 템플릿
- [`logs`](logs/): 주간 점검과 개선활동 기록에 사용하는 템플릿

## 파일 안내

### operations 템플릿

| 파일 | 용도 |
|---|---|
| [`16_experiment_design.md`](operations/16_experiment_design.md) | 품질 개선 실험 설계서 |
| [`16_experiment_design.csv`](operations/16_experiment_design.csv) | 품질 개선 실험 설계 입력용 CSV |
| [`17_experiment_design_sample.md`](operations/17_experiment_design_sample.md) | 실험 설계서 작성 예시 |
| [`17_experiment_design_sample.csv`](operations/17_experiment_design_sample.csv) | 실험 설계 입력 예시 CSV |
| [`18_search_failure_codebook.md`](operations/18_search_failure_codebook.md) | 검색 실패 코드북 |
| [`18_search_failure_codebook.csv`](operations/18_search_failure_codebook.csv) | 검색 실패 기록용 CSV |
| [`19_search_failure_codebook_sample.md`](operations/19_search_failure_codebook_sample.md) | 검색 실패 코드북 작성 예시 |
| [`19_search_failure_codebook_sample.csv`](operations/19_search_failure_codebook_sample.csv) | 검색 실패 기록 예시 CSV |
| [`20_generation_failure_casebook.md`](operations/20_generation_failure_casebook.md) | 생성 실패 케이스북 |
| [`20_generation_failure_casebook.csv`](operations/20_generation_failure_casebook.csv) | 생성 실패 기록용 CSV |
| [`21_generation_failure_casebook_sample.md`](operations/21_generation_failure_casebook_sample.md) | 생성 실패 케이스북 작성 예시 |
| [`21_generation_failure_casebook_sample.csv`](operations/21_generation_failure_casebook_sample.csv) | 생성 실패 기록 예시 CSV |

### validation 템플릿

| 파일 | 용도 |
|---|---|
| [`22_evaluation_dataset.md`](validation/22_evaluation_dataset.md) | 평가셋/검증셋 관리 문서 |
| [`23_manual_auto_review_log.md`](validation/23_manual_auto_review_log.md) | 수동+자동 평가 통합 기록 문서 |
| [`24_expansion_validation_matrix.md`](validation/24_expansion_validation_matrix.md) | 타 영역 확장 검증 매트릭스 |
| [`25_regression_test_tracker.md`](validation/25_regression_test_tracker.md) | 회귀 테스트 관리표 |
| [`25_regression_test_tracker.csv`](validation/25_regression_test_tracker.csv) | 회귀 테스트 관리용 CSV |
| [`26_regression_test_tracker_sample.md`](validation/26_regression_test_tracker_sample.md) | 회귀 테스트 관리표 작성 예시 |
| [`26_regression_test_tracker_sample.csv`](validation/26_regression_test_tracker_sample.csv) | 회귀 테스트 관리 예시 CSV |

### release 템플릿

| 파일 | 용도 |
|---|---|
| [`27_release_gate_checklist.md`](release/27_release_gate_checklist.md) | 배포 게이트 체크리스트 |
| [`27_release_gate_checklist.csv`](release/27_release_gate_checklist.csv) | 배포 게이트 점검용 CSV |
| [`28_release_gate_checklist_sample.md`](release/28_release_gate_checklist_sample.md) | 배포 게이트 체크리스트 작성 예시 |
| [`28_release_gate_checklist_sample.csv`](release/28_release_gate_checklist_sample.csv) | 배포 게이트 점검 예시 CSV |

### logs 템플릿

| 파일 | 용도 |
|---|---|
| [`29_weekly_quality_log.md`](logs/29_weekly_quality_log.md) | 주간 품질 점검 기록 |
| [`29_weekly_quality_log.csv`](logs/29_weekly_quality_log.csv) | 주간 품질 점검 입력용 CSV |
| [`30_weekly_quality_log_sample.md`](logs/30_weekly_quality_log_sample.md) | 주간 품질 점검 기록 예시 |
| [`30_weekly_quality_log_sample.csv`](logs/30_weekly_quality_log_sample.csv) | 주간 품질 점검 입력 예시 CSV |

## 권장 사용 흐름

1. 문서형 작성이 필요하면 `*.md` 템플릿을 사용합니다.
2. 표 기반 입력이나 엑셀 전환이 필요하면 `*.csv` 템플릿을 사용합니다.
3. 작성 예시가 필요하면 `*_sample.md`, `*_sample.csv`를 참고합니다.
4. 실험 착수는 `operations/16_experiment_design.*`부터 시작합니다.
5. 검증과 배포는 `validation/`, `release/` 순서로 이어갑니다.
6. 주간 개선활동 기록은 `logs/29_weekly_quality_log.*`로 정리합니다.

## 개선활동 원칙

- 템플릿은 복사해 프로젝트별 문서로 사용합니다.
- `*.md`는 설명형, `*.csv`는 입력형, `*_sample.*`는 예시형 문서입니다.
- 원본 템플릿은 공통 포맷 기준이 바뀔 때만 수정합니다.
- 새 템플릿이 추가되면 이 README에 분류와 용도를 기록합니다.
