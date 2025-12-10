# Railway Dockerfile 인식 오류 해결 방법

## 문제
Railway가 Dockerfile을 찾지 못하고 Railpack이 자동 감지를 시도하고 있습니다.

## 해결 방법

### 방법 1: Railway 웹 인터페이스에서 설정 변경

1. Railway 대시보드에서 프로젝트 클릭
2. 서비스 클릭
3. **"Settings"** 탭 클릭
4. **"Build & Deploy"** 섹션 찾기
5. **"Build Command"** 섹션에서:
   - **"Dockerfile"** 선택
   - 또는 **"Custom"** 선택 후 빈 값으로 두기
6. **"Save"** 클릭
7. **"Redeploy"** 클릭

### 방법 2: railway.json 확인

railway.json 파일이 루트에 있고 올바르게 설정되어 있는지 확인:

```json
{
  "build": {
    "builder": "DOCKERFILE",
    "dockerfilePath": "Dockerfile"
  }
}
```

### 방법 3: Railway CLI 사용

Railway CLI로 직접 배포:

```bash
# Railway CLI 설치
npm i -g @railway/cli

# 로그인
railway login

# 프로젝트 연결
railway link

# 배포
railway up
```

### 방법 4: 서비스 삭제 후 재생성

1. Railway에서 현재 서비스 삭제
2. 새 서비스 생성
3. **"Deploy from GitHub repo"** 선택
4. 저장소: `parkwoobin/News_temperature`
5. Branch: `deploy`
6. Railway가 자동으로 Dockerfile 인식해야 함

## 확인사항

- ✅ Dockerfile이 루트 디렉토리에 있는지 확인
- ✅ railway.json이 올바르게 설정되어 있는지 확인
- ✅ deploy 브랜치에 Dockerfile이 포함되어 있는지 확인

## 빠른 해결책

Railway 웹 인터페이스에서:
1. 서비스 → Settings → Build & Deploy
2. Builder를 "Dockerfile"로 명시적으로 설정
3. Redeploy

