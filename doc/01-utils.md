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

+ Use following command to create three repos

```
cd /vagrant/yml
ansible-playbook -i etc_ansible_hosts 01_utils.yml
```

## Check the repos status

+ After using ansible-playbook to create the 3 repo, we need to check their status.
*go to the machine which deploy the vagrant* and run following command (or open the url
in the browser):
+ Docker repo
```
$ curl http://10.0.111.111:5000/v2/_catalog
{"repositories":["lokolla/centos-binary-aodh-api","lokolla/centos-binary-aodh-base",.....}
```
+ rpm repo
```
$ curl http://10.0.111.111:5001/localrpm/
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
 <head>
  <title>Index of /localrpm</title>
 </head>
 <body>
<h1>Index of /localrpm</h1>
<ul><li><a href="/"> Parent Directory</a></li>
<li><a href=".gitignore"> .gitignore</a></li>
<li><a href="autogen-libopts-5.18-5.el7.x86_64.rpm"> autogen-libopts-5.18-5.el7.x86_64.rpm</a></li>
<li><a href="ca-certificates-2015.2.6-73.el7_2017.2.14-70.1.el7_3.noarch.drpm"> ca-certificates-2015.2.6-73.el7_2017.2.14-70.1.el7_3.noarch.drpm</a></li>
<li><a href="ca-certificates-2017.2.14-70.1.el7_3.noarch.rpm"> ca-certificates-2017.2.14-70.1.el7_3.noarch.rpm</a></li>
<li><a href="container-selinux-2.19-2.1.el7.noarch.rpm"> container-selinux-2.19-2.1.el7.noarch.rpm</a></li>
<li><a href="cpp-4.8.5-11.el7.x86_64.rpm"> cpp-4.8.5-11.el7.x86_64.rpm</a></li>
<li><a href="device-mapper-persistent-data-0.6.3-1.el7.x86_64.rpm"> device-mapper-persistent-data-0.6.3-1.el7.x86_64.rpm</a></li>
<li><a href="docker-ce-17.06.1.ce-1.el7.centos.x86_64.rpm"> docker-ce-17.06.1.ce-1.el7.centos.x86_64.rpm</a></li>
...
</ul>
</body></html>
```
+ pypi repo
```
$ curl http://10.0.111.111:5002/simple/
    <html>
        <head>
            <title>Simple Index</title>
        </head>
        <body>
            <h1>Simple Index</h1>
                 <a href="ansible/">ansible</a><br>
                 <a href="appdirs/">appdirs</a><br>
                 <a href="asn1crypto/">asn1crypto</a><br>
                 <a href="babel/">babel</a><br>
                 ...
        </body>
    </html>
```
+ Make sure the three repos all works before going to next step
