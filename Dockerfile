FROM alpine:latest

RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.16/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/v3.16/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update
RUN apk --update --no-cache add curl ca-certificates nginx
RUN apk add php7.2 php7.2-xml php7.2-exif php7.2-fpm php7.2-session php7.2-soap php7.2-openssl php7.2-gmp php7.2-pdo_odbc php7.2-json php7.2-dom php7.2-pdo php7.2-zip php7.2-mysqli php7.2-sqlite3 php7.2-pdo_pgsql php7.2-bcmath php7.2-gd php7.2-odbc php7.2-pdo_mysql php7.2-pdo_sqlite php7.2-gettext php7.2-xmlreader php7.2-bz2 php7.2-iconv php7.2-pdo_dblib php7.2-curl php7.2-ctype php7.2-phar php7.2-fileinfo php7.2-mbstring php7.2-tokenizer php7.2-simplexml
COPY --from=composer:latest  /usr/bin/composer /usr/bin/composer

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh


CMD ["/bin/ash", "/entrypoint.sh"]
