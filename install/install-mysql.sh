#!/bin/sh

# run as root

### check run as root
if [ "`whoami`" != "root" ]; then
echo "ERROR: should run as root"
  exit 1
fi

# NOTICE: this one work on Fedora, so need more packages in CentOS

yum -y install mysql-server

###### still not set ######
###   [mysqld]
###   datadir=/var/lib/mysql
###   socket=/var/lib/mysql/mysql.sock
###   # Default to using old password format for compatibility with mysql 3.x
###   # clients (those using the mysqlclient10 compatibility package).
###   old_passwords=1
###   default-character-set = utf8 # add
###   
###   [mysql]
###   default-character-set = utf8 # add
###### still not set ######

cp /etc/my.cnf /etc/my.cnf.save`date +%Y%m%d`
cat /etc/my.cnf | tee tmp
/etc/init.d/mysqld start
chkconfig mysqld on
mysql_secure_installation


###### set up expect #######
###  Enter current password for root (enter for none):
###  =>enter
###  Set root password? [Y/n]
###  =>enter（means Y）
###
###  New password:
###  Re-enter new password:
###  //=> enter by yourself
###
###  Remove anonymous users? [Y/n]
###  =>enter
###  Disallow root login remotely? [Y/n]
###  =>enter  (now cannot login from remote as root)
###  Remove test database and access to it? [Y/n]
###  =>enter
###  Reload privilege tables now? [Y/n]
###  =>enter
###### set up expect #######

mysql -p
rm -rf tmp
