#!/bin/sh
# basically based on 
# http://docs.icinga.org/latest/en/quickstart-icinga.html
# http://d.hatena.ne.jp/dharry/20100923/1285187469

### check httpd is already running
if [ "`pgrep httpd`" = "" ]; then
  echo "httpd should be running before installing nagios"
  exit 1
fi

# confirm that first this script is executed as root
if [ "`whoami`" != "root" ]; then
  echo "ERROR: should run as root"
  exit 1
fi

############################
## install required yums  ##
############################
yum -y install gcc glibc glibc-common gd gd-devel
yum -y install libjpeg libjpeg-devel libpng libpng-devel
yum -y install net-snmp net-snmp-devel

### if also install IDOUtils
yum -y install libdbi 

############################
#      install icinga      #
############################
mkdir -p /root/work/src
cd /root/work/src
wget http://sourceforge.net/projects/icinga/files/icinga/1.2.1/icinga-1.2.1.tar.gz
tar zvxf icinga-1.2.1.tar.gz
cd icinga-1.2.1


useradd -m icinga
passwd icinga
/usr/sbin/groupadd icinga
/usr/sbin/groupadd icinga-cmd
/usr/sbin/usermod -a -G icinga-cmd icinga
/usr/sbin/usermod -a -G icinga-cmd www-data
/usr/sbin/usermod -a -G icinga-cmd apache

#  DON'T FORGET TO INSTALL NAGIOS PLUGINs

./configure --with-command-group=icinga-cmd
make all
make install

#install init.d scripts
make install-init
# install sample config files
make install-config
make install-commandmode 

# mod email => future, sed
vi /usr/local/icinga/etc/objects/contacts.cfg

############################
##   for "classic" web    ##
############################
# TODO: define what each make doin'
make cgis
make install-cgis
make install-html

# install Icinga/Apache conf file to: /etc/httpd/conf.d/icinga.conf
make install-webconf

############################
#   icinga web Basic user  #
############################
htpasswd -c /usr/local/icinga/etc/htpasswd.users icingaadmin

# restart Apache
/etc/init.d/httpd restart


# verify "TODO:if wrong format, stop running icinga"
/usr/local/icinga/bin/icinga -v /usr/local/icinga/etc/icinga.cfg


############################
#   finally start Icinga   #
############################
chkconfig --add icinga
chkconfig icinga on
/etc/init.d/icinga start


echo "now you can check classic frontend."
echo "by default, it's in... http://<ADDRESS>/icinga/"
