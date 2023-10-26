FROM alpine:3.12

RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.12/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/v3.12/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk --update --no-cache add curl ca-certificates nginx
RUN apk add php7.3 php7.3-xml php7.3-exif php7.3-fpm php7.3-session php7.3-soap php7.3-openssl php7.3-gmp php7.3-pdo_odbc php7.3-json php7.3-dom php7.3-pdo php7.3-zip php7.3-mysqli php7.3-sqlite3 php7.3-pdo_pgsql php7.3-bcmath php7.3-gd php7.3-odbc php7.3-pdo_mysql php7.3-pdo_sqlite php7.3-gettext php7.3-xmlreader php7.3-bz2 php7.3-iconv php7.3-pdo_dblib php7.3-curl php7.3-ctype php7.3-phar php7.3-fileinfo php7.3-mbstring php7.3-tokenizer php7.3-simplexml
COPY --from=composer:latest  /usr/bin/composer /usr/bin/composer

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh


CMD ["/bin/ash", "/entrypoint.sh"]
