#FROM centos:7.3.1611

FROM centos:6.7

##########################################################################
### update glibc-common for locale files
RUN yum update -y glibc-common

##########################################################################
# all yum installations here
RUN yum install -y sudo passwd openssh-server openssh-clients tar screen crontabs strace telnet perl libpcap bc patch ntp dnsmasq unzip pax which git nano || true

##########################################################################
# add epel repository
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

#RUN (yum install -y hiera ruby lsyncd sshpass rng-tools)
RUN (yum install -y hiera lsyncd sshpass rng-tools || true)

# start sshd to generate host keys, patch sshd_config and enable yum repos
RUN (service sshd start; \
     sed -i 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config; \
     sed -i 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config; \
     sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config; \
     sed -i 's/enabled=0/enabled=1/' /etc/yum.repos.d/CentOS-Base.repo)

RUN (mkdir -p /root/.ssh/; \
     rm -f /var/lib/rpm/.rpm.lock; \
     echo "StrictHostKeyChecking=no" > /root/.ssh/config; \
     echo "UserKnownHostsFile=/dev/null" >> /root/.ssh/config)

# terminfo for screen.xterm-256color
ADD screen.xterm-256color /root/
RUN tic /root/screen.xterm-256color
##########################################################################
#self action
RUN  (mkdir /elsesky; \
     cd /elsesky)

# -----------------------------------------------------------------------------
# Set default environment variables
# -----------------------------------------------------------------------------
ENV PORT_PASS "dengbo801018~!"
ENV METHOD "aes-256-cfb"
ENV PROTOCOL "auth_aes128_md5" 
ENV PROTOCOL_PARAM "" 
ENV OBFS "tls1.2_ticket_auth_compatible" 
ENV OBFS_PARAM "" 
ENV ROOT_PASS "password" 

##########################################################################
#git clone
RUN git clone -b manyuser https://github.com/shadowsocksr/shadowsocksr.git /elsesky/shadowsocksr
RUN chmod +x /elsesky/shadowsocksr/*.sh
RUN chmod +x /elsesky/shadowsocksr/shadowsocks/*.sh
RUN cp -n /elsesky/shadowsocksr/apiconfig.py /elsesky/shadowsocksr/userapiconfig.py
RUN cp -n /elsesky/shadowsocksr/config.json /elsesky/shadowsocksr/user-config.json
RUN cp -n /elsesky/shadowsocksr/mysql.json /elsesky/shadowsocksr/usermysql.json
##########################################################################
#modify ssr config
RUN echo>/elsesky/shadowsocksr/user-config.json
RUN echo "{">>/elsesky/shadowsocksr/user-config.json
RUN echo "    \"server\": \"0.0.0.0\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "    \"server_ipv6\": \"::\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "    \"local_address\": \"127.0.0.1\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "    \"local_port\": 1080,">>/elsesky/shadowsocksr/user-config.json
RUN echo "    \"port_password\":{">>/elsesky/shadowsocksr/user-config.json
RUN echo "        \"8388\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "        \"8389\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "        \"8390\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "        \"8391\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "        \"8392\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "        \"8393\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "        \"8394\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "        \"8395\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "        \"8396\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "        \"8397\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "        \"8398\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "        \"8399\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "        \"8400\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "        \"8401\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "        \"8402\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "        \"8403\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "        \"8404\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "        \"8405\":\"$PORT_PASS\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "        \"8406\":\"$PORT_PASS\"">>/elsesky/shadowsocksr/user-config.json
RUN echo "    },">>/elsesky/shadowsocksr/user-config.json
RUN echo "    \"method\": \"$METHOD\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "    \"protocol\": \"$PROTOCOL\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "    \"protocol_param\": \"$PROTOCOL_PARAM\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "    \"obfs\": \"$OBFS\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "    \"obfs_param\": \"$OBFS_PARAM\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "    \"speed_limit_per_con\": 0,">>/elsesky/shadowsocksr/user-config.json
RUN echo "    \"speed_limit_per_user\": 0,">>/elsesky/shadowsocksr/user-config.json
RUN echo "">>/elsesky/shadowsocksr/user-config.json
RUN echo "    \"additional_ports\" : {}, // only works under multi-user mode">>/elsesky/shadowsocksr/user-config.json
RUN echo "    \"timeout\": 120,">>/elsesky/shadowsocksr/user-config.json
RUN echo "    \"udp_timeout\": 60,">>/elsesky/shadowsocksr/user-config.json
RUN echo "    \"dns_ipv6\": false,">>/elsesky/shadowsocksr/user-config.json
RUN echo "    \"connect_verbose_info\": 0,">>/elsesky/shadowsocksr/user-config.json
RUN echo "    \"redirect\": \"\",">>/elsesky/shadowsocksr/user-config.json
RUN echo "    \"fast_open\": false">>/elsesky/shadowsocksr/user-config.json
RUN echo "}">>/elsesky/shadowsocksr/user-config.json


##########################################################################
# passwords 
RUN echo "root:$ROOT_PASS" | chpasswd

##########################################################################
# running shell 
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 22
#CMD /usr/local/bin/entrypoint.sh;echo 3

# Configure container to run as an executable
CMD ["/usr/local/bin/entrypoint.sh"]
