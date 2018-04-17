This repository contains playbooks to install minimal OpenShift cluster.



3 Masters, 2 Infra and 3 app nodes installation:
=========================================


STEP-1 Preparations:
====================
Bastion Node

ocpbastion01.example.com, 4 CPU, 4GB RAM, 50GB Disk


Master Nodes

ocpmaster01.example.com, 4 CPU, 8GB RAM, 50GB Disk

ocpmaster02.example.com, 4 CPU, 8GB RAM, 50GB Disk

ocpmaster03.example.com, 4 CPU, 8GB RAM, 50GB Disk


Infra Nodes

ocpinfra01.example.com, 4 CPU, 16GB RAM, 50GB Disk

ocpinfra02.example.com, 4 CPU, 16GB RAM, 50GB Disk


Application Nodes

ocpapp01.example.com, 4 CPU, 8GB RAM, 50GB Disk

ocpapp03.example.com, 4 CPU, 8GB RAM, 50GB Disk

ocpapp03.example.com, 4 CPU, 8GB RAM, 50GB Disk


STEP-2 Enable ssh key authentication:
=====================================
On ocpbastion01.example.com

Generate key:

ssh-keygen

Copy the keys:

for host in `ansible -i inv all --list-hosts|grep -vw "hosts"`;do ssh-copy-id $host;done
  

STEP-3 Install and configure HAProxy:
=====================================
Login to ocpbastion01.example.com

Use Inventory file "inv" and run playbook "configure_haproxy.yaml"

ansible-playbook -i inv configure_haproxy.yaml


STEP-4 Install pre-requisites:
==============================
Login to ocpbastion01.example.com

Use Inventory file "inv" and run playbook "install-pre-openshift.yaml"

ansible-playbook -i inv install-pre-openshift.yaml

STEP-5 Clone OpenShift repository and run config playbook:
==========================================================
Login to ocpbastion01.example.com

Clone openshift repository:

git clone https://github.com/openshift/openshift-ansible.git

Checkout release:

cd openshift-ansible && git fetch && git checkout release-3.7 && cd ..

Use Inventory file "inv" and run config playbook "openshift-ansible/playbooks/byo/config.yml"

ansible-playbook -i inv openshift-ansible/playbooks/byo/config.yml

STEP-6 Post configuration:
==========================
Create htpasswd user:

htpasswd -b /etc/origin/master/htpasswd USERNAME PASSWORD

Add admin role to the user:

oc adm policy add-cluster-role-to-user cluster-admin USERNAME

Login to the OpenShift container platform:

oc login -u USERNAME -p PASSWORD https://console.$DOMAIN:$API_PORT
