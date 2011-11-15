if [ "`whoami`" != "root" ]; then
    echo "ERROR: should run as root"
    exit 1
fi

cat <<__EOF__ > /etc/yum.repos.d/10gen.repo
[10gen]
name=10gen Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64
gpgcheck=0
__EOF__

yum update
yum install -y mongo-10gen-server
service mongod start
iptables -L
