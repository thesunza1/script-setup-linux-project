#!/bin/bash
echo "Script install apache2 php8.1 "
# decrelare
phpVer="8.1"

apt update -y && apt upgrade -y
apt install php$phpVer apache2 curl -y 
apt install libapache2-mod-php php-mbstring php-cli php-bcmath php-json php-xml php-zip php-pdo php-common php-tokenizer php-mysql php-curl

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer

apt install mysql-server -y
mysql_secure_installation <<EOF 
n
n
\n
\n
\n
EOF

mysql -e "CREATE USER 'root1'@'*' IDENTIFIED WITH authentication_plugin BY 'root'"
mysql -e "GRANT CREATE, ALTER, DROP, INSERT, UPDATE, INDEX, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'root'@'*' WITH GRANT OPTION"


