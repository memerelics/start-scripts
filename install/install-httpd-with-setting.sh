#!/bin/sh

# confirm that first this script is executed as root
if [ "`whoami`" != "root" ]; then
  echo "ERROR: should run as root"
  exit 1
fi

### mkdir(if not exist) and cd
mkdir /root/work
cd /root/work

### install Apache by yum
yum -y install httpd
yum -y install php php-mbstring

############################
#          NOTICE          #
############################
# if httpd version of yum package is updated,
# you need to change line number of following sed file
############################


### save current httpd.conf with current date
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.save`date +%Y%m%d`


############################
# prepare sed command file #
############################
cat <<EOF > tmp.sed
327,327{
        s/AllowOverride None/AllowOverride All/
}

1,/^END/{
        s/Options Indexes FollowSymLinks/Options Includes ExecCGI FollowSymLinks/
        s/#AddHandler cgi-script .cgi/AddHandler cgi-script .cgi .pl/
}
EOF
############################


### execute sed and save difference
sed -i -f tmp.sed /etc/httpd/conf/httpd.conf
diff /etc/httpd/conf/httpd.conf.save`date +%Y%m%d` /etc/httpd/conf/httpd.conf > diffsed.log



### change owner of document root 
chown -R apache.apache /var/www/html/

### make alias for perl
ln -s /usr/bin/perl /usr/local/bin/perl

### start httpd and set autorun
/etc/rc.d/init.d/httpd start
chkconfig httpd on

