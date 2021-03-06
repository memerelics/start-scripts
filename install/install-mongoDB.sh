#!/bin/sh

if [ "`whoami`" != "hash" ]; then
echo "ERROR: should run as hash"
  exit 1
fi

TARGET_DIR="$HOME/work/src"
if [ ! -d $TARGET_DIR ]
then
    mkdir -p $TARGET_DIR
fi
cd $TARGET_DIR
curl http://fastdl.mongodb.org/linux/mongodb-linux-i686-1.8.1.tgz > mongo.tgz
tar xzf mongo.tgz
mv mongodb-linux-i686-1.8.1 mongo
export PATH=$PATH:$HOME/work/src/mongo/bin

sudo mkdir -p /data/db/
sudo chown `id -u` /data/db

### check installation
# % mongod &
# % mongo
