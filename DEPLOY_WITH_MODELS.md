# 파인튜닝 모델 포함 배포 가이드

## 목표
로컬에 있는 파인튜닝된 모델 파일들을 Docker 이미지에 포함하여 배포

## 방법: 로컬에서 Docker 이미지 빌드 후 Docker Hub 푸시

### 1단계: Docker Hub 계정 생성
1. https://hub.docker.com 접속
2. 계정 생성 (무료)

### 2단계: 로컬에서 Docker 이미지 빌드

```bash
# 현재 디렉토리에서 (모델 파일이 있는 곳)
docker build -t news-thermometer .
```

**중요**: 모델 파일이 로컬에 있어야 합니다!
- `kosum-v1-tuned/model.safetensors`
- `sentiment_model/model.safetensors`
- 기타 모델 파일들

### 3단계: Docker Hub에 로그인

```bash
docker login
# 사용자명과 비밀번호 입력
```

### 4단계: 이미지 태그 지정 및 푸시

```bash
# YOUR_USERNAME을 Docker Hub 사용자명으로 변경
docker tag news-thermometer YOUR_USERNAME/news-thermometer:latest

# Docker Hub에 푸시 (시간이 오래 걸릴 수 있음, 2GB+)
docker push YOUR_USERNAME/news-thermometer:latest
```

### 5단계: Render에서 Docker Hub 이미지 사용

Render 설정:
- **Docker Image**: `YOUR_USERNAME/news-thermometer:latest`
- **Instance Type**: Standard 이상 (모델 로딩을 위해)
- GitHub 연결 불필요

## 빠른 실행 스크립트

Windows용 배치 파일을 만들어드리겠습니다.

