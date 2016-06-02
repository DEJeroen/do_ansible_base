#!/usr/bin/env bash
yes | pacman -Suy
yes | pacman -S ansible sshpass

ln -sf /vagrant/hosts /etc/ansible/hosts


KNOW_HOSTS_FILE="/home/vagrant/.ssh/known_hosts"

[ -f "$KNOW_HOSTS_FILE" ] && rm $KNOW_HOSTS_FILE 

ssh-keyscan 192.168.2.3 >> $KNOW_HOSTS_FILE 
ssh-keyscan 192.168.2.4 >> $KNOW_HOSTS_FILE
ssh-keyscan 192.168.2.5 >> $KNOW_HOSTS_FILE
ssh-keyscan 192.168.2.6 >> $KNOW_HOSTS_FILE
chown vagrant:vagrant $KNOW_HOSTS_FILE 

# TODO: ssh-keyscan can be replaced if a playbook is created that copies the
# files, ssh-agent needs to be implemented as wel.

