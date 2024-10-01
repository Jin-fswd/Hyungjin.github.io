# PHP 최신 버전의 공식 이미지 사용
FROM php:latest

# 현재 디렉토리의 모든 파일을 컨테이너의 /var/www/html로 복사
COPY . /var/www/html

# Composer가 필요하다면 설치 (선택사항)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 필요한 PHP 확장 프로그램 설치 (예: mysqli)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# 컨테이너 시작 시 PHP 내장 서버를 사용하여 애플리케이션 실행
CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html"]
