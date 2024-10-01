# PHP 최신 버전의 공식 이미지 사용
FROM php:latest

# Composer 복사 및 설치
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 애플리케이션 의존성을 먼저 설치 (캐시 활용)
COPY composer.json /var/www/html/
RUN cd /var/www/html && composer install --no-dev --optimize-autoloader

# 애플리케이션 파일 복사
COPY . /var/www/html

# 필요한 PHP 확장 프로그램 설치
RUN docker-php-ext-install mysqli pdo pdo_mysql

# 컨테이너 시작 시 PHP 내장 서버 실행
CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html"]
