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

## Check the repos status

+ After using ansible-playbook to create the 3 repo, we need to check their status.
*go to the machine which deploy the vagrant* and run following command (or open the url
in the browser):
+ Docker repo
```
$ curl http://10.0.111.111:5000/v2/_catalog
{"repositories":["lokolla/centos-source-aodh-api","lokolla/centos-source-aodh-base",.....}
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
