#!/bin/bash

# Squid Installer

/bin/rm -rf /etc/squid
/usr/bin/apt update
/usr/bin/apt -y install apache2-utils squid
touch /etc/squid/passwd
/bin/rm -f /etc/squid/squid.conf
/usr/bin/touch /etc/squid/blacklist.acl
/usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/busyboy-ws/test-proxy/main/squid.conf

#SED_SQUID_PORT

/usr/bin/htpasswd -b -c /etc/squid/passwd SQUID_USERNAME SQUID_PASSWORD

systemctl enable squid
systemctl restart squid
