### check run as root
if [ "`whoami`" != "root" ]; then
echo "ERROR: should run as root"
  exit 1
fi
if [ -z "`which mysql`" ]; then
echo "ERROR: Please install mysql first"
  exit 1
fi

yum -y install zabbix zabbix-agent zabbix-server zabbix-server-mysql zabbix-web zabbix-web-mysql

### set following to /etc/my.cnf
# [mysqld]
# ...default...
# default-character-set=utf8
# skip-character-set-client-handshake
#
# [mysqld]
# ...default...


service mysqld start
mysqladmin create zabbix --default-character-set=utf8


echo " ENTER THESE COMMANDS"
echo " mysql> grant all privileges on zabbix.* to zabbix@localhost identified by 'zabbix';"
echo " mysql> flush privileges;"
echo " mysql> quit"
mysql -uroot


echo "NOTICE:: From now, script import default data into zabbix DB. it may take time..."
mysql -uroot zabbix < /usr/share/doc/zabbix-server-mysql-1.8.5/create/schema/mysql.sql
mysql -uroot zabbix < /usr/share/doc/zabbix-server-mysql-1.8.5/create/data/data.sql
mysql -uroot zabbix < /usr/share/doc/zabbix-server-mysql-1.8.5/create/data/images_mysql.sql


#########################

service httpd start
rm /etc/zabbix/zabbix.conf.php
