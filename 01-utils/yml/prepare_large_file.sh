function download_if_not_here {
    if [ -f "$1/$2" ]; then
        echo "$1/$2 is already here"
    else
        wget -P "$1" "$3/$2"
    fi
}

# docker
download_if_not_here 'httpd' 'docker-ce-17.06.0.ce-1.el7.centos.x86_64.rpm' 'https://download.docker.com/linux/centos/7/x86_64/stable/Packages'

# kolla image
download_if_not_here 'httpd' 'centos-source-registry-ocata.tar.gz' 'http://tarballs.openstack.org/kolla/images'

# cloud image
download_if_not_here 'httpd' 'cirros-0.3.5-x86_64-disk.img' 'http://download.cirros-cloud.net/0.3.5'
download_if_not_here 'httpd' 'xenial-server-cloudimg-amd64-disk1.img' 'http://cloud-images.ubuntu.com/xenial/current'
