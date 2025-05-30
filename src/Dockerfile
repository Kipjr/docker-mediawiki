ARG VERSION=lts
FROM mediawiki:${VERSION}
ENV MW_CONFIG_FILE=/var/www/html/conf.d/LocalSettings.php
COPY php.ini /usr/local/etc/php/conf.d/mediawiki.ini
COPY mediawiki.conf /etc/apache2/sites-available/000-mediawiki.conf
RUN set -x;\
    ln -s /etc/apache2/sites-available/000-mediawiki.conf /etc/apache2/sites-enabled/000-mediawiki.conf; \
    mkdir /var/www/html/conf.d;

VOLUME ["/var/www/html/conf.d","/var/www/html/images", "/var/www/html/skins", "/var/www/html/extensions"]
