#! /bin/bash
# run on deployment-1
/usr/share/kolla-ansible/tools/cleanup-host
/usr/share/kolla-ansible/tools/cleanup-containers

kolla-ansible deploy -i /root/inventory/multinode
kolla-ansible post-deploy -i /root/inventory/multinode
source /etc/kolla/admin-openrc.sh
/usr/share/kolla-ansible/init-runonce
