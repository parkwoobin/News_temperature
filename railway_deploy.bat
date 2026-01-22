@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ==========================================
echo 🚀 Railway 무료 배포 가이드
echo ==========================================
echo.
echo Railway는 $5 무료 크레딧/월을 제공합니다!
echo.
echo 배포 방법:
echo.
echo 1. Railway 가입: https://railway.app
echo 2. GitHub 계정으로 로그인
echo 3. "New Project" → "Deploy from GitHub"
echo 4. 저장소 선택: JunHyeong99-umb/News_temperature
echo 5. Branch: deploy 선택
echo 6. Railway가 자동으로 Dockerfile 인식하고 배포!
echo.
echo ⚠️  모델 파일 포함 방법:
echo.
echo 옵션 A: Railway CLI 사용 (로컬 빌드)
echo   1. Railway CLI 설치: npm i -g @railway/cli
echo   2. railway login
echo   3. railway link
echo   4. railway up (로컬에서 빌드 후 배포)
echo.
echo 옵션 B: 모델 파일을 Git LFS로 GitHub에 푸시
echo   1. Git LFS로 모델 파일 푸시
echo   2. Railway가 자동으로 다운로드
echo.
echo ==========================================
echo.
echo 가장 간단한 방법:
echo 1. Railway 웹사이트에서 GitHub 저장소 연결
echo 2. Branch: deploy 선택
echo 3. 배포 시작!
echo.
echo 모델 파일은 나중에 Railway CLI로 추가하거나
echo Git LFS로 GitHub에 푸시하면 됩니다.
echo.
pause

