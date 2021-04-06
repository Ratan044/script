#!/bin/bash

sudo wget https://apt.puppetlabs.com/puppet6-release-bionic.deb; sudo dpkg -i puppet6-release-bionic.deb
echo "deb http://deb.theforeman.org/ bionic 2.3" | sudo tee /etc/apt/sources.list.d/foreman.list
echo "deb http://deb.theforeman.org/ plugins 2.3" | sudo tee -a /etc/apt/sources.list.d/foreman.list

sudo apt-get -y install ca-certificates

wget -q https://deb.theforeman.org/pubkey.gpg -O- | sudo apt-key add -

sudo apt-get update && sudo apt-get -y install foreman-installer

sudo foreman-installer
sleep 20
cat /var/log/foreman-installer/foreman.log | grep admin_password
cat /var/log/foreman-installer/foreman.log | grep server_url