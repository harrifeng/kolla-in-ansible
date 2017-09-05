chmod 600 /home/vagrant/.ssh/id_rsa

sudo yum install -y epel-release
sudo yum install -y yum-utils createrepo python-devel python-pip gcc

createrepo  /vagrant/httpd/localrpm

sudo pip install -U pip -i http://mirrors.aliyun.com/pypi/simple --trusted-host=mirrors.aliyun.com
sudo pip install ansible -i http://mirrors.aliyun.com/pypi/simple --trusted-host=mirrors.aliyun.com
sudo mkdir -p /etc/ansible
sudo cp /vagrant/yml/tasks/config/ansible.cfg /etc/ansible/ansible.cfg
