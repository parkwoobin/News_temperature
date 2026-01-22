# Railway 배포 단계별 가이드

## 1단계: Railway 가입

1. 브라우저에서 https://railway.app 접속
2. 오른쪽 상단 "Login" 또는 "Get Started" 클릭
3. "Continue with GitHub" 클릭
4. GitHub 계정으로 로그인 (권한 허용)

## 2단계: 새 프로젝트 생성

1. Railway 대시보드에서 "New Project" 버튼 클릭
2. "Deploy from GitHub repo" 선택
3. GitHub 저장소 목록에서 `News_temperature` 찾기
   - 또는 `JunHyeong99-umb/News_temperature` 검색
4. 저장소 클릭

## 3단계: 브랜치 선택

1. "Which branch do you want to deploy?" 화면에서
2. `deploy` 브랜치 선택
3. "Deploy" 또는 "Add Service" 클릭

## 4단계: 자동 배포 시작

Railway가 자동으로:
- Dockerfile 인식
- Git LFS에서 모델 파일 다운로드
- 이미지 빌드 시작
- 배포 시작

## 5단계: 설정 확인 (선택사항)

1. 서비스 클릭
2. "Settings" 탭
3. "Resources" 섹션에서:
   - Memory: 2GB 이상 권장 (무료 크레딧으로 사용 가능)

## 6단계: 배포 완료 확인

1. "Deployments" 탭에서 빌드 진행 상황 확인
2. 빌드 완료되면 "View Logs"에서 로그 확인
3. 배포 완료되면 URL 생성됨 (예: `https://xxx.up.railway.app`)

## 문제 해결

### 모델 파일 다운로드 실패 시
- Railway가 Git LFS를 자동으로 지원하므로 문제없어야 함
- 로그에서 확인 가능

### 메모리 부족 시
- Settings → Resources → Memory 증가
- 무료 크레딧으로 2GB까지 사용 가능

## 완료!

배포가 완료되면 제공된 URL로 접속하여 테스트하세요!

