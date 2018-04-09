==============================================================

PROCEDURE BY SUNIL VASU

3 Master 2 Infra 3 app node installation:

--> Use Inventory file "inv"

--> Configure HA Proxy on the bastion node: run configure_haproxy.yaml playbook

--> run pre install playbook "install-pre-openshift.yaml" for all hosts in the inventory

--> Clone openshift repository: git clone https://github.com/openshift/openshift-ansible.git

--> Checkout release: cd openshift-ansible && git fetch && git checkout release-3.7 && cd ..

--> run config playbook "openshift-ansible/playbooks/byo/config.yml" using the inventory file

--> Execute "htpasswd -b /etc/origin/master/htpasswd <USERNAME> <PASSWORD>"

--> Execute "oc adm policy add-cluster-role-to-user cluster-admin <USERNAME>"

--> To login "oc login -u <USERNAME> -p <PASSWORD> https://console.$DOMAIN:$API_PORT"

=============================================================
