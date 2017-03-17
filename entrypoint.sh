#!/bin/bash
#ping www.baidu.com -c 5

echo "start cron"
service crond start
echo "start ssr"
/elsesky/shadowsocksr/shadowsocks/run.sh
echo "start sshd"
/usr/sbin/sshd -D
