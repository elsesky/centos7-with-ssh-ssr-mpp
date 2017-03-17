#!/bin/bash
#ping www.baidu.com -c 5

echo "start cron"
service crond start
echo "start sshd"
/usr/sbin/sshd -d
echo "start ssr"
python /elsesky/shadowsocksr/shadowsocks/server.py -c /elsesky/shadowsocksr/user-config.json start
