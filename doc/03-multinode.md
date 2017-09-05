# 03-multinode #
## 03-multinode stands for all in one deploy
+ multinode deployment is the key of this project, you can have a new configuration tested
in this project before you make it work on the real physical machine
+ We will deploy the 03-multinode on host 01-utils, using ansible-playbook.

## Start the 03-multinode vagrant
+ Use following command to start the 03-multinode

```
cd ./03-multinode
vagrant up
```
+ It will take about 10 minute to make all the servers started, as we had quite a few machines here
```
$ vagrant status
Current machine states:

deploy-1                  running (virtualbox)
control-1                 running (virtualbox)
network-1                 running (virtualbox)
compute-1                 running (virtualbox)
monitoring-1              running (virtualbox)
storage-1                 running (virtualbox)
storage-2                 running (virtualbox)
storage-3                 running (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
```
+ Be careful the storage need *at least 3 hosts*

## Deploy 03-multinode using ansible-playbook on 01-utils

+ Run following command on *01-tutils* to deploy the whole aio system on *02-utils*

```
cd /vagrant/yml
ansible-playbook -i etc_ansible_hosts 03_multinode.yml
```

## Check the deployment status

+ The deployment will takes about forty minutes. One time sheet for the whole process is
Please Note: if you want to make it run faster, you should give each host a better memory and cpu

```
===============================================================================
Deploy all the instance ---------------------------------------------- 1398.45s
Install list of packages from local utils repo ------------------------ 751.07s
Install Pip Packages --------------------------------------------------- 98.96s
Create the All In One Kolla -------------------------------------------- 96.53s
Gen password for /etc/kolla/passwords.yml ------------------------------ 38.56s
Modify /etc/kolla/globals.yml ------------------------------------------- 4.12s
Copy the config file to the destination --------------------------------- 3.11s
Restart docker systemd to take effect ----------------------------------- 2.97s
Gathering Facts --------------------------------------------------------- 2.97s
Make sure the id_rsa.pub ------------------------------------------------ 2.13s
Make sure the id_rsa ---------------------------------------------------- 1.92s
Ensure docker.json had contents ----------------------------------------- 1.90s
utils repo -------------------------------------------------------------- 1.88s
Make sure the id_rsa.pub ------------------------------------------------ 1.83s
Make sure the authorized_keys ------------------------------------------- 1.83s
Make the br-ex had a new ip address, it connects br-ex ------------------ 1.80s
Modify /usr/share/kolla-ansible/init-runonce ---------------------------- 1.61s
Ensure config file folders exists --------------------------------------- 1.26s
Make sure ntp is running ------------------------------------------------ 1.16s
Ensure nova-compute.conf had contents ----------------------------------- 1.08s
```
+ if it takes longer than that time, please log in
control-1 and run following command to see whether the docker instances are being built
```
# docker ps
CONTAINER ID        IMAGE                                                                     COMMAND             CREATED             STATUS              PORTS               NAMES
d8446cb4c8cd        10.0.111.111:5000/lokolla/centos-binary-horizon:4.0.3                     "kolla_start"       16 seconds ago      Up 16 seconds                           horizon
88b5017a8e61        10.0.111.111:5000/lokolla/centos-binary-heat-engine:4.0.3                 "kolla_start"       53 seconds ago      Up 52 seconds                           heat_engine
0290f59dd584        10.0.111.111:5000/lokolla/centos-binary-heat-api-cfn:4.0.3                "kolla_start"       54 seconds ago      Up 53 seconds                           heat_api_cfn
a5b284e3e68c        10.0.111.111:5000/lokolla/centos-binary-heat-api:4.0.3                    "kolla_start"       54 seconds ago      Up 54 seconds                           heat_api
ef83b3113f15        10.0.111.111:5000/lokolla/centos-binary-neutron-server:4.0.3              "kolla_start"       2 minutes ago       Up 2 minutes                            neutron_server
```

+ After the deployment, we need to open the brower on the vagrant running machine and input
```
http://10.0.25.222
```
+ If the login page show, inpu the default user and password:

  - user: admin
  - pass: welcome
+ The password is set by modifing the passwords.yml in following ansible code by this project

```
- name: Modify /etc/kolla/passwords.yml
  lineinfile:
    path: /etc/kolla/passwords.yml
    regexp: "{{ item.regexp }}"
    line: "{{ item.line }}"
  with_items:
    - { regexp: '^keystone_admin_password',    line: 'keystone_admin_password: welcome'}

```
