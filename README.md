# Nginx Reverse Proxy 설정

### 1. nginx-extra와 logrotate를 사용하는 nginx docker image 빌드

```bash
docker build -t deepv/nginx .
```

### 2. 각종 설정 관련

##### logrotate설정 파일

`./nginx/lgorotate.conf`

##### docker-compose.yml 설정

Reverse Porxy 서버 IP 수정

```yml
environment:
  - BACKEND_SERVER=x.x.x.x:8080
```

ssl 인증서 지정

```yml
volumes:
  - ./ssl/cert.pem:/cert.pem:ro
  - ./ssl/key.pem:/key.pem:ro
```

log 위치 지정

```yml
volumes:
  - ./log:/var/log/nginx
```

### 3. docker 실행

```bash
docker compose up -d
```

### 4. logrotate 실행 확인

```bash
docker compose exec nginx /usr/sbin/logrotate  -f /etc/logrotate.conf
```

### Appendix 1. 인증서 crt 파일이 여러개인 경우

crt 파일이 여러개인 경우 파일 하나로 합치는 과정이 필요 함

```bash
cat example.com.crt > cert.pem
cat sub.ca.crt >> cert.pem
cat ca.crt >> cert.pem
```
