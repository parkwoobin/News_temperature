@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ==========================================
echo 🚀 새 GitHub 레포지토리 설정 및 배포
echo ==========================================
echo.

echo 1단계: GitHub에서 새 레포지토리 생성 필요
echo.
echo 다음 단계를 따라주세요:
echo.
echo 1. https://github.com 접속
echo 2. 오른쪽 상단 "+" → "New repository" 클릭
echo 3. Repository name 입력 (예: news-thermometer)
echo 4. Public 또는 Private 선택
echo 5. "Initialize this repository with" 체크박스 모두 해제
echo 6. "Create repository" 클릭
echo.
echo 새 레포지토리를 만들었으면 계속하세요.
echo.
pause

echo.
echo ==========================================
echo 2단계: 새 레포지토리 URL 입력
echo ==========================================
echo.
set /p NEW_REPO_URL="새 레포지토리 URL을 입력하세요 (예: https://github.com/USERNAME/REPO.git): "

if "%NEW_REPO_URL%"=="" (
    echo ❌ URL을 입력해야 합니다.
    pause
    exit /b 1
)

echo.
echo ==========================================
echo 3단계: 기존 원격 저장소 백업
echo ==========================================
echo.

git remote rename origin old-origin 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✅ 기존 원격 저장소를 old-origin으로 백업했습니다.
) else (
    echo ℹ️  기존 원격 저장소가 없거나 이미 백업되었습니다.
)

echo.
echo ==========================================
echo 4단계: 새 레포지토리 연결
echo ==========================================
echo.

git remote add origin %NEW_REPO_URL%

if %ERRORLEVEL% NEQ 0 (
    echo ❌ 레포지토리 연결 실패
    pause
    exit /b 1
)

echo ✅ 새 레포지토리 연결 완료
echo.

echo ==========================================
echo 5단계: deploy 브랜치 푸시 (모델 파일 포함)
echo ==========================================
echo ⚠️  이 작업은 시간이 오래 걸릴 수 있습니다 (3GB+)
echo.

git push -u origin deploy

if %ERRORLEVEL% NEQ 0 (
    echo ❌ 푸시 실패
    pause
    exit /b 1
)

echo.
echo ==========================================
echo ✅ 완료!
echo ==========================================
echo.
echo 새 레포지토리에 코드와 모델 파일이 푸시되었습니다!
echo.
echo 다음 단계:
echo 1. Railway.com 접속
echo 2. "New Project" → "Deploy from GitHub repo"
echo 3. 새 레포지토리 선택
echo 4. Branch: deploy 선택
echo 5. 배포 시작!
echo.
pause

