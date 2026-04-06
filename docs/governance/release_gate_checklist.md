# 배포 게이트 체크리스트

## 문서 메타

| 항목 | 값 |
|---|---|
| 문서명 | `release_gate_checklist` |
| 버전 | `v0.2-draft` |
| 상태 | 보류 |
| 담당자 | 미지정 |
| 기준일 | 2026-04-01 |
| 관련 데이터 | `data/quality_checklist_raw_answer.csv` |

배포 정보:

| 항목 | 값 |
|---|---|
| 배포명 | `quality_release_draft` |
| 대상 버전 | `draft-2026-04-01` |
| 점검일 | 2026-04-01 |
| 점검자 | 미지정 |
| 승인자 | 미지정 |

## 배포 게이트 초안

| 점검 항목 | 현재 판단 | 결과 | 근거 문서 | 비고 |
|---|---|---|---|---|
| 평가셋 최신성 | 최근 질의를 반영한 평가셋 정비가 아직 미완료 | 보류 | `docs/checklists/answer_checklist_table.md` | 예측 질의, 멀티턴 추가 필요 |
| 검색 품질 | 검색 조합 비교와 Top-K 최적화는 진행중 | 조건부 | `docs/checklists/answer_checklist_table.md` | 원인 코드 체계화 필요 |
| 생성 품질 | Hallucination(환각) 억제는 진행중이나 생성 실패 분리 관리는 미착수 | 보류 | `docs/governance/generation_failure_casebook.md` | 생성 실패 축적 필요 |
| 출처 품질 | 출처 생성 흐름 검증이 미착수 | 보류 | `docs/checklists/answer_checklist_table.md` | Workflow 보강 필요 |
| 회귀 통제 | 회귀 테스트셋이 아직 초안 단계 | 보류 | `docs/records/templates/validation/regression_test_tracker.md` | 배포 전 필수 |
| 운영성 | 주간 기록 포맷 통일이 미착수 상태 | 조건부 | `docs/governance/weekly_quality_log_2026-W14.md` | 템플릿 운영 필요 |

## 최종 판정

| 항목 | 값 |
|---|---|
| 최종 판정 | 보류 |
| 핵심 리스크 | 평가셋 최신화 미완료, 생성 실패 분리 관리 미정착, 회귀 통제 문서 부족 |
| 선행 조치 | 평가셋 보강, 생성 실패 축적, 회귀 테스트 수행 |
