ARG VERSION=lts
FROM mediawiki:${VERSION}
ENV MW_CONFIG_FILE=/var/www/html/conf.d/LocalSettings.php
ARG UID=1000 GID=1000
RUN --mount=type=bind,target=/tmp \
    set -x; \
    cp /tmp/php.ini /usr/local/etc/php/conf.d/mediawiki.ini \
    cp /tmp/mediawiki.conf /etc/apache2/sites-available/000-mediawiki.conf \
    # https://www.mediawiki.org/wiki/Manual:Security#File_permissions
    ln -s /etc/apache2/sites-available/000-mediawiki.conf /etc/apache2/sites-enabled/000-mediawiki.conf; \
    mkdir /var/www/html/conf.d; \
    chown -R ${UID}:${GID} /var/www/html/*; \
    chown -R www-data:www-data extensions skins cache images; \
    chmod -R go-w /var/www/html/*
VOLUME ["/var/www/html/conf.d","/var/www/html/images", "/var/www/html/skins", "/var/www/html/extensions"]
