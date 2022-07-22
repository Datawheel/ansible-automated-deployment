# **Ansible Hub**
[Ansible](https://www.ansible.com/) is an open-source automation tool for provisioning, configuration management, and application-deployment used to enable infrastructure as code that you install on a control node *(work computer, python virtual environment, virtual machine, etc...)* and from that control node, Ansible manages machines and other devices remotely (by default, over the SSH protocol)

This is Datawheel's Ansible Hub created to share the most used tasks for the provisioning and configuration of our new server instances

**DEVOPS TEAM: To add a new role or modify an existing one, please open an [issue](https://github.com/Datawheel/ansible-hub/issues) or make a [pull request](https://github.com/Datawheel/ansible-hub/pulls) and tag another member of the DevOps team so we can review it together an add it to this repository**

## **Installing Ansible**

### **via pip**

To install Ansible with [pip](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-with-pip) we need to execute the following command:
```
python -m pip install --user ansible
```

If you wish to install it globally just run:
```
sudo python get-pip.py
sudo python -m pip install ansible
```

*If you don't have pip installed on the control node, please follow the [official documentation](https://pip.pypa.io/en/stable/installing/)*

### **for MacOS, Windows and supported Linux distros**

Please follow the official [Ansible installation docs](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

--------

## **Modules**

>A module is a reusable, standalone script that Ansible runs on your behalf, either locally or remotely. Modules interact with your local machine, an API, or a remote system to perform specific tasks like changing a database password or spinning up a cloud instance. In the 2.9 version, Modules where moved from the core Ansible repository into **collections**. The documentation for modules can be found in [collections pages](https://docs.ansible.com/ansible/latest/collections/index.html#list-of-collections).

To install the modules required by the roles included in this repository, it is necessary to run the following command:
```
ansible-galaxy install -r requirements.yml
```

*If you need to add more modules when adding a new role, please use this [nomenclature](https://galaxy.ansible.com/docs/using/installing.html#installing-multiple-roles-from-a-file)*

## **Roles**

*For more available roles, please check [ansible-galaxy](https://galaxy.ansible.com/)*

# **Setup**

## **Execute script**
```
ansible-playbook -i hosts/hosts 
```

## **Environment Variables**

We use environment variables to reuse the same playbooks for different instances.

### used on all
```
# ANSIBLE
export ANSIBLE_ROLES_PATH=<PATH_TO_ROLES_FOLDER>

# UNIX
export UNIX_USER=<UNIX_USERNAME>
```

### ClickHouse
```
# clickhouse variables
export CLICKHOUSE_USER=<CLICKHOUSE_CUSTOM_USER>
export CLICKHOUSE_PASS=<CLICKHOUSE_CUSTOM_USER_PASSWORD>
export CLICKHOUSE_RO_PASS=<CLICKHOUSE_READONLY_USER_PASSWORD>
```

### PostgreSQL
```
# postgresql variables
export POSTGRESQL_USER=<POSTGRESQL_CUSTOM_USER>
export POSTGRESQL_PASS=<POSTGRESQL_CUSTOM_PASSWORD>
```

## How to Use It

### Initial Server Setup

We need to prepare each environment with a basic playbook provisioner **(working on debian/ubuntu and centos)** that needs to be executed before any specific project playbook so we can start our instances with all the minimum required dependencies ready on the respective machines

For that, we need to run the following command:
```
# if we are connecting through ssh keys
ansible-playbook --inventory=<SERVER_IP_1>,<SERVER_IP_2>,... playbooks/initial-server-setup.yml

# if we are connecting through ssh user and password
ansible-playbook --ask-pass --ask-become-pass --inventory=<SERVER_IP_1>,<SERVER_IP_2>,... playbooks/initial-server-setup.yml
```

**Note:** *See that, even if you are going to run the playbook on one server, you need to keep the ',' after the server*

### Specific Playbooks

We have created a series of playbooks with the most used configuration of our servers so you can replicate them in any server (virtual machine, bare metal, etc...) that we require to deploy 

Each playbook have a `vars/<PLAYBOOK_NAME>.yml` file with all the default configurations that we use for that specific set of instructions. If you wanna change any of those variables, just create a file on your environment in a folder named `custom-vars` inside the root of this repo and add all your custom configurations there. We will also use specific env variables per project, for that, please storage them on `custom-env`

#### Backend Instance with python, bamboo, clickhouse and nginx

For that, we need to run the following command:
```
# if we are connecting through ssh keys
ansible-playbook --inventory=<SERVER_IP_1>,<SERVER_IP_2>,... playbooks/backend-instance-clickhouse.yml

# if we are connecting through ssh user and password
ansible-playbook --ask-pass --ask-become-pass --inventory=<SERVER_IP_1>,<SERVER_IP_2>,... playbooks/backend-instance-clickhouse.yml
```

If you need to use any custom variables, please add them with the `--extra-vars=@./custom-vars/<CUSTOM_VARIABLES>.yml` flag on the command above
