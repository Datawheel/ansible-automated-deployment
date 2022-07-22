#!/bin/bash -eux

# initial cleanup
#[ -f "/home/deploy/glibc-2.18.tar.gz" ] && rm /home/deploy/glibc-2.18.tar.gz
#[ -d "/home/deploy/glibc-2.18" ] && rm -rf /home/deploy/glibc-2.18

# download glibc-2.18.tar.gz
[ ! -f "/home/deploy/glibc-2.18.tar.gz" ] && wget -q http://ftp.gnu.org/gnu/glibc/glibc-2.18.tar.gz

# if necessary, untar glibc-2.18.tar.gz
if [ ! -d "/home/deploy/glibc-2.18" ] && [ -f "/home/deploy/glibc-2.18.tar.gz" ]
then
tar zxf glibc-2.18.tar.gz 
fi

# delete glibc-2.18.tar.gz
[ -f "/home/deploy/glibc-2.18.tar.gz" ] && rm /home/deploy/glibc-2.18.tar.gz

# initial build cleanup
#[ -d "/home/deploy/glibc-2.18/build" ] && sudo rm -rf /home/deploy/glibc-2.18/build

# check if build folder exist
[ ! -d "/home/deploy/glibc-2.18/build" ] && mkdir /home/deploy/glibc-2.18/build

# create build in the build directory
if [ -d "/home/deploy/glibc-2.18/build" ]
then
cd /home/deploy/glibc-2.18/build

../configure --prefix=/usr

make -j4
sudo make install
fi
