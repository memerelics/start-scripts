#!/bin/sh
# this start-script should be run
# after 1st script.

### confirm that following part is executed as hash ###
if [ "`whoami`" != "hash" ]; then
  echo "ERROR: should run as hash"
  exit 1
fi

##### 3. install git #####
sudo yum -y install zlib-devel
sudo yum -y install gcc
sudo yum -y install perl
sudo yum -y install perl-ExtUtils-MakeMaker

# for lower level packages (for example, Sakura VPS)
sudo yum -y install make build-essential tcl8.4 tk8.4 gettext

# for tclsh failed; using unoptimized loading

# in this section run as hash, no need sudo.(hamatta)
mkdir -p /home/hash/work/src
cd /home/hash/work/src
wget http://git-core.googlecode.com/files/git-1.7.7.tar.gz
tar xvzf git-1.7.7.tar.gz

cd git-1.7.7

# compile, and install.
./configure --prefix=/usr/local
make
sudo make install

##### 5. setup git #####

#run as hash
if [ "`whoami`" != "hash" ]; then
  echo "ERROR: should run as hash"
  exit 1
fi

git config --global user.name "takuyahashimoto"
git config --global user.email takuya21hashimoto@gmail.com

cd /home/hash
mkdir git

#########################################
########     GitHub settings    #########
#########################################
### references
# http://help.github.com/key-setup-redirect/
# http://help.github.com/troubleshooting-ssh/

### check git is already installed
if [ "`git --version | awk '{print $1,$2}'`" != "git version" ]; then
  echo "git should be installed before setup github pub.key"
  exit 1
fi

mkdir ~/.ssh

echo "/////// enter keyname = id_rsa_github ///////"
ssh-keygen -t rsa
mv id_rsa_github* ~/.ssh/

cat <<EOF >> ~/.ssh/config
###################################
### Github - setup by my script ###
###################################

Host github.com
  User git
  Port 22
  Hostname github.com
  IdentityFile ~/.ssh/id_rsa_github
  TCPKeepAlive yes
  IdentitiesOnly yes
EOF

# Avoid ERROR: [ Bad owner or permissions on /home/hash/.ssh/config ]
chmod 700 ~/.ssh/
chmod 600 ~/.ssh/config

echo "/////// OK, now go to https://github.com/account ...
      /////// and insert text below."
echo ""

cat ~/.ssh/id_rsa_github.pub

echo ""
echo "Please <Enter> after you set public key to GitHub"
echo "> "
read DUMMY

echo "finish... now try to clone from GitHub"

### clone config
cd /home/hash/git
git clone --origin github git@github.com:takuyahashimoto/config.git
echo "CMD :: git clone --origin github git@github.com:takuyahashimoto/config.git"

### clone start-scripts
cd /home/hash/git
git clone --origin github git@github.com:takuyahashimoto/start-scripts.git
echo "CMD :: git clone --origin github git@github.com:takuyahashimoto/start-scripts.git"
echo " now, you can run rest of start-scripts"
