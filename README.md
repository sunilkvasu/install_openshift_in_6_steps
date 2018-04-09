==============================================================

PROCEDURE BY SUNIL VASU

3 Master 2 Infra 3 app node installation:

--> Use Inventory file "inv"

--> run pre install playbook "install-pre-openshift.yaml" for all hosts in the inventory

--> Clone openshift repository: git clone https://github.com/openshift/openshift-ansible.git

--> Checkout release: cd openshift-ansible && git fetch && git checkout release-3.7 && cd ..

--> run config playbook "openshift-ansible/playbooks/byo/config.yml" using the inventory file

--> Execute "htpasswd -b /etc/origin/master/htpasswd <USERNAME> <PASSWORD>"

--> Execute "oc adm policy add-cluster-role-to-user cluster-admin <USERNAME>"

--> To login "oc login -u <USERNAME> -p <PASSWORD> https://console.$DOMAIN:$API_PORT"

=============================================================


Install RedHat OpenShift Origin in your development box.

## Installation

1. Create a VM as explained in https://youtu.be/aqXSbDZggK4 (this video) by Grant Shipley

2. Define mandatory variables for the installation process

```
# Domain name to access the cluster
$ export DOMAIN=<public ip addres>.nip.io 

# User created after installation
$ export USERNAME=<current user name>

# Password for the user
$ export PASSWORD=password
```

3. Define optional variables for the installation process

```
# Instead of using loopback, setup DeviceMapper on this disk.
# !! All data on the disk will be wiped out !!
$ export DISK="/dev/sda"
```

3. Run the automagic installation script as root:

```
curl https://raw.githubusercontent.com/gshipley/installcentos/master/install-openshift.sh | /bin/bash
```

## Development

For development it's possible to switch the script repo

```
# Change location of source repository
$ export SCRIPT_REPO="https://raw.githubusercontent.com/gshipley/installcentos/master"
$ curl $SCRIPT_REPO/install-openshift.sh | /bin/bash
```







