#!/bin/bash
ping www.baidu.com -c 5

echo "start cron"
service crond start
echo "start ssr"
/usr/bin/python /elsesky/shadowsocksr/shadowsocks/server.py -c /elsesky/shadowsocksr/user-config.json -d start
echo "start sshd"
/usr/sbin/sshd -D
