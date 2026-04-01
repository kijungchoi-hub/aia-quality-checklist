# Answer Quality 운영 템플릿 모음

이 폴더는 `answer` 품질 개선 프로젝트에서 바로 사용할 수 있는 실무형 템플릿 모음이다.

## 사용 원칙

- CSV/XLSX가 없어도 Markdown 표만으로 운영 가능하도록 작성했다.
- 표의 첫 행은 예시이므로 실제 사용 시 복제하거나 교체해서 사용한다.
- 상태값은 가능하면 `미착수 / 진행중 / 완료 / 보류`로 통일한다.
- 주간 운영 시 파일명을 바꾸기보다 이력을 하단에 누적하거나 복사본을 만든다.

## 템플릿 목록

| 파일명 | 용도 |
|---|---|
| `answer_evaluation_dataset_template.md` | 평가셋/검증셋 관리 |
| `answer_manual_auto_review_log_template.md` | 수동+자동 평가 통합 기록 |
| `answer_search_failure_codebook_template.md` | 검색 실패 원인 코드 및 사례 관리 |
| `answer_generation_failure_casebook_template.md` | 생성 실패 사례 관리 |
| `answer_regression_testset_template.md` | 회귀 테스트셋 및 결과 추적 |
| `answer_release_gate_checklist_template.md` | 배포 전 최종 점검 |
| `answer_weekly_quality_report_template.md` | 주간 품질 운영 보고 |
| `answer_expansion_validation_matrix_template.md` | 타 영역 확장 검증 |

## 권장 운영 순서

1. 평가셋은 `answer_evaluation_dataset_template.md`로 먼저 정비한다.
2. 실험 중 실패 사례는 검색/생성 케이스북에 분리 누적한다.
3. 변경 반영 전에는 회귀 테스트셋과 배포 게이트 체크리스트를 반드시 점검한다.
4. 주간 보고에는 핵심 결과와 회귀, 차주 계획을 동일 형식으로 남긴다.
