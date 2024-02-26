#!/bin/bash

echo "build php extensions"

yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install yum-utils -y
yum-config-manager --enable remi-php81
yum install -y php-cli php-imagick php-mbstring php-pear php-devel php-imagick php-opcache php-intl php-mysqlnd php-gd php-exif php-xsl php-bcmath php-mysqli php-sodium php-mailparse
