@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ==========================================
echo 🚀 파인튜닝 모델 포함 Docker 이미지 빌드 및 푸시
echo ==========================================
echo.

REM Docker 설치 확인
where docker >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Docker가 설치되어 있지 않습니다.
    echo    Docker Desktop 설치: https://docs.docker.com/get-docker/
    pause
    exit /b 1
)

echo ✅ Docker 확인 완료
echo.

REM 모델 파일 확인
if not exist "kosum-v1-tuned\model.safetensors" (
    echo ⚠️  경고: kosum-v1-tuned\model.safetensors 파일이 없습니다.
    echo    모델 파일이 있는지 확인하세요.
    echo.
)

if not exist "sentiment_model\model.safetensors" (
    echo ⚠️  경고: sentiment_model\model.safetensors 파일이 없습니다.
    echo    모델 파일이 있는지 확인하세요.
    echo.
)

echo.
echo Docker Hub 사용자명을 입력하세요:
set /p DOCKER_USERNAME="사용자명: "

if "%DOCKER_USERNAME%"=="" (
    echo ❌ 사용자명을 입력해야 합니다.
    pause
    exit /b 1
)

echo.
echo ==========================================
echo 1단계: Docker 이미지 빌드 중...
echo ==========================================
echo 이 작업은 시간이 오래 걸릴 수 있습니다 (5-10분)
echo.

docker build -t news-thermometer .

if %ERRORLEVEL% NEQ 0 (
    echo ❌ 이미지 빌드 실패
    pause
    exit /b 1
)

echo.
echo ✅ 이미지 빌드 완료
echo.

echo ==========================================
echo 2단계: Docker Hub에 로그인...
echo ==========================================
echo.

docker login

if %ERRORLEVEL% NEQ 0 (
    echo ❌ Docker Hub 로그인 실패
    pause
    exit /b 1
)

echo.
echo ✅ 로그인 완료
echo.

echo ==========================================
echo 3단계: 이미지 태그 지정...
echo ==========================================
echo.

docker tag news-thermometer %DOCKER_USERNAME%/news-thermometer:latest

echo ✅ 태그 지정 완료
echo.

echo ==========================================
echo 4단계: Docker Hub에 푸시 중...
echo ==========================================
echo ⚠️  이 작업은 매우 오래 걸릴 수 있습니다 (10-30분)
echo     모델 파일이 크기 때문입니다 (2GB+)
echo     네트워크 연결이 안정적인지 확인하세요.
echo.

docker push %DOCKER_USERNAME%/news-thermometer:latest

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
echo Docker Hub 이미지: %DOCKER_USERNAME%/news-thermometer:latest
echo.
echo 다음 단계:
echo 1. Render.com 접속
echo 2. "New +" → "Web Service"
echo 3. "Docker Image" 선택
echo 4. 이미지 이름 입력: %DOCKER_USERNAME%/news-thermometer:latest
echo 5. Instance Type: Standard 이상 선택
echo 6. 배포 시작!
echo.
pause

