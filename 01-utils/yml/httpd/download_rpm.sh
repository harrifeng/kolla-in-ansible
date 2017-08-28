# this file should be run only once if the rpm files in version control system are outdated
sudo yum install -y creatrepo yum-utils

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

yumdownloader --resolve --archlist=x86_64 --destdir=./localrpm ca-certificates \
              device-mapper-persistent-data \
              docker-ce \
              gcc \
              libffi-devel \
              lvm2 \
              openssl \
              python-devel \
              python-pip \
              libselinux-python \
              ntp

createrepo ./localrpm
