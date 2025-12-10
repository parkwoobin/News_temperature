# Railway 무료 배포 가이드 (카드 정보 불필요)

## Railway의 장점

✅ **카드 정보 없이 시작 가능**
✅ **$5 무료 크레딧/월 제공**
✅ **Standard 플랜 사용 가능 (2GB RAM)**
✅ **모델 파일 자동 다운로드 (Git LFS)**

## Railway 배포 단계

### 1단계: Railway 가입
1. https://railway.app 접속
2. "Start a New Project" 클릭
3. GitHub 계정으로 로그인 (카드 정보 불필요!)

### 2단계: 프로젝트 생성
1. "Deploy from GitHub repo" 선택
2. 저장소 선택: `JunHyeong99-umb/News_temperature`
3. Branch: `deploy` 선택
4. Railway가 자동으로 Dockerfile 인식

### 3단계: 설정 확인
- Railway가 자동으로 설정하지만, 필요시:
  - Memory: 2GB 이상 (무료 크레딧으로 사용 가능)
  - Git LFS에서 모델 파일 자동 다운로드

### 4단계: 배포 완료
- 배포가 완료되면 URL이 생성됨
- 파인튜닝 모델이 포함되어 정상 작동!

## 비용

- **첫 달**: 완전 무료 ($5 크레딧 제공)
- **이후**: $5/월 (Standard 플랜)
- **카드 정보**: 필요 없음 (무료 크레딧 사용 시)

## Render vs Railway 비교

| 항목 | Render | Railway |
|------|--------|---------|
| 카드 정보 | 필요 (Standard 이상) | 불필요 (무료 크레딧) |
| 무료 크레딧 | 없음 | $5/월 |
| 시작 난이도 | 쉬움 | 쉬움 |
| 모델 지원 | 가능 | 가능 |

## 추천

**Railway를 사용하세요!**
- 카드 정보 없이 시작 가능
- 무료 크레딧 제공
- 모델 파일 자동 다운로드

Render 화면을 닫고 Railway로 가세요!

