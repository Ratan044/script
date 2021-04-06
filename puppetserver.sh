#!/bin/bash
sudo wget https://apt.puppetlabs.com/puppet6-release-bionic.deb;
sudo dpkg -i puppet6-release-bionic.deb

sudo apt-get update -y;
sudo apt-get install puppetserver -y;
File=/etc/puppetlabs/puppet/puppet.conf
echo $File
a=`hostname`
sed -i 's/127.0.0.1.*/127.0.0.1 '$a' localhost puppet/' /etc/hosts
echo "certname = $a" >> $File
echo "[main]" >> $File
echo "certname = $a" >> $File


sudo /opt/puppetlabs/bin/puppetserver ca setup;
sudo systemctl start puppetserver;
sudo systemctl enable puppetserver