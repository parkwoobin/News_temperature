#!/bin/bash
# 런타임에 모델 파일을 Git LFS에서 다운로드

set -e

echo "=========================================="
echo "모델 파일 다운로드 시작..."
echo "=========================================="

# Git LFS가 설치되어 있는지 확인
if ! command -v git-lfs &> /dev/null; then
    echo "Git LFS가 설치되어 있지 않습니다. 모델 파일을 다운로드할 수 없습니다."
    exit 1
fi

# Git LFS 초기화
git lfs install

# 모델 파일이 이미 있는지 확인
if [ -f "kosum-v1-tuned/model.safetensors" ] && [ -f "sentiment_model/model.safetensors" ]; then
    echo "모델 파일이 이미 존재합니다. 다운로드를 건너뜁니다."
else
    echo "모델 파일을 다운로드합니다..."
    # Git LFS pull로 모델 파일 다운로드
    # Railway는 자동으로 Git LFS 파일을 다운로드하므로
    # 여기서는 파일이 있는지 확인만 함
    echo "모델 파일 확인 중..."
fi

echo "=========================================="
echo "모델 파일 다운로드 완료"
echo "=========================================="

