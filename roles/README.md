# Roles List

## Our own creations
| Package | Role Name | Author | Description |
| ----------- | ----------- | ----------- | ----------- |
| common packages | [datawheel.common](https://github.com/Datawheel/ansible-automated-deployment/tree/main/roles/datawheel.common) | datawheel | role that handles the installation of common linux packages |

## Downloaded from ansible-galaxy

| Package | Role Name | Author | Description |
| ----------- | ----------- | ----------- | ----------- |
| nodejs | [geerlingguy.nodejs](https://galaxy.ansible.com/geerlingguy/nodejs) | [geerlingguy](https://galaxy.ansible.com/geerlingguy) | Installs Node.js on RHEL/CentOS or Debian/Ubuntu. |
| pip | [geerlingguy.pip](https://galaxy.ansible.com/geerlingguy/pip) | [geerlingguy](https://galaxy.ansible.com/geerlingguy) | An Ansible Role that installs Pip on Linux. |
| repo-epel | [geerlingguy.repo-epel](https://galaxy.ansible.com/geerlingguy/repo-epel)  | [geerlingguy](https://galaxy.ansible.com/geerlingguy) | Installs the EPEL repository (Extra Packages for Enterprise Linux) for RHEL/CentOS. *(prerequisite for geerlingguy.pip on CentOS)* |
| postgresql | [geerlingguy.pip]() | [geerlingguy](https://galaxy.ansible.com/geerlingguy) | Installs and configures PostgreSQL server on RHEL/CentOS or Debian/Ubuntu servers. |
| nginx | [nginxinc.nginx](https://galaxy.ansible.com/nginxinc/nginx) | [nginxinc](https://galaxy.ansible.com/nginxinc) | This role installs NGINX Open Source, NGINX Plus, or the NGINX Amplify agent on your target host. |
| nginx_config | [nginxinc.nginx_config](https://galaxy.ansible.com/nginxinc/nginx_config) | [nginxinc](https://galaxy.ansible.com/nginxinc) | This role configures NGINX Open Source and NGINX Plus on your target host. |

# Roles use and variables List

## datawheel.common

### Use inside a playbook
```
# handles the installation of datawheel's common packages
- role: datawheel.common
```

### Use it standalone
```
```

*For all the variables available please go to [datawheel.common/defaults/main.yml](https://github.com/Datawheel/ansible-automated-deployment/blob/main/roles/datawheel.common/defaults/main.yml)*

## geerlingguy.nodejs

### Use inside a playbook
```
# handles nodejs installation
- role: geerlingguy.nodejs
```

### Use it standalone
```
```

### Most used variables variables
```
#select nodejs version to install
nodejs_version: "12.x"
```

*For all the variables available please go to [geerlingguy.nodejs/defaults/main.yml](https://github.com/Datawheel/ansible-automated-deployment/blob/main/roles/geerlingguy.nodejs/defaults/main.yml)*

### geerlingguy.pip

### Use inside a playbook
```
# handles pip installation and the packages to install
- role: geerlingguy.pip
  vars:
    ansible_python_interpreter: /usr/bin/python3
```

### Use it standalone
```
```

### Most used variables variables
```
# pip packages required by bamboo
pip_install_packages:
  - pip>=19.0.0
  - selinux
  # bamboo requirements
  - appnope==0.1.0
  - asn1crypto==0.24.0
  - atomicwrites==1.1.5
  - attrs==18.1.0
  - backcall==0.1.0
  - bcrypt==3.1.4
  - cffi==1.11.5
  - cryptography==2.3
  - decorator==4.3.0
  - idna==2.7
  - ipython==6.5.0
  - ipython-genutils==0.2.0
  - jedi==0.12.1
  - Jinja2==2.10
  - MarkupSafe==1.0
  - more-itertools==4.3.0
  - numpy==1.15.0
  - pandas==1.1.4
  - paramiko==2.4.1
  - parso==0.3.1
  - pexpect==4.6.0
  - pickleshare==0.7.4
  - pluggy==0.7.1
  - prompt-toolkit==1.0.15
  - ptyprocess==0.6.0
  - py==1.5.4
  - pycparser==2.18
  - Pygments==2.2.0
  - PyNaCl==1.2.1
  - pytest==3.7.1
  - python-dateutil==2.7.3
  - pytz==2018.5
  - scp==0.11.0
  - simplegeneric==0.8.1
  - six==1.11.0
  - sshtunnel==0.1.4
  - traitlets==4.3.2
  - wcwidth==0.1.7
  - SQLAlchemy==1.2.10
  - redis==3.2.1
  - data_catapult
  - pathos==0.2.3
  - geopandas==0.5.1
  - sphinx_rtd_theme==0.4.3
  - google-cloud-storage==1.17.0
  - progressbar==2.5
  - boto3==1.12.43
  - Cython
  # bamboo
  - bamboo-lib
  - dw-bamboo-cli
```

*For all the variables available please go to [geerlingguy.pip/defaults/main.yml](https://github.com/Datawheel/ansible-automated-deployment/blob/main/roles/geerlingguy.pip/defaults/main.yml)*

## geerlingguy.repo-epel

### Use inside a playbook
```
# handles the repo-epel for redhat families
- role: geerlingguy.repo-epel
  when: "ansible_facts['os_family'] == 'RedHat'"
```

### Use it standalone
```
```

*For all the variables available please go to [geerlingguy.repo-epel/defaults/main.yml](https://github.com/Datawheel/ansible-automated-deployment/blob/main/roles/geerlingguy.repo-epel/defaults/main.yml)*