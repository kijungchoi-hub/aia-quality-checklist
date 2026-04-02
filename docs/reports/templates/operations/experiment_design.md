# 품질개선 실험 설계서 템플릿 (Experiment Design Template)


---

## 1. 기본 정보

- 실험명 (Experiment Name):
- 작성일 (Date):
- 작성자 (Owner):
- 대상 서비스/기능 (Scope):
- 관련 문서 (References):

---

## 2. 실험 배경

- 현재 문제 현상 (Current Issue):
- 문제 발생 위치:
- 기대하는 개선 결과 (Target Outcome):

---

## 3. 실험 가설

- 가설 (Hypothesis):
- 왜 이 가설이 유효한가 (Rationale):

---

## 4. 변경 내용

- 변경 대상 축 (Control Tower):
- 변경 전 (Before):
- 변경 후 (After):
- 영향을 받을 수 있는 질의군:

---

## 5. 비교 기준

- Baseline 버전:
- 평가셋 버전:
- 정답지/Chuck 적합성 확인 여부:
- 수동 검수 병행 여부:

---

## 6. 성공 기준

| 지표 (Metric) | 현재값 (Current) | 목표값 (Target) | 비고 (Note) |
|---|---:|---:|---|
| Top-K Hit Rate |  |  |  |
| Grounded Answer Rate |  |  |  |
| Hallucination Rate |  |  |  |
| Manual Review Score |  |  |  |

---

## 7. 리스크 및 부작용

- 예상 리스크:
- 회귀 가능 구간:
- 배포 보류 조건:

---

## 8. 산출물

- 실험 비교표:
- 실패 코드북 반영:
- 생성 실패 케이스북 반영:
- 회귀 테스트 결과:

---

## 9. 최종 판단

- 결과 분류 (`Adopt` / `Revise` / `Reject`):
- 판단 사유:
- 후속 액션:

---

## 10. 작성 예시 (Example)

- 실험명 (Experiment Name): 약관 질의 검색 조합 개선
- 작성일 (Date): 2026-04-02
- 작성자 (Owner): 검색 품질 담당
- 대상 서비스/기능 (Scope): 약관/정책 질의 응답
- 관련 문서 (References): `answer_quality_checklist_report_final.md`

- 현재 문제 현상 (Current Issue): 약관 관련 질의에서 정답 근거 문서가 Top-3 안에 안정적으로 들어오지 않음
- 문제 발생 위치: 검색 단계
- 기대하는 개선 결과 (Target Outcome): 정답 Chuck Top-3 진입률 향상

- 가설 (Hypothesis): `BM25 + Dense + Reranker` 조합을 적용하면 정답 근거 회수율이 높아질 것이다
- 왜 이 가설이 유효한가 (Rationale): 현재는 Dense only 검색으로 약관 조항 키워드가 충분히 반영되지 않음

- 변경 대상 축 (Control Tower): 검색 품질 (Retrieval)
- 변경 전 (Before): Dense only, Top-K 5
- 변경 후 (After): BM25 + Dense + Reranker, Top-K 10 후 리랭킹
- 영향을 받을 수 있는 질의군: 약관, 수수료, 해지 조건

- Baseline 버전: retrieval_v1
- 평가셋 버전: eval_2026_04_v2
- 정답지/Chuck 적합성 확인 여부: 확인 완료
- 수동 검수 병행 여부: 병행

| 지표 (Metric) | 현재값 (Current) | 목표값 (Target) | 비고 (Note) |
|---|---:|---:|---|
| Top-K Hit Rate | 61 | 70 | Top-3 기준 |
| Grounded Answer Rate | 72 | 78 | 검색 성공 시 동반 개선 기대 |
| Hallucination Rate | 11 | 8 | 부작용 점검 필요 |
| Manual Review Score | 3.4 | 4.0 | 5점 척도 |

- 예상 리스크: 노이즈 문서 증가
- 회귀 가능 구간: FAQ성 짧은 질의
- 배포 보류 조건: Hallucination Rate 증가

- 실험 비교표: retrieval_comparison_v2.xlsx
- 실패 코드북 반영: 예정
- 생성 실패 케이스북 반영: 검색 성공 후 오답 사례만 반영
- 회귀 테스트 결과: 배포 전 수행 예정

- 결과 분류 (`Adopt` / `Revise` / `Reject`): Revise
- 판단 사유: Top-K Hit Rate는 상승했으나 노이즈 비율 추가 점검 필요
- 후속 액션: 메타 필터와 Reranker 임계값 조정 후 재실험



