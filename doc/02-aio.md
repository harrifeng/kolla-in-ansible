# 02-aio #
## 02-aio stands for all in one deploy
+ AIO(all-in-one) deployment is the good way to learn the kolla, all the kolla docker
instances are running on *one machine*, which will reduce complexity for the deploy
+ We will deploy the 02-aio on host 01-utils, using ansible-playbook. Be clear about
what I am saying, we run ansible-playbook on 01-utils to run make 02-aio workable.

## Start the 02-aio vagrant
+ Use following command to start the 02-aio

```
cd ./02-aio
vagrant up
```
+ It will take less than 1 minute to make the server start, as we did noting on the start up

## Deploy 02-aio using ansible-playbook on 01-utils

+ Run following command on *01-tutils* to deploy the whole aio system on *02-utils*

```
cd /vagrant/yml
ansible-playbook -i etc_ansible_hosts 02_aio.yml
```

## Check the deployment status

+ The deployment will takes about half an hour. One time sheet for the whole process is
```
===============================================================================
Deploy all the instance ---------------------------------------------- 1373.53s
Install list of packages from local utils repo ------------------------ 181.18s
Create the All In One Kolla -------------------------------------------- 72.55s
Gen password for /etc/kolla/passwords.yml ------------------------------ 35.92s
Install Pip Packages ---------------------------------------------------- 5.26s
Modify /etc/kolla/globals.yml ------------------------------------------- 4.73s
Copy the config file to the destination --------------------------------- 4.42s
Ensure config file folders exists --------------------------------------- 2.01s
Modify /usr/share/kolla-ansible/init-runonce ---------------------------- 1.79s
Gathering Facts --------------------------------------------------------- 1.24s
utils repo -------------------------------------------------------------- 1.23s
Ensure nova-compute.conf had contents ----------------------------------- 1.06s
Make sure the id_rsa.pub ------------------------------------------------ 1.05s
Make sure the authorized_keys ------------------------------------------- 1.00s
Make sure the id_rsa.pub ------------------------------------------------ 0.92s
Make sure the id_rsa ---------------------------------------------------- 0.91s
Ensure docker.json had contents ----------------------------------------- 0.89s
Clean old containers ---------------------------------------------------- 0.69s
Make sure ntp is running ------------------------------------------------ 0.64s
Diable selinux ---------------------------------------------------------- 0.58s
```
+ if it takes longer than that time, please log in
02-aio and run following command to see whether the docker instances are being built
```
# docker ps
CONTAINER ID        IMAGE                                                                     COMMAND             CREATED             STATUS              PORTS               NAMES
d8446cb4c8cd        10.0.111.111:5000/lokolla/centos-source-horizon:4.0.3                     "kolla_start"       16 seconds ago      Up 16 seconds                           horizon
88b5017a8e61        10.0.111.111:5000/lokolla/centos-source-heat-engine:4.0.3                 "kolla_start"       53 seconds ago      Up 52 seconds                           heat_engine
0290f59dd584        10.0.111.111:5000/lokolla/centos-source-heat-api-cfn:4.0.3                "kolla_start"       54 seconds ago      Up 53 seconds                           heat_api_cfn
a5b284e3e68c        10.0.111.111:5000/lokolla/centos-source-heat-api:4.0.3                    "kolla_start"       54 seconds ago      Up 54 seconds                           heat_api
ef83b3113f15        10.0.111.111:5000/lokolla/centos-source-neutron-server:4.0.3              "kolla_start"       2 minutes ago       Up 2 minutes                            neutron_server
```

+ After the deployment, we need to open the brower on the vagrant running machine and input
```
http://10.0.23.222
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
