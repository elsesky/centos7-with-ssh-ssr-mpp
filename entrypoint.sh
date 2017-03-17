#!/bin/bash
ping www.baidu.com -c 5


/usr/bin/python /elsesky/shadowsocksr/shadowsocks/server.py -c /elsesky/shadowsocksr/user-config.json -d start
