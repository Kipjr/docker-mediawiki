ARG VERSION
FROM mediawiki:${VERSION}

# Exiftool
# ffmpeg
# pdftoppm
# imagemagick

WORKDIR /var/www/html
ADD --chmod=0755 get-extension.sh /tmp/
ADD --chmod=0644 extensions.list /tmp/
ADD --chmod=0755 extensions.manual.sh /tmp/
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer

RUN apt update && \
    apt install -y wget

ARG VERSION
RUN cd /var/www/html/extensions && \
    for i in $(cat /tmp/extensions.list); do /tmp/get-extension.sh $i $VERSION && tar -xzf $i*.tar.gz; done && rm -rf *.tar.gz && \
    cd /var/www/html && \
    /tmp/extensions.manual.sh && \
    chown www-data:www-data -R /var/www/html/extensions

# Galleries
# Upload
# Plugins
# Themes
# Template-extension
# Local
# _data

