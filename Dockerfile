# Python 3.11 기반 이미지 사용
FROM python:3.11-slim

# 작업 디렉토리 설정
WORKDIR /app

# 시스템 패키지 업데이트 및 필요한 도구 설치
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    curl \
    && rm -rf /var/lib/apt/lists/*

# requirements.txt 복사 및 의존성 설치
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# 애플리케이션 코드 복사 (모델 파일 제외)
COPY app.py .
COPY src/ src/
COPY static/ static/
COPY requirements.txt .
COPY kosum-v1-tuned/*.json kosum-v1-tuned/ 2>/dev/null || mkdir -p kosum-v1-tuned
COPY kosum-v1-tuned/*.txt kosum-v1-tuned/ 2>/dev/null || true
COPY sentiment_model/*.json sentiment_model/ 2>/dev/null || mkdir -p sentiment_model
COPY sentiment_model/*.txt sentiment_model/ 2>/dev/null || true
COPY sentiment_model/training_args.bin sentiment_model/ 2>/dev/null || true

# temp 및 static 디렉토리 생성
RUN mkdir -p temp static kosum-v1-tuned sentiment_model sentiment_model/checkpoint-50 sentiment_model/checkpoint-73194

# 포트 노출
EXPOSE 8000

# 환경 변수 설정
ENV PYTHONUNBUFFERED=1
ENV PORT=8000

# 헬스체크 추가
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
    CMD curl -f http://localhost:${PORT:-8000}/api/health || exit 1

# 서버 실행 (프로덕션 모드)
# PORT 환경 변수를 사용하거나 기본값 8000 사용
CMD sh -c "uvicorn app:app --host 0.0.0.0 --port ${PORT:-8000} --workers 1"

