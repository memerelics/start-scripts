#!/bin/sh
### check run as root
if [ "`whoami`" != "root" ]; then
    echo "ERROR: should run as root"
    exit 1
fi

if [ "`rpm -qa | grep vnc`" != "" ]; then
    yum -y groupinstall "X Window System" "GNOME Desktop Environment"
else
    echo "already installed vnc yum files."
    echo "please check rest setting."
    exit 1
fi


### save current vncservers with current date
cp /etc/sysconfig/vncservers /etc/sysconfig/vncservers.save`date +%Y%m%d`

###  edit vnc-servers file
cat <<EOF >> /etc/sysconfig/vncservers

VNCSERVERS="5:hash"
VNCSERVERARGS[5]="-geometry 800x600 -nohttpd"
EOF
# display num = 5 is just for test


############################
#    setting as an user    #
############################
su hash

### first time, run vncserver as an user
echo "set password, which used when connect from local machine"
vncserver :5 

### change xstartup file
sed 's/xterm/# xterm/' ~/.vnc/xstartup 
sed 's/twm/# twm/' ~/.vnc/xstartup
echo "gnome-session &" >> ~/.vnc/xstartup

### kill vnc server
kill `pgrep Xvnc`

### back to root
sudo su -

### run & set initial run
/etc/init.d/vncserver start
chkconfig vncserver on
chkconfig --list vncserver


echo <<__EOF 
now you can use GUI from remote machine by using some VNC clients.
Mac: Chickin of the VNC, for example.
__EOF

