# PHP 최신 버전의 공식 이미지 사용
FROM php:latest

# 애플리케이션 파일을 컨테이너 내로 복사
COPY . /var/www/html

# PHP 내장 서버를 실행하도록 설정
CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html"]
