# 배포 시 모델 파일 처리 설명

## 현재 코드의 동작 방식

### 1. 감정 분석 모델 (`sentiment_model/`)

**로컬 모델이 있는 경우:**
- `./sentiment_model/` 경로에서 파인튜닝된 모델 로드
- 가장 정확한 감정 분석

**로컬 모델이 없는 경우:**
- Hugging Face에서 기본 모델 자동 다운로드 시도
  - `matthewburke/korean_sentiment`
  - `nlptown/bert-base-multilingual-uncased-sentiment`
- 또는 OpenAI API 사용 (사용자가 키 제공)

### 2. 요약 모델 (`kosum-v1-tuned/`)

**로컬 모델이 있는 경우:**
- `./kosum-v1-tuned/` 경로에서 파인튜닝된 모델 로드
- 가장 정확한 요약

**로컬 모델이 없는 경우:**
- Hugging Face에서 기본 모델 자동 다운로드
  - `gogamza/kobart-summarization` (한국어 요약 모델)
- 또는 OpenAI API 사용 (사용자가 키 제공)

## 배포 시나리오

### 시나리오 1: Free 플랜 + 모델 파일 없음

**동작:**
1. GitHub에서 코드만 가져옴 (모델 파일 없음)
2. 애플리케이션 시작 시 Hugging Face에서 모델 다운로드 시도
3. **문제**: Free 플랜(512MB RAM)에서는 모델 다운로드 실패 가능
4. **해결**: OpenAI API 모드만 사용 (사용자가 키 제공)

**결과:**
- ✅ 뉴스 검색: 작동
- ✅ 뉴스 요약: OpenAI API 사용 시 작동
- ✅ 감정 분석: OpenAI API 사용 시 작동
- ❌ 로컬 모델: 사용 불가

### 시나리오 2: Standard 플랜 + 모델 파일 없음

**동작:**
1. GitHub에서 코드만 가져옴
2. 애플리케이션 시작 시 Hugging Face에서 모델 다운로드
3. **성공**: Standard 플랜(2GB RAM)에서는 다운로드 가능

**결과:**
- ✅ 뉴스 검색: 작동
- ✅ 뉴스 요약: Hugging Face 기본 모델 사용
- ✅ 감정 분석: Hugging Face 기본 모델 사용
- ⚠️ 정확도: 파인튜닝된 모델보다 낮을 수 있음

### 시나리오 3: 로컬에서 Docker 빌드 + Docker Hub 푸시

**동작:**
1. 로컬에서 Docker 이미지 빌드 (모델 파일 포함)
2. Docker Hub에 푸시
3. Render에서 Docker Hub 이미지 사용

**결과:**
- ✅ 모든 기능 작동
- ✅ 파인튜닝된 모델 사용 가능
- ✅ 최고 성능

## 현재 Dockerfile의 동작

```dockerfile
COPY . .  # GitHub의 코드만 복사 (모델 파일 없음)
```

**결과:**
- 모델 파일이 없으면 Hugging Face에서 자동 다운로드 시도
- Free 플랜에서는 메모리 부족으로 실패 가능
- Standard 플랜 이상에서는 작동 가능

## 추천 방법

### Free 플랜 사용 시:
1. 현재 상태 그대로 배포 (모델 파일 없음)
2. 웹사이트에서 "OpenAI API" 모드만 사용
3. 자신의 OpenAI API 키 입력

### Standard 플랜 이상 사용 시:
1. 현재 상태 그대로 배포
2. Hugging Face 기본 모델 자동 다운로드됨
3. 정확도가 낮으면 나중에 로컬 모델 추가 가능

### 최고 성능 원할 시:
1. 로컬에서 Docker 이미지 빌드 (모델 포함)
2. Docker Hub에 푸시
3. Render에서 Docker Hub 이미지 사용

## 결론

**현재 설정으로도 배포 가능합니다!**
- 모델 파일 없어도 작동하도록 설계됨
- Free 플랜: OpenAI API 모드만 사용
- Standard 플랜: Hugging Face 기본 모델 사용

