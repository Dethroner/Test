#!/bin/bash

apt-get update -y
apt-get install -y build-essential \
  mc \
  htop \
  libxml2-dev \
  libxslt-dev \
  libffi-dev \
  libssl-dev \
  python2.7 \
  python2.7-dev \
  python-lxml \
  software-properties-common \
  git \
  sshpass

# Install ansible
wget -c https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install ansible

cat /vagrant/ansible/ansible.cfg > /home/dethroner/.ansible.cfg
chmod 640 /home/dethroner/.ansible.cfg
chown dethroner:dethroner /home/dethroner/.ansible.cfg
#mkdir -p /etc/ansible/
#touch /etc/ansible/hosts
#cat /vagrant/ansible/nodes >> /etc/ansible/hosts

# Auto cleanup
apt-get autoremove -y
