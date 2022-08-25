#!/bin/bash
#purpose : for bigfix installation (ESOC)
#start
#date :8/25/22
mkdir BESClient
cd BESClient
wget https://github.com/ajairai1/ubuntu_bigfix_agent_10.0.7/blob/main/BESAgent-10.0.7.52-ubuntu10.amd64.deb?raw=true
wget https://raw.githubusercontent.com/ajairai1/ubuntu_bigfix_agent_10.0.7/main/actionsite.afxm
  dpkg -i BESAgent-10.0.7.52-ubuntu10.amd64.deb
/etc/init.d/besclient start

echo "Enable systcl parameters to disable it."
echo "net.ipv6.conf.all.disable_ipv6=1" >>  /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6=1" >>  /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6=1" >>  /etc/sysctl.conf
echo "Making these changes effective to kernel"
sysctl -p
echo "AddressFamily inet" >>  /etc/ssh/ssh_config
/etc/init.d/besclient restart

exit 0
EOF
