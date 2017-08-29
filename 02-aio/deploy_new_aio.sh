#! /bin/bash
kolla-ansible deploy -i /root/inventory/all-in-one
ip addr add 10.0.24.254/24 dev br-ex
ip link set br-ex up
kolla-ansible post-deploy
source /etc/kolla/admin-openrc.sh
/usr/share/kolla-ansible/init-runonce
