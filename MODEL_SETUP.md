# 모델 파일 설정 가이드

## 현재 상황

GitHub에는 모델 파일이 없지만, 애플리케이션은 다음 경로에서 모델을 찾습니다:
- `./sentiment_model/` - 감정 분석 모델
- `./kosum-v1-tuned/` - 요약 모델

## 해결 방법

### 방법 1: 로컬에서 Docker 이미지 빌드 후 Docker Hub 푸시 (권장) ⭐

**장점**: 가장 확실하고 간단함

**단계**:
1. 로컬에서 Docker 이미지 빌드 (모델 파일 포함)
2. Docker Hub에 푸시
3. Render에서 Docker Hub 이미지 사용

```bash
# 1. 로컬에서 빌드 (모델 파일 포함)
docker build -t news-thermometer .

# 2. Docker Hub에 로그인
docker login

# 3. 태그 지정 (YOUR_USERNAME을 실제 사용자명으로 변경)
docker tag news-thermometer YOUR_USERNAME/news-thermometer

# 4. Docker Hub에 푸시
docker push YOUR_USERNAME/news-thermometer
```

**Render 설정**:
- Docker Image: `YOUR_USERNAME/news-thermometer:latest`
- GitHub 연결 불필요

### 방법 2: 모델 없이 배포 + OpenAI API만 사용 (Free 플랜)

**장점**: 무료로 시작 가능

**단계**:
1. 현재 상태 그대로 배포 (모델 파일 없음)
2. 웹사이트에서 "OpenAI API" 모드만 사용
3. 사용자가 자신의 OpenAI API 키 입력

**동작**:
- 모델 파일이 없으면 자동으로 Hugging Face에서 다운로드 시도
- 또는 OpenAI API 사용
- Free 플랜에서는 메모리 부족으로 모델 다운로드 실패 가능

### 방법 3: Dockerfile 수정하여 모델 다운로드

모델 파일을 별도 스토리지(Google Drive, S3 등)에 저장하고 Dockerfile에서 다운로드

**예시**:
```dockerfile
# 모델 다운로드 (Google Drive 공유 링크 사용)
RUN mkdir -p sentiment_model kosum-v1-tuned
RUN curl -L "YOUR_GOOGLE_DRIVE_DOWNLOAD_URL" -o models.zip
RUN unzip models.zip && rm models.zip
```

## 현재 코드의 동작

코드를 보면 모델이 없어도 작동하도록 설계되어 있습니다:

1. **감정 분석 모델**:
   - `./sentiment_model` 없으면 → Hugging Face에서 다운로드 시도
   - 실패하면 → OpenAI API 사용 (사용자가 키 제공)

2. **요약 모델**:
   - `./kosum-v1-tuned` 없으면 → Hugging Face 기본 모델 사용
   - 또는 OpenAI API 사용

## 추천 방법

### Free 플랜 사용 시:
→ **방법 2**: 모델 없이 배포하고 OpenAI API만 사용

### 유료 플랜 사용 시:
→ **방법 1**: 로컬에서 Docker 이미지 빌드 후 Docker Hub 푸시

## 빠른 해결책

**지금 바로 할 수 있는 것**:
1. Render Free로 배포 (모델 없이)
2. 웹사이트에서 "OpenAI API" 모드 선택
3. 자신의 OpenAI API 키 사용

이렇게 하면 모델 파일 없이도 모든 기능 사용 가능!

