function download_if_not_here {
    if [ -f "$1/$2" ]; then
        echo "$1/$2 is already here"
    else
        wget -P "$1" "$3/$2"
    fi
}

# kolla image
download_if_not_here '.' 'centos-source-registry-ocata.tar.gz' 'http://tarballs.openstack.org/kolla/images'

# cloud image
download_if_not_here '.' 'cirros-0.3.4-x86_64-disk.img' 'http://download.cirros-cloud.net/0.3.4'
download_if_not_here '.' 'xenial-server-cloudimg-amd64-disk1.img' 'http://cloud-images.ubuntu.com/xenial/current'
