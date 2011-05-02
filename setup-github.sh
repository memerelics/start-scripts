#!/bin/sh
### http://help.github.com/key-setup-redirect/

### check git is already installed
if [ "`git --version | awk '{print $1,$2}'`" != "git version" ]; then
  echo "git should be installed before setup github pub.key"
  exit 1
fi


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
chmod 600 ~/.ssh/config

echo "/////// OK, now go to https://github.com/account ...
      /////// and insert text below."
echo ""

cat ~/.ssh/id_rsa_github.pub

