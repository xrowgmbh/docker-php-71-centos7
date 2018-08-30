FROM centos/php-71-centos7

USER 0

ENV COMPOSER_ALLOW_XDEBUG=1

# Install Apache httpd and PHP
RUN yum install -y && \
    INSTALL_PKGS="sclo-php${PHP_VER_SHORT}-php-pecl-redis sclo-php${PHP_VER_SHORT}-php-mcrypt \
                  sclo-php${PHP_VER_SHORT}-php-pecl-http sclo-php${PHP_VER_SHORT}-php-pecl-xdebug \ 
                  sclo-php${PHP_VER_SHORT}-php-pecl-amqp sclo-php${PHP_VER_SHORT}-php-pecl-msgpack \
                  sclo-php${PHP_VER_SHORT}-php-pecl-memcached sclo-php${PHP_VER_SHORT}-php-pecl-lzf \
                  sclo-php${PHP_VER_SHORT}-php-pecl-imagick sclo-php${PHP_VER_SHORT}-php-pecl-igbinary" && \
    yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS --nogpgcheck && \
    rpm -V $INSTALL_PKGS && \
    yum clean all -y

RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer -O - -q | php -- --quiet --install-dir=/usr/bin --filename=composer

USER 1001
