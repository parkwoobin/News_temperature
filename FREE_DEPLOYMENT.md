# 무료로 파인튜닝 모델 포함 배포 방법

## 방법 1: Railway 무료 크레딧 사용 (가장 추천) ⭐

Railway는 **$5 무료 크레딧/월**을 제공합니다!

### 장점:
- ✅ 완전 무료 (한 달간)
- ✅ Standard 플랜 사용 가능 (2GB RAM)
- ✅ 모델 파일 포함 배포 가능
- ✅ GitHub 연동 자동 배포

### 단계:

1. **Railway 가입**
   - https://railway.app 접속
   - GitHub 계정으로 로그인

2. **새 프로젝트 생성**
   - "New Project" → "Deploy from GitHub"
   - 저장소 선택: `JunHyeong99-umb/News_temperature`
   - Branch: `deploy` 선택

3. **모델 파일 포함 방법**:
   
   **옵션 A: 로컬에서 Docker 빌드 후 Railway에 푸시**
   ```bash
   # Railway CLI 설치
   npm i -g @railway/cli
   
   # 로그인
   railway login
   
   # 프로젝트 연결
   railway link
   
   # 로컬에서 빌드 (모델 포함)
   docker build -t news-thermometer .
   
   # Railway에 배포
   railway up
   ```
   
   **옵션 B: 모델 파일을 GitHub에 Git LFS로 푸시**
   - Git LFS 사용하여 모델 파일 푸시
   - Railway가 자동으로 다운로드

4. **설정**:
   - Memory: 2GB 이상
   - Railway가 자동으로 Dockerfile 인식

### 비용:
- 첫 달: **무료** ($5 크레딧)
- 이후: $5/월 (Standard 플랜)

---

## 방법 2: Fly.io 무료 티어 사용

Fly.io는 **무료 티어**를 제공합니다!

### 장점:
- ✅ 완전 무료 (제한적)
- ✅ 3GB RAM 제공
- ✅ 모델 파일 포함 가능

### 단계:

1. **Fly.io 가입**
   - https://fly.io 접속
   - 계정 생성

2. **Fly.io CLI 설치**
   ```bash
   # Windows (PowerShell)
   iwr https://fly.io/install.ps1 -useb | iex
   ```

3. **로그인 및 배포**
   ```bash
   fly auth login
   fly launch
   ```

4. **fly.toml 설정** (자동 생성됨, 수정 필요)
   ```toml
   [build]
     dockerfile = "Dockerfile"
   
   [vm]
     memory_mb = 2048  # 2GB RAM
   ```

### 제한사항:
- 무료 티어는 제한적 (트래픽 제한)
- 3GB RAM까지 무료

---

## 방법 3: Google Cloud Run 무료 티어

Google Cloud는 **무료 티어**를 제공합니다!

### 장점:
- ✅ 매월 무료 크레딧 제공
- ✅ 2GB RAM까지 무료
- ✅ 사용한 만큼만 과금

### 단계:

1. **Google Cloud 계정 생성**
   - https://cloud.google.com
   - $300 무료 크레딧 제공 (신규 사용자)

2. **Cloud Run에 배포**
   ```bash
   # Google Cloud SDK 설치
   # https://cloud.google.com/sdk/docs/install
   
   # 프로젝트 설정
   gcloud config set project YOUR_PROJECT_ID
   
   # 이미지 빌드 및 배포
   gcloud builds submit --tag gcr.io/YOUR_PROJECT_ID/news-thermometer
   gcloud run deploy news-thermometer \
     --image gcr.io/YOUR_PROJECT_ID/news-thermometer \
     --platform managed \
     --region asia-northeast3 \
     --memory 2Gi \
     --allow-unauthenticated
   ```

### 비용:
- 첫 3개월: **무료** ($300 크레딧)
- 이후: 사용한 만큼만 과금 (매우 저렴)

---

## 방법 4: 모델 파일을 별도 스토리지에 저장 (완전 무료)

모델 파일을 Google Drive/Dropbox에 저장하고 런타임에 다운로드

### 장점:
- ✅ 완전 무료
- ✅ 어떤 플랫폼이든 사용 가능

### 단계:

1. **모델 파일을 Google Drive에 업로드**
   - Google Drive에 모델 파일 업로드
   - 공유 링크 생성

2. **Dockerfile 수정**
   ```dockerfile
   # 모델 다운로드 (Google Drive)
   RUN curl -L "YOUR_GOOGLE_DRIVE_DOWNLOAD_URL" -o models.zip
   RUN unzip models.zip -d . && rm models.zip
   ```

3. **배포**
   - Render Free 플랜 사용 가능
   - 모델은 런타임에 다운로드

---

## 추천 순서

1. **Railway 무료 크레딧** (가장 간단)
2. **Fly.io 무료 티어** (완전 무료)
3. **Google Cloud Run** (신규 사용자 $300 크레딧)
4. **모델 별도 저장** (완전 무료, 설정 복잡)

## 빠른 시작: Railway 추천

Railway가 가장 간단하고 빠릅니다:
1. 가입 (GitHub 연동)
2. 프로젝트 생성
3. GitHub 저장소 연결
4. 자동 배포!

**한 달 무료로 사용 가능합니다!**

