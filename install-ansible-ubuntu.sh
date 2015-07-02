#!/bin/sh

apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install -y ansible
ansible -v
