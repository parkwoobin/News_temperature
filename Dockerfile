# 멀티 스테이지 빌드로 이미지 크기 최적화
# Stage 1: 빌드 스테이지
FROM python:3.11-slim as builder

WORKDIR /app

# 빌드에 필요한 도구만 설치
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# requirements.txt 복사 및 의존성 설치
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir --user -r requirements.txt

# Stage 2: 런타임 스테이지 (최소한의 베이스 이미지)
FROM python:3.11-slim

WORKDIR /app

# 런타임에 필요한 최소한의 패키지만 설치
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# 빌드 스테이지에서 설치한 패키지 복사
COPY --from=builder /root/.local /root/.local

# Python 경로 설정
ENV PATH=/root/.local/bin:$PATH

# 디렉토리 구조 생성
RUN mkdir -p temp static kosum-v1-tuned sentiment_model sentiment_model/checkpoint-50 sentiment_model/checkpoint-73194

# 애플리케이션 코드 복사
COPY app.py .
COPY src/ src/
COPY static/ static/

# 설정 파일만 명시적으로 복사 (모델 파일 제외)
COPY kosum-v1-tuned/config.json kosum-v1-tuned/
COPY kosum-v1-tuned/generation_config.json kosum-v1-tuned/
COPY kosum-v1-tuned/special_tokens_map.json kosum-v1-tuned/
COPY kosum-v1-tuned/tokenizer.json kosum-v1-tuned/
COPY kosum-v1-tuned/tokenizer_config.json kosum-v1-tuned/

COPY sentiment_model/config.json sentiment_model/
COPY sentiment_model/special_tokens_map.json sentiment_model/
COPY sentiment_model/tokenizer.json sentiment_model/
COPY sentiment_model/tokenizer_config.json sentiment_model/

# 포트 노출 (Railway가 자동으로 PORT 설정)
EXPOSE 8000

# 환경 변수 설정
ENV PYTHONUNBUFFERED=1

# 서버 실행 (프로덕션 모드)
# Railway의 PORT 환경 변수 사용 (Railway가 자동으로 설정)
CMD python -c "import os; port = int(os.environ.get('PORT', 8000)); import uvicorn; uvicorn.run('app:app', host='0.0.0.0', port=port, workers=1)"
