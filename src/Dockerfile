FROM mediawiki:stable

ARG VERSION=REL1_39
# Exiftool
# ffmpeg
# pdftoppm
# imagemagick

WORKDIR /var/www/html
ADD --chmod=0740 get-extension.sh /tmp/
ADD --chmod=0640 extensions.list /tmp/
RUN apt update && apt install -y wget
RUN cd /var/www/html/extensions && \
    for i in $(cat /tmp/extensions.list); do /tmp/get-extension.sh $i $VERSION && tar -xzf $i*.tar.gz; done && rm -rf *.tar.gz


# Galleries
# Upload
# Plugins
# Themes
# Template-extension
# Local
# _data

