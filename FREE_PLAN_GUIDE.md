# Free 플랜 사용 가이드

## ⚠️ Free 플랜의 제약사항

### 문제점
1. **메모리 부족**: 512MB RAM만 제공
   - 모델 파일 로딩 불가능 (최소 2GB 필요)
   - 로컬 모델 사용 불가

2. **기능 제한**:
   - ✅ 뉴스 검색: 작동 가능
   - ✅ 뉴스 요약: 작동 가능 (OpenAI API 사용 시)
   - ❌ 감정 분석: 로컬 모델 불가능
   - ✅ 감정 분석: OpenAI API만 가능 (사용자가 API 키 제공 필요)

3. **서비스 제한**:
   - 비활성 시 자동 종료 (15분 비활성)
   - 재시작 시 느림

## 💡 Free 플랜 사용 방법

### 방법 1: OpenAI API만 사용 (권장)

1. **Render 설정**:
   - Language: **Docker** 선택
   - Instance Type: **Free** 선택 (일단 시도)
   - Branch: `deploy`

2. **사용 시**:
   - 웹사이트에서 "OpenAI API" 모드 선택
   - 자신의 OpenAI API 키 입력
   - 감정 분석과 요약 모두 OpenAI API 사용

3. **장점**:
   - 무료로 시작 가능
   - 모든 기능 사용 가능 (OpenAI API 키 필요)

4. **단점**:
   - OpenAI API 사용 비용 발생 (사용량에 따라)
   - 로컬 모델 사용 불가

### 방법 2: Railway 무료 플랜 시도

Railway는 더 많은 무료 크레딧을 제공합니다:
- $5 무료 크레딧/월
- Standard 플랜 ($5/월)을 무료 크레딧으로 사용 가능
- 더 많은 메모리 제공

### 방법 3: 모델 없이 배포 (기능 제한)

- 뉴스 검색만 작동
- 감정 분석 기능 비활성화
- 요약 기능 제한적

## 🚀 Free 플랜 배포 단계

1. **Render 설정**:
   ```
   Language: Docker
   Branch: deploy
   Instance Type: Free (일단 시도)
   ```

2. **배포 후 테스트**:
   - `/api/health` 확인
   - 뉴스 검색 테스트
   - OpenAI API 모드로 감정 분석 테스트

3. **메모리 부족 시**:
   - Railway 무료 크레딧 사용
   - 또는 OpenAI API만 사용

## 💰 비용 비교

| 방법 | 월 비용 | 기능 |
|------|---------|------|
| Render Free + OpenAI API | $0 + API 사용료 | 모든 기능 (API 키 필요) |
| Railway 무료 크레딧 | $0 (제한적) | 모든 기능 |
| Render Standard | $25 | 모든 기능 (로컬 모델) |

## 추천

**Free 플랜으로 시작하되, OpenAI API 모드만 사용하는 것을 권장합니다!**

1. Render Free로 배포
2. 웹사이트에서 OpenAI API 모드 선택
3. 자신의 OpenAI API 키 사용
4. 나중에 필요하면 Standard로 업그레이드

