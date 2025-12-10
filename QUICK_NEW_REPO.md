# 새 GitHub 레포지토리 빠른 설정

## 방법 1: 스크립트 사용 (추천)

1. GitHub에서 새 레포지토리 생성
   - https://github.com → "+" → "New repository"
   - 이름: `news-thermometer` (또는 원하는 이름)
   - Public/Private 선택
   - **체크박스 모두 해제** (README, .gitignore 등)
   - "Create repository" 클릭

2. `setup_new_repo.bat` 실행
   - 새 레포지토리 URL 입력
   - 자동으로 푸시됨

## 방법 2: 수동으로 하기

### 1. GitHub에서 새 레포지토리 생성
- 위와 동일

### 2. 로컬에서 실행
```bash
# 기존 원격 저장소 백업
git remote rename origin old-origin

# 새 레포지토리 연결 (YOUR_USERNAME과 REPO_NAME 변경)
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git

# deploy 브랜치 푸시 (모델 파일 포함)
git push -u origin deploy
```

## 완료 후

Railway에서 새 레포지토리를 선택하여 배포하면 됩니다!

