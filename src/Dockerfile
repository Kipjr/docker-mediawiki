ARG VERSION
FROM mediawiki:${VERSION}

COPY php.ini /usr/local/etc/php/conf.d/mediawiki.ini
COPY mediawiki.conf /etc/apache2/sites-available/000-mediawiki.conf
RUN set -x; ln -s /etc/apache2/sites-available/000-mediawiki.conf /etc/apache2/sites-enabled/000-mediawiki.conf

COPY DockerSettings.php /var/www/html/DockerSettings.php
COPY CustomSettings.php /var/www/html/CustomSettings.php

VOLUME ["/var/www/html/images", "/var/www/html/skins", "/var/www/html/extensions"]