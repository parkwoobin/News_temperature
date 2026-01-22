# Dockerfile이 뭔가요?

## 간단 설명

**Dockerfile**은 Docker 이미지를 만드는 레시피입니다.

### 비유로 설명하면:
- **레시피** = Dockerfile
- **요리** = Docker 이미지 빌드
- **요리된 음식** = Docker 이미지
- **음식 먹기** = 컨테이너 실행

## Dockerfile의 역할

1. **어떤 환경에서 실행할지** (예: Python 3.11)
2. **어떤 파일들을 복사할지** (예: app.py, requirements.txt)
3. **어떤 패키지를 설치할지** (예: pip install -r requirements.txt)
4. **어떻게 실행할지** (예: uvicorn app:app)

## 현재 프로젝트의 Dockerfile

우리 프로젝트의 Dockerfile은:

1. **Python 3.11 환경** 사용
2. **필요한 패키지 설치** (requirements.txt)
3. **코드 복사** (app.py, src/ 등)
4. **서버 실행** (uvicorn app:app)

## 왜 필요한가요?

Railway 같은 클라우드 플랫폼은:
- Dockerfile을 읽어서
- 자동으로 환경을 만들고
- 앱을 실행합니다

**Dockerfile 없으면** Railway가 어떻게 앱을 실행할지 모릅니다!

## 현재 Dockerfile 위치

프로젝트 루트에 `Dockerfile` 파일이 있습니다.

## 확인 방법

```bash
# Dockerfile이 있는지 확인
dir Dockerfile

# 내용 보기
type Dockerfile
```

