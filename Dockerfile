# 기본 nginx 이미지에서 시작
FROM nginx:1.21.5

# 패키지 관리자의 캐시를 정리
RUN apt-get clean

# 필요한 패키지를 설치
RUN apt-get update && \
    apt-get install -y nginx-extras logrotate && \
    rm -rf /var/lib/apt/lists/*
