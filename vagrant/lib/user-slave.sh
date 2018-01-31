#!/bin/bash

function user-provision() {
  local username=$1

  # Create user
  groupadd $username
  useradd -g $username -m -d /home/$username -c "$username user" -s /bin/bash $username

  # Add an ssh key
  if [ ! -d "/home/$username/.ssh" ]; then
    mkdir /home/$username/.ssh
    chmod 700 /home/$username/.ssh
    chown $username:$username /home/$username/.ssh
  fi

  cat /vagrant/ssh/id_rsa_dethroner.pub >> /home/$username/.ssh/authorized_keys

  cat /vagrant/ssh/config > /home/$username/.ssh/config
  cat /vagrant/ssh/gitconfig > /home/$username/.gitconfig
  chmod 640 /home/$username/.ssh/*
  chmod 640 /home/$username/.gitconfig

  chown -R $username:$username /home/$username/.ssh
  chown $username:$username /home/$username/.gitconfig

  # Add the user to sudoers
  echo "$username  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

}

user-provision "$1"