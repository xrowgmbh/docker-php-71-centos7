FROM centos/php-71-centos7

USER 0

ENV COMPOSER_ALLOW_XDEBUG=1 \
    PHP_VER_SHORT=71

# Install Apache httpd and PHP
RUN INSTALL_PKGS="sclo-php71-php-pecl-redis sclo-php71-php-mcrypt \
                  sclo-php71-php-pecl-http sclo-php71-php-pecl-xdebug \ 
                  sclo-php71-php-pecl-amqp sclo-php71-php-pecl-msgpack \
                  sclo-php71-php-pecl-memcached sclo-php71-php-pecl-lzf \
                  sclo-php71-php-pecl-imagick sclo-php71-php-pecl-igbinary" && \
    yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS --nogpgcheck && \
    rpm -V $INSTALL_PKGS && \
    yum clean all -y

RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer -O - -q | php -- --quiet --install-dir=/usr/bin --filename=composer

USER 1001
