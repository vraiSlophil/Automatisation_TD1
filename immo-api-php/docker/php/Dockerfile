FROM php:8.4

RUN apt-get update && apt-get install -y \
    curl \
    git \
    zip \
    unzip \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer