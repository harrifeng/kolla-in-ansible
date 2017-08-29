#! /bin/bash
# run on deployment-1
/usr/share/kolla-ansible/tools/cleanup-host
/usr/share/kolla-ansible/tools/cleanup-containers

kolla-ansible deploy -i /root/inventory/multinode
