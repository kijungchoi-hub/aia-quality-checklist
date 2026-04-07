# AI 품질 체크리스트 20분 슬라이드형 시연영상 큐시트

## 목적

[`presentation_script_20min_clean.md`](presentation_script_20min_clean.md)을 기준으로 슬라이드형 시연영상을 제작하기 위한 장면 구성표입니다.

형식은 "슬라이드 중심 + 저장소 화면 캡처 + 핵심 문서 확대"를 전제로 합니다.

## 기본 제작 가이드

- 총 길이: 18분에서 20분
- 화면 비율: 16:9
- 스타일: 슬라이드형 설명 영상
- 화면 구성: 제목 슬라이드, 구조 다이어그램, 문서 캡처, 핵심 포인트 자막
- 내레이션: 발표 대본 요약형 낭독
- 전환: 컷 전환 또는 짧은 디졸브
- 자막 원칙: 한 줄 18자 내외, 최대 2줄

## 장면 구성

### 1. 오프닝

- 시간: 0:00-0:40
- 화면: 제목 슬라이드
- 슬라이드 제목: PM과 프로젝트 리더를 위한 AI 품질 체크리스트 체계
- 화면 요소:
  - 저장소명
  - 발표 제목
  - 부제: 기준 문서, 실행 문서, 판단 기준, 기록 구조
- 내레이션 핵심:
  - 오늘 발표 목적
  - 세 가지 설명 축 소개

### 2. 왜 PM과 프로젝트 리더에게 체계가 필요한가

- 시간: 0:40-2:30
- 화면: 문제 인식 슬라이드
- 슬라이드 제목: 왜 AI 품질은 흔들리는가
- 화면 요소:
  - 데이터 변경
  - 프롬프트 변경
  - 검색 구성 변경
  - 모델 변경
  - 회귀 위험
- 추천 시각화:
  - 하나의 질문에 여러 결과가 나오는 흐름도
  - "결과만 보고 원인을 단정하기 어렵다" 강조 박스
- 내레이션 핵심:
  - AI 품질은 단일 원인이 아니다
  - PM과 프로젝트 리더는 품질 리스크를 관리 가능한 구조로 봐야 한다

### 3. 전체 문서 구조 소개

- 시간: 2:30-4:20
- 화면: 저장소 구조 슬라이드
- 슬라이드 제목: 문서 구조는 네 묶음이다
- 화면 요소:
  - [`checklists`](../docs/checklists/README.md)
  - [`projects`](../docs/projects/README.md)
  - [`governance`](../docs/governance/README.md)
  - [`records`](../docs/records/README.md)
- 추천 화면:
  - 루트 [`README.md`](../README.md) 일부 캡처
  - [`docs/README.md`](../docs/README.md) 일부 캡처
- 내레이션 핵심:
  - 기준을 잡고
  - 실행으로 옮기고
  - 판단을 맞추고
  - 기록으로 축적한다

### 4. checklists 설명

- 시간: 4:20-6:50
- 화면: 체크리스트 비교 슬라이드
- 슬라이드 제목: 체크리스트는 세 층으로 본다
- 화면 요소:
  - [`03_answer_checklist.md`](../docs/checklists/03_answer_checklist.md)
  - [`05_summary_checklist.md`](../docs/checklists/05_summary_checklist.md)
  - [`01_ai_rag_service_checklist.md`](../docs/checklists/01_ai_rag_service_checklist.md)
- 추천 화면:
  - 세 문서의 제목과 목차 영역 캡처
- 자막 포인트:
  - 답변형 상세 기준
  - 요약형 상세 기준
  - 공통 RAG 프레임
- 내레이션 핵심:
  - 셋 중 하나만 고르는 구조가 아니다
  - 공통 기준 + 유형별 상세 기준으로 쓴다

### 5. projects 설명

- 시간: 6:50-8:40
- 화면: 실행 관리 슬라이드
- 슬라이드 제목: PM과 프로젝트 리더가 실행 계획으로 바꾸는 곳
- 추천 화면:
  - [`08_ai_rag_service_project_tracker.md`](../docs/projects/08_ai_rag_service_project_tracker.md) 표 캡처
- 강조 포인트:
  - 우선순위
  - 상태
  - 담당자
  - 진행률
  - 비고
- 내레이션 핵심:
  - 체크리스트는 질문 목록
  - 관리표는 실행 단위이자 리스크 관리 단위
  - 여기서 실제 할 일과 의사결정 기준이 정해진다

### 6. governance 설명

- 시간: 8:40-12:10
- 화면: 판단 기준 슬라이드
- 슬라이드 제목: 같은 기준으로 실패를 본다
- 추천 화면:
  - [`09_quality_operating_framework.md`](../docs/governance/09_quality_operating_framework.md)
  - [`10_search_failure_codebook.md`](../docs/governance/10_search_failure_codebook.md)
  - [`11_generation_failure_casebook.md`](../docs/governance/11_generation_failure_casebook.md)
  - [`12_manual_auto_review_log.md`](../docs/governance/12_manual_auto_review_log.md)
  - [`13_release_gate_checklist.md`](../docs/governance/13_release_gate_checklist.md)
- 슬라이드 구성:
  - 검색 실패 분류
  - 생성 실패 분류
  - 수동/자동 평가 통합
  - 배포 전 게이트
- 내레이션 핵심:
  - 팀마다 말이 달라도 분류 기준은 같아야 한다
  - 같은 기준이 있어야 개선이 누적된다

### 7. records 설명

- 시간: 12:10-15:00
- 화면: 품질 운영 기록 슬라이드
- 슬라이드 제목: 실험과 검증이 남아야 자산이 된다
- 추천 화면:
  - [`31_quality_operating_overview.md`](../docs/governance/31_quality_operating_overview.md)
  - [`16_experiment_design.md`](../docs/records/templates/operations/16_experiment_design.md)
  - [`29_weekly_quality_log.md`](../docs/records/templates/logs/29_weekly_quality_log.md)
  - [`25_regression_test_tracker.md`](../docs/records/templates/validation/25_regression_test_tracker.md)
- 강조 포인트:
  - 가설
  - 변경 전/후
  - 리스크
  - 회귀 확인
  - 주간 기록
- 내레이션 핵심:
  - 실험이 쌓여야 다음 사람이 이어받을 수 있다
  - 기록이 있어야 반복 실험을 줄일 수 있다

### 8. 실제 적용 흐름

- 시간: 15:00-17:30
- 화면: 전체 흐름 슬라이드
- 슬라이드 제목: 실제 적용 순서
- 흐름:
  1. 데이터 확인
  2. 체크리스트 선택
  3. 프로젝트 관리표 반영
  4. governance 기준 정렬
  5. records 기록
  6. 배포 게이트 점검
- 추천 시각화:
  - 왼쪽에서 오른쪽으로 이어지는 프로세스 화살표
- 내레이션 핵심:
  - 전체 흐름은 복잡해 보여도 운영 단계는 단순하다

### 9. 마무리

- 시간: 17:30-19:30
- 화면: 요약 슬라이드
- 슬라이드 제목: 핵심 메시지 세 가지
- 화면 요소:
  1. AI 품질은 데이터, 검색, 생성, 평가, 회귀, 정책을 함께 봐야 한다
  2. 체크리스트만으로는 부족하고, 실행 문서와 판단 기준, 기록 문서가 붙어야 한다
  3. 이 구조가 있어야 시행착오가 조직 자산으로 바뀐다
- 내레이션 핵심:
  - 이번 문서는 PM과 프로젝트 리더가 재사용할 수 있는 품질 관리 구조다

### 10. 엔딩

- 시간: 19:30-20:00
- 화면: Q&A 슬라이드
- 슬라이드 제목: 질문 받겠습니다
- 화면 요소:
  - 저장소 경로
  - 핵심 문서 3개
    - [`README.md`](../README.md)
    - [`08_ai_rag_service_project_tracker.md`](../docs/projects/08_ai_rag_service_project_tracker.md)
    - [`09_quality_operating_framework.md`](../docs/governance/09_quality_operating_framework.md)

## 촬영용 화면 캡처 우선순위

1. [`README.md`](../README.md)
2. [`docs/README.md`](../docs/README.md)
3. [`03_answer_checklist.md`](../docs/checklists/03_answer_checklist.md)
4. [`05_summary_checklist.md`](../docs/checklists/05_summary_checklist.md)
5. [`01_ai_rag_service_checklist.md`](../docs/checklists/01_ai_rag_service_checklist.md)
6. [`08_ai_rag_service_project_tracker.md`](../docs/projects/08_ai_rag_service_project_tracker.md)
7. [`09_quality_operating_framework.md`](../docs/governance/09_quality_operating_framework.md)
8. [`13_release_gate_checklist.md`](../docs/governance/13_release_gate_checklist.md)
9. [`31_quality_operating_overview.md`](../docs/governance/31_quality_operating_overview.md)
10. [`16_experiment_design.md`](../docs/records/templates/operations/16_experiment_design.md)

## 자막 제작 팁

- 한 슬라이드당 핵심 문장은 1개만 둡니다.
- 문서 캡처는 전체 화면보다 제목 + 핵심 표/목차를 확대합니다.
- 긴 문장은 자막으로 그대로 넣지 말고 8초 기준 1문장으로 줄입니다.
- 문서 경로는 자막보다 하단 캡션으로 처리하는 편이 더 깔끔합니다.

## 권장 제작 순서

1. [`presentation_script_20min_clean.md`](presentation_script_20min_clean.md) 기준으로 내레이션 녹음
2. 본 큐시트 기준으로 슬라이드 초안 작성
3. 문서 캡처 이미지 수집
4. 슬라이드에 캡처 삽입
5. 자막 축약본 작성
6. 편집 툴에서 타이밍 정렬

## 최종 산출물 권장 구성

- 발표 대본: [`presentation_script_20min_clean.md`](presentation_script_20min_clean.md)
- 장면 큐시트: [`presentation_storyboard_20min_slides.md`](presentation_storyboard_20min_slides.md)
- 발표 원본: [`presentation_script_20min_utf8.txt`](presentation_script_20min_utf8.txt)
