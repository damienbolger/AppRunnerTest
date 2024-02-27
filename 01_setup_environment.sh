#!/bin/bash


echo "update yum"
yum -y update

echo "Install php extensions"
yum install -y php-cli php-mbstring php-pear php-devel php-opcache php-intl php-mysqlnd php-gd php-exif php-xsl php-bcmath php-mysqli php-sodium php-mailparse
php --ini

yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install -y yum-utils
yum-config-manager --enable remi-php81
yum install -y php-imagick
php --ri imagick