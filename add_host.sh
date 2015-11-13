#!/bin/bash
ip="$1"
hostname="$2"

if [ -z "$ip" ] || [ -z "$hostname" ]; then
  echo "Usage: add_host [IpAddress] [Hostname]"
  exit 1
fi

cat /etc/hosts | sed -n "/$ip/!p" > /etc/hosts_temp  2> /dev/null
echo -e "$ip\t$hostname" >> /etc/hosts_temp 2> /dev/null
cp /etc/hosts /etc/hosts_bak 2> /dev/null
cat /etc/hosts_temp > /etc/hosts 2> /dev/null
rm /etc/hosts_temp 2> /dev/null


if [ $? -eq 0 ]; then
    exit 0
else
    echo "Fail"
    exit 1
fi
