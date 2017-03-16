FROM centos:7.3.1611

#FROM centos:6.7

##########################################################################
### update glibc-common for locale files
RUN yum update -y glibc-common

##########################################################################
# all yum installations here
RUN yum install -y sudo passwd openssh-server openssh-clients tar screen crontabs strace telnet perl libpcap bc patch ntp dnsmasq unzip pax which git nano

##########################################################################
# add epel repository
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

#RUN (yum install -y hiera ruby lsyncd sshpass rng-tools)
RUN (yum install -y ruby lsyncd sshpass rng-tools)

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
##########################################################################
#git clone
RUN git clone -b manyuser https://github.com/shadowsocksr/shadowsocksr.git /elsesky/shadowsocksr; \

RUN (chmod +X /elsesky/shadowsocksr/*.sh; \
    chmod +x /elsesky/shadowsocksr/shadowsocks/*.sh; \
    cp -n /elsesky/shadowsocksr/apiconfig.py /elsesky/shadowsocksr/userapiconfig.py; \
    cp -n /elsesky/shadowsocksr/config.json /elsesky/shadowsocksr/user-config.json; \
    cp -n /elsesky/shadowsocksr/mysql.json /elsesky/shadowsocksr/usermysql.json; \
     )



##########################################################################
# passwords 
RUN echo "root:password" | chpasswd

EXPOSE 22
CMD service crond start; /usr/sbin/sshd -D
