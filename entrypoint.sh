#!/bin/bash
#ping www.baidu.com -c 5

while getopts :r:p:o:a:m:P:A: opt
do
    case $opt in
        r)
          echo "root pass=$OPTARG"
          ROOT_PASS=$OPTARG;;
        p)
          echo "port pass=$OPTARG"
          PORT_PASS=$OPTARG;;
        o)
          echo "OBFS IS $OPTARG"
          OBFS=$OPTARG;;
        a)
          echo "OBFS PARA IS $OPTARG"
          OBFS_PARAM=$OPTARG;;
        m)
          echo "METHOD IS $OPTARG"
          METHOD=$OPTARG;;
        P)
          echo "PROTOCOL IS $OPTARG"
          PROTOCOL=$OPTARG;;
        A)
          echo "PROTOCOL PARAM IS $OPTARG"
          PROTOCOL_PARAM=$OPTARG;;
    esac
done

echo>/elsesky/shadowsocksr/user-config.json
echo "{">>/elsesky/shadowsocksr/user-config.json
echo " \"server\": \"0.0.0.0\",">>/elsesky/shadowsocksr/user-config.json
echo " \"server_ipv6\": \"::\",">>/elsesky/shadowsocksr/user-config.json
echo " \"local_address\": \"127.0.0.1\",">>/elsesky/shadowsocksr/user-config.json
echo " \"local_port\": 1080,">>/elsesky/shadowsocksr/user-config.json
echo " \"port_password\":{">>/elsesky/shadowsocksr/user-config.json
echo " \"8388\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8389\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8390\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8391\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8392\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8393\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8394\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8395\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8396\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8397\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8398\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8399\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8400\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8401\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8402\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8403\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8404\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8405\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8406\":\"$PORT_PASS\"">>/elsesky/shadowsocksr/user-config.json
echo " },">>/elsesky/shadowsocksr/user-config.json
echo " \"method\": \"$METHOD\",">>/elsesky/shadowsocksr/user-config.json
echo " \"protocol\": \"$PROTOCOL\",">>/elsesky/shadowsocksr/user-config.json
echo " \"protocol_param\": \"$PROTOCOL_PARAM\",">>/elsesky/shadowsocksr/user-config.json
echo " \"obfs\": \"$OBFS\",">>/elsesky/shadowsocksr/user-config.json
echo " \"obfs_param\": \"$OBFS_PARAM\",">>/elsesky/shadowsocksr/user-config.json
echo " \"speed_limit_per_con\": 0,">>/elsesky/shadowsocksr/user-config.json
echo " \"speed_limit_per_user\": 0,">>/elsesky/shadowsocksr/user-config.json
echo "">>/elsesky/shadowsocksr/user-config.json
echo " \"additional_ports\" : {}, // only works under multi-user mode">>/elsesky/shadowsocksr/user-config.json
echo " \"timeout\": 120,">>/elsesky/shadowsocksr/user-config.json
echo " \"udp_timeout\": 60,">>/elsesky/shadowsocksr/user-config.json
echo " \"dns_ipv6\": false,">>/elsesky/shadowsocksr/user-config.json
echo " \"connect_verbose_info\": 0,">>/elsesky/shadowsocksr/user-config.json
echo " \"redirect\": \"\",">>/elsesky/shadowsocksr/user-config.json
echo " \"fast_open\": false">>/elsesky/shadowsocksr/user-config.json
echo "}">>/elsesky/shadowsocksr/user-config.json

echo "root:$ROOT_PASS" | chpasswd


echo "start cron"
service crond start
echo "start ssr"
/elsesky/shadowsocksr/shadowsocks/run.sh
echo "start sshd"
/usr/sbin/sshd -D
