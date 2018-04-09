
3 Master 2 Infra 3 app node installation:
Requirements:
ocpapp01.example.com, 4 CPU, 16GB RAM, 50GB Disk
ocpapp03.example.com, 4 CPU, 16GB RAM, 50GB Disk
ocpapp03.example.com, 4 CPU, 16GB RAM, 50GB Disk

ocpinfra01.example.com, 4 CPU, 8GB RAM, 50GB Disk
ocpinfra02.example.com, 4 CPU, 8GB RAM, 50GB Disk

ocpmaster01.example.com, 4 CPU, 8GB RAM, 50GB Disk
ocpmaster02.example.com, 4 CPU, 8GB RAM, 50GB Disk
ocpmaster03.example.com, 4 CPU, 8GB RAM, 50GB Disk

ocpbastion01.example.com, 4 CPU, 4GB RAM, 50GB Disk


Configure passwordless authnetication:
On ocpbastion01.example.com
ssh-keygen
ssh-copy-id <hosts>
  
  
  Run the playbooks:

--> Use Inventory file "inv"

--> Configure HA Proxy on the bastion node: run configure_haproxy.yaml playbook

--> run pre install playbook "install-pre-openshift.yaml" for all hosts in the inventory

--> Clone openshift repository: git clone https://github.com/openshift/openshift-ansible.git

--> Checkout release: cd openshift-ansible && git fetch && git checkout release-3.7 && cd ..

--> run config playbook "openshift-ansible/playbooks/byo/config.yml" using the inventory file

--> Execute "htpasswd -b /etc/origin/master/htpasswd <USERNAME> <PASSWORD>"

--> Execute "oc adm policy add-cluster-role-to-user cluster-admin <USERNAME>"

--> To login "oc login -u <USERNAME> -p <PASSWORD> https://console.$DOMAIN:$API_PORT"
