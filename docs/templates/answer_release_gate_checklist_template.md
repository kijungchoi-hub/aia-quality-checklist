# Answer Release Gate Checklist Template

목적:
- 운영 반영 전 필수 점검 항목을 동일 기준으로 확인한다.

## 배포 정보

| 항목 | 값 |
|---|---|
| 배포명 | release_x |
| 대상 버전 | vX |
| 점검일 | YYYY-MM-DD |
| 점검자 | 이름 |
| 승인자 | 이름 |

## 배포 게이트 체크리스트

| 점검 항목 | 확인 질문 | 결과 | 근거 문서 | 비고 |
|---|---|---|---|---|
| 평가셋 최신성 | 최근 운영 질의 패턴이 반영됐는가 | 확인필요 | evaluation_dataset_v2 |  |
| 검색 품질 | 정답 Chunk 진입률 기준을 충족하는가 | 확인필요 | retrieval_report |  |
| 생성 품질 | 주요 hallucination 케이스가 통제됐는가 | 확인필요 | generation_casebook |  |
| 출처 품질 | 답변-근거 매핑이 가능한가 | 확인필요 | source_mapping_report |  |
| 회귀 통제 | 대표 시나리오 회귀가 없는가 | 확인필요 | regression_testset |  |
| 운영성 | 기록, 모니터링, 롤백 기준이 있는가 | 확인필요 | weekly_report / runbook |  |

## 최종 판정

| 항목 | 값 |
|---|---|
| 최종 판정 | 승인 / 조건부승인 / 보류 |
| 핵심 리스크 |  |
| 선행 조치 |  |
