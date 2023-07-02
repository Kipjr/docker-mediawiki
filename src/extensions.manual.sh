#!/bin/bash


# DynamicPageList3
cd /var/www/html/extensions/
EXT_VERSION="REL1_39";
wget -O /var/www/html/extensions/${EXT_VERSION}.tar.gz  https://github.com/Universal-Omega/DynamicPageList3/archive/${EXT_VERSION}.tar.gz && tar -xzf ${EXT_VERSION}.tar.gz && mv "DynamicPageList3-${EXT_VERSION}" DynamicPageList3  && rm -rf ${EXT_VERSION}.tar.gz

# Bootstrap
cd /var/www/html
COMPOSER_ALLOW_SUPERUSER=1
COMPOSER=composer.local.json composer require --no-update mediawiki/bootstrap:~4.0
composer update mediawiki/bootstrap --no-dev -o
COMPOSER_ALLOW_SUPERUSER=0
