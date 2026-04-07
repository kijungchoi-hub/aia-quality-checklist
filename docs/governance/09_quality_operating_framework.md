# 답변 품질 개선활동 프레임워크

기준 문서:
- [`03_answer_checklist.md`](../checklists/03_answer_checklist.md)
- [`04_answer_checklist_table.csv`](../checklists/04_answer_checklist_table.csv)
- [`31_quality_checklist_overview.md`](../records/31_quality_checklist_overview.md)

작성일:
- 2026-04-01

목적:
- `answer` 품질 개선을 데이터, 검색, 생성, 개선활동의 공통 프레임으로 관리합니다.

## 문서 메타

| 항목 | 값 |
|---|---|
| 문서명 | `quality_operating_framework` |
| 버전 | `v0.2-draft` |
| 상태 | 진행중 |
| 담당자 | 미지정 |
| 기준일 | 2026-04-01 |
| 관련 데이터 | [`quality_checklist_raw_answer.csv`](../../data/quality_checklist_raw_answer.csv) |

## 1. 개선활동 범위

- 대상: `answer` 품질 체크리스트 전체 34개 항목
- 현재 상태: 진행중 25건, 미착수 9건
- 현재 우선 과제: 높음 우선순위 미착수 5건 우선 착수

## 2. 개선활동 구조

```text
Data Readiness
  -> Retrieval Quality
  -> Generation Quality
  -> Release Control
  -> Learning Loop
```

## 3. 단계별 개선활동 기준

| 단계 | 핵심 질문 | 현재 초안 상태 | 대표 산출물 |
|---|---|---|---|
| Data Readiness | 평가셋과 정답 매핑이 신뢰 가능한가 | 부분 준비 | 평가셋 초안, 검수 로그 |
| Retrieval Quality | 정답 청크(Chunk)가 안정적으로 상위 진입하는가 | 진행중 | 검색 실패 코드북 |
| Generation Quality | 검색 성공 후 grounded answer를 생성하는가 | 진행중 | 생성 실패 케이스북 |
| Release Control | 변경으로 인한 회귀와 부작용이 없는가 | 미정립 | 회귀 테스트셋, 배포 게이트 |
| Learning Loop | 결과와 실패가 같은 형식으로 축적되는가 | 미정립 | 주간 점검 기록 |

## 4. 현재 프로젝트 우선순위

1. 평가셋 최신화와 질문 유형 확장
2. 검색 실패 코드 체계화
3. 생성 실패 케이스 분리 관리
4. 검색 개선과 모델 튜닝 효과 분리 해석
5. 회귀 테스트셋 및 배포 게이트 운영

## 5. 주간 개선활동 체크포인트

- 평가셋 변경 여부
- 검색 실패 상위 원인
- 생성 실패 상위 유형
- 회귀 발생 여부
- 차주 실험 항목

## 6. 배포 최소 조건

- 최신 평가셋 존재
- 검색 실패 주요 원인 정리
- 생성 실패 주요 유형 정리
- 대표 회귀 테스트 수행 완료
- 배포 게이트 문서 승인 상태 확인
