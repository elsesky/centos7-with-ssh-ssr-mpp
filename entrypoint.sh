#!/bin/bash
#ping www.baidu.com -c 5
yum list|grep ruby
exit


ARGS=`getopt -o r:p:o:a:m:P:A: --long p1:,p2:,p3:,p4:,p5:,p6:,p7:,p8:,p9:,p10:,p11:,p12:,p13:,p14:,p15:,p16:,p17:,p18:,p19: -n 'entrypoint.sh' -- "$@"`
if [ $? != 0 ]; then
    echo "Args error..."
    exit 1
fi

eval set - "${ARGS}"

while true
do
    case "$1" in
        -r)
          echo "root pass=$2"
          ROOT_PASS=$2
          shift 2;;
        -p)
          echo "port pass=$2"
          PORT_PASS=$2
          p1=$2
          p2=$2
          p3=$2
          p4=$2
          p5=$2
          p6=$2
          p7=$2
          p8=$2
          p9=$2
          p10=$2
          p11=$2
          p12=$2
          p13=$2
          p14=$2
          p15=$2
          p16=$2
          p17=$2
          p18=$2
          p19=$2
          shift 2;;
        -o)
          echo "OBFS IS $2"
          OBFS=$2
          shift 2;;
        -a)
          echo "OBFS PARA IS $2"
          OBFS_PARAM=$2
          shift 2;;
        -m)
          echo "METHOD IS $2"
          METHOD=$2
          shift 2;;
        -P)
          echo "PROTOCOL IS $2"
          PROTOCOL=$2
          shift 2;;
        -A)
          echo "PROTOCOL PARAM IS $2"
          PROTOCOL_PARAM=$2
          shift 2;;
        --p1) 
            echo "port1 pass=$2";
            p1=$2
            shift 2;;
        --p2) 
            echo "port2 pass=$2";
            p2=$2
            shift 2;;
        --p3) 
            echo "port3 pass=$2";
            p3=$2
            shift 2;;
        --p4) 
            echo "port4 pass=$2";
            p4=$2
            shift 2;;
        --p5) 
            echo "port5 pass=$2";
            p5=$2
            shift 2;;
        --p6) 
            echo "port6 pass=$2";
            p6=$2
            shift 2;;
        --p7) 
            echo "port7 pass=$2";
            p7=$2
            shift 2;;
        --p8) 
            echo "port8 pass=$2";
            p8=$2
            shift 2;;
        --p9) 
            echo "port9 pass=$2";
            p9=$2
            shift 2;;
        --p10) 
            echo "port10 pass=$2";
            p10=$2
            shift 2;;
        --p11) 
            echo "port11 pass=$2";
            p11=$2
            shift 2;;
        --p12) 
            echo "port12 pass=$2";
            p12=$2
            shift 2;;
        --p13) 
            echo "port13 pass=$2";
            p13=$2
            shift 2;;
        --p14) 
            echo "port14 pass=$2";
            p14=$2
            shift 2;;
        --p15) 
            echo "port15 pass=$2";
            p15=$2
            shift 2;;
        --p16) 
            echo "port16 pass=$2";
            p16=$2
            shift 2;;
        --p17) 
            echo "port17 pass=$2";
            p17=$2
            shift 2;;
        --p18) 
            echo "port18 pass=$2";
            p18=$2
            shift 2;;
        --p19) 
            echo "port19 pass=$2";
            p19=$2
            shift 2;;
        --)
            shift
            break;;
        *)
            echo "Internal error!"
            exit 1;;
    esac
done

echo "Change SSR settings"
echo>/elsesky/shadowsocksr/user-config.json
echo "{">>/elsesky/shadowsocksr/user-config.json
echo " \"server\": \"0.0.0.0\",">>/elsesky/shadowsocksr/user-config.json
echo " \"server_ipv6\": \"::\",">>/elsesky/shadowsocksr/user-config.json
echo " \"local_address\": \"127.0.0.1\",">>/elsesky/shadowsocksr/user-config.json
echo " \"local_port\": 1080,">>/elsesky/shadowsocksr/user-config.json
echo " \"port_password\":{">>/elsesky/shadowsocksr/user-config.json
echo " \"8388\":\"$p1\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8389\":\"$p2\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8390\":\"$p3\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8391\":\"$p4\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8392\":\"$p5\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8393\":\"$p6\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8394\":\"$p7\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8395\":\"$p8\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8396\":\"$p9\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8397\":\"$p10\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8398\":\"$p11\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8399\":\"$p12\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8400\":\"$p13\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8401\":\"$p14\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8402\":\"$p15\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8403\":\"$p16\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8404\":\"$p17\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8405\":\"$p18\",">>/elsesky/shadowsocksr/user-config.json
echo " \"8406\":\"$p19\"">>/elsesky/shadowsocksr/user-config.json
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
echo "Done!"

echo "Change root pass to $ROOT_PASS"
echo "root:$ROOT_PASS" | chpasswd
echo "Done!"

echo "start cron"
systemctl start crond
echo "Done!"
echo "start ssr"
/elsesky/shadowsocksr/shadowsocks/run.sh
echo "Done!"
echo "start sshd"
/usr/sbin/sshd -D
