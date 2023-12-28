# Nginx Reverse Proxy 설정

### 1. nginx-extra와 logrotate를 사용하는 nginx docker image 빌드  
nginx는 debian 계열 이미지를 이용해야한다. (alpine 이미지 사용 불가)
> nginx-extra가 debaian에서 사용 가능한 package다.  

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
# cron 실행 확인
docker compose exec nginx service cron status
# crontab 등록 내역 확인
docker compose exec nginx crontab -l
# logrotate 강제 실행
docker compose exec nginx /usr/sbin/logrotate  -f /etc/logrotate.conf
```

### Appendix 1. 인증서 crt 파일이 여러개인 경우

crt 파일이 여러개인 경우 파일 하나로 합치는 과정이 필요 함

```bash
cat example.com.crt > cert.pem
cat sub.ca.crt >> cert.pem
cat ca.crt >> cert.pem
```


