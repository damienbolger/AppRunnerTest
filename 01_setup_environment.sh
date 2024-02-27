#!/bin/bash


echo "CHECK IMAGICK ****************************"
php --ri imagick

echo "disable yum priorities ****************************"
echo -e "[main]\nenabled=0" | tee /etc/yum/pluginconf.d/priorities.conf
echo "check yum priorities"
cat /etc/yum/pluginconf.d/priorities.conf

echo "INSTALL EPEL AND REMI REPOS ****************************"
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
echo "update yum and install utils ****************************"
yum -y update
yum install -y yum-utils

echo "enable remi-php81 ****************************"
yum-config-manager --disable 'remi-php*'
yum-config-manager --enable remi-php81

echo "INSTALL IMAGICK ****************************"
yum install -y php-imagick
yum install -y php-sodium

echo "enable yum priorities ****************************"
echo -e "[main]\nenabled=1" | tee /etc/yum/pluginconf.d/priorities.conf
echo "check yum priorities now..."
cat /etc/yum/pluginconf.d/priorities.conf


echo "disable remi-php81 ****************************"
yum-config-manager --disable 'remi-php*'


echo "update yum with remi repo disabled ****************************"
yum -y update

echo "INSTALL REGULAR PHP EXTENSIONS ****************************"
yum install -y php-cli php-mbstring php-pear php-devel php-opcache php-intl php-mysqlnd php-gd php-exif php-xsl php-bcmath php-mysqli php-mailparse

echo "upgrade pear ****************************"
pear upgrade PEAR


echo "REBUILD oniguruma ****************************"
yum install -y oniguruma
sudo ldconfig


echo "CHECK IMAGICK ****************************"
php --ri imagick