# 01-utils #
## The primary usage for 01-utils is following:
+ Local Docker for all-in-one deployment & multinode deployment
+ Local rpm server for docker-ce installation (otherwise too slow in China)
+ Local pypi server for docker-ce installation (otherwise too slow in China)

## Start the 01-utils vagrant
+ Use following command to start the 01-utils

```
cd ./01-utils
vagrant up
```
+ It will take less than five minutes to make the server start, most of the time,
the client are running the provision of the vagrant: *01-utils/prepare.sh*
+ *01-utils/prepare* installs the necessary software and create the rpm info using
following command. we add the rpm into the version control under *01-utils/httpd/localrpm*
```
createrepo  /vagrant/httpd/localrpm
```

## Create the repos on 01-utils using ansible-playbook

```
ansible-playbook -i etc_ansible_hosts 01_utils.yml
```
