#!/bin/bash
ping www.baidu.com -c 5


/usr/bin/python /ssr/shadowsocks/server.py /elsesky/shadowsocksr/shadowsocks/server.py -c /elsesky/shadowsocksr/user-config.json -d start
