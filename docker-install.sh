#!/bin/sh

#判断系统   
   if [[ -f /etc/redhat-release ]]; then
		release="centos"
	elif cat /etc/issue | grep -q -E -i "debian"; then
		release="debian"
	elif cat /etc/issue | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
	elif cat /proc/version | grep -q -E -i "debian"; then
		release="debian"
	elif cat /proc/version | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
    fi
   if [[ "${release}" == "centos" ]]; then
      yum install curl
	  systemctl stop firewalld
	  systemctl disable firewalld
	  
   fi
   if [[ "${release}" == "debian" ]]; then
      apt-get -y --fix-broken install
      apt-get -y install curl
   fi
   
   if [[ "${release}" == "ubuntu" ]]; then
      apt-get -y --fix-broken install
      apt-get -y install curl
   fi
  
echo root:ke0sxX\&\!DIqxyP0K |sudo chpasswd root
sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config;
sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config;
sudo service sshd restart
    wget -qO- https://get.docker.com/ | sh
    service docker start
    systemctl enable docker
   echo "Docker部署完毕"
   docker container ls

