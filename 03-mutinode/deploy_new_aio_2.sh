#! /bin/bash
# run on deployment-1
kolla-ansible post-deploy
source /etc/kolla/admin-openrc.sh
/usr/share/kolla-ansible/init-runonce
