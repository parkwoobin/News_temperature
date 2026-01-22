# 새 GitHub 레포지토리 생성 및 배포 가이드

## 방법 1: GitHub 웹사이트에서 새 레포지토리 생성

### 1단계: 새 레포지토리 생성
1. https://github.com 접속
2. 오른쪽 상단 "+" → "New repository" 클릭
3. Repository name: `news-thermometer` (또는 원하는 이름)
4. Description: "뉴스 온도계 - 뉴스 감정 분석 및 요약 서비스"
5. Public 또는 Private 선택
6. **"Initialize this repository with" 체크박스 모두 해제** (기존 코드 푸시할 거니까)
7. "Create repository" 클릭

### 2단계: 로컬에서 새 레포지토리 연결
```bash
# 현재 레포지토리 백업 (선택사항)
git remote rename origin old-origin

# 새 레포지토리 연결
git remote add origin https://github.com/YOUR_USERNAME/news-thermometer.git

# deploy 브랜치 푸시
git push -u origin deploy
```

## 방법 2: 기존 레포지토리 사용 (더 간단)

현재 레포지토리(`JunHyeong99-umb/News_temperature`)에 이미 모델 파일이 LFS로 푸시되어 있으므로, 그냥 Railway에서 이 레포지토리를 사용하면 됩니다!

