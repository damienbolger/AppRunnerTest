#!/bin/bash


echo "disable yum priorities"
yum --disableplugin=priorities

echo "update yum"
yum -y update

echo "INSTALL PHP EXTENSIONS"
yum install -y php-cli php-mbstring php-pear php-devel php-opcache php-intl php-mysqlnd php-gd php-exif php-xsl php-bcmath php-mysqli php-mailparse
php --ini

echo "INSTALL EPEL AND REMI REPOS"
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install -y yum-utils
yum-config-manager --disable 'remi-php*'
yum-config-manager --enable remi-php81
yum repolist
echo "INSTALL IMAGICK ****************************"
yum install -y php-imagick
yum install -y php-sodium
php --ri imagick