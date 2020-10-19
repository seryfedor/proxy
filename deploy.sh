#!/bin/bash

echo  "Введите имя сайта:"

sitename=$2
#read  sitename

yum -y update
yum -y install epel-release
yum -y install nginx mc nano net-tools ncdu yum-utils htop iftop python2-certbot-nginx
systemctl stop firewalld
systemctl disable firewalld


mkdir -p /root/backup
cp /etc/nginx/nginx.conf /root/backup/
cp /etc/nginx/conf.d/default.conf /root/backup/
cp /etc/sysctl.conf /root/backup/

cat > /etc/nginx/nginx.conf << EOL

user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

# Load dynamic modules. See /usr/share/doc/nginx/README.dynamic.
include /usr/share/nginx/modules/*.conf;

events {
    worker_connections 1024;
}

http {
    log_format  main  '\$remote_addr - \$remote_user [\$time_local] "\$request" '
                      '\$status \$body_bytes_sent "\$http_referer" '
                      '"\$http_user_agent" "\$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 2048;
	
	large_client_header_buffers 4 16k;
    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;

    # Load modular configuration files from the /etc/nginx/conf.d directory.
    # See http://nginx.org/en/docs/ngx_core_module.html#include
    # for more information.
    include /etc/nginx/conf.d/*.conf;


}
EOL


echo "net.netfilter.nf_conntrack_max=99999999" >> /etc/sysctl.conf
echo "fs.inotify.max_user_watches=99999999" >> /etc/sysctl.conf
echo "net.ipv4.tcp_max_tw_buckets=99999999" >> /etc/sysctl.conf
echo "net.ipv4.tcp_max_tw_buckets_ub=65535" >> /etc/sysctl.conf
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
echo "net.ipv4.tcp_syncookies=1" >> /etc/sysctl.conf
echo "net.ipv4.tcp_max_syn_backlog=65536" >> /etc/sysctl.conf
echo "net.core.somaxconn=65535" >> /etc/sysctl.conf
echo "fs.file-max=99999999" >> /etc/sysctl.conf
echo "kernel.sem=1000 128000 128 512" >> /etc/sysctl.conf
echo "vm.dirty_ratio=5" >> /etc/sysctl.conf
echo "fs.aio-max-nr=262144" >> /etc/sysctl.conf
echo "kernel.panic=1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.rp_filter=1" >> /etc/sysctl.conf
echo "kernel.sysrq=1" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.send_redirects=1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.send_redirects=0" >> /etc/sysctl.conf
echo "net.ipv4.ip_dynaddr=1" >> /etc/sysctl.conf
# new 01now2015
echo "kernel.sem=1000 256000 128 1024" >> /etc/sysctl.conf
echo "kernel.msgmni=1024" >> /etc/sysctl.conf
#
# new 10apr2016
echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf
echo "fs.inotify.max_user_instances=1024" >> /etc/sysctl.conf

echo "kernel.msgmnb=65536" >> /etc/sysctl.conf
echo "kernel.msgmax=65536" >> /etc/sysctl.conf
echo "kernel.shmmax=4294967295" >> /etc/sysctl.conf
echo "kernel.shmall=268435456" >> /etc/sysctl.conf
echo "kernel.shmmni=4096" >> /etc/sysctl.conf
echo "net.ipv4.tcp_keepalive_time=15" >> /etc/sysctl.conf
echo "net.ipv4.tcp_keepalive_intvl=10" >> /etc/sysctl.conf
echo "net.ipv4.tcp_keepalive_probes=5" >> /etc/sysctl.conf
echo "net.ipv4.tcp_fin_timeout=30" >> /etc/sysctl.conf
echo "net.ipv4.tcp_window_scaling=0" >> /etc/sysctl.conf
echo "net.ipv4.tcp_sack=0" >> /etc/sysctl.conf
echo "net.ipv4.tcp_timestamps=0" >> /etc/sysctl.conf
echo "vm.swappiness=10" >> /etc/sysctl.conf
echo "vm.overcommit_memory=1" >> /etc/sysctl.conf

# new test 26102016
# free_mem=$((`free | grep Mem | awk '{print $2}'`/3))
# echo "vm.min_free_kbytes=$free_mem" >> /etc/sysctl.conf
# sed -i "s/.*vm\.min_free_kbytes.*/vm.min_free_kbytes=$free_mem/g" /etc/sysctl.conf

sed -i 's/.*net.netfilter.nf_conntrack_max.*/net.netfilter.nf_conntrack_max=99999999/g' /etc/sysctl.conf
sed -i 's/.*fs.inotify.max_user_watches.*/fs.inotify.max_user_watches=99999999/g' /etc/sysctl.conf
sed -i 's/.*net.ipv4.net.ipv4.tcp_max_tw_buckets.*/net.ipv4.net.ipv4.tcp_max_tw_buckets=99999999/g' /etc/sysctl.conf
sed -i 's/.*tcp_max_tw_buckets_ub.*/net.ipv4.tcp_max_tw_buckets_ub=65535/g' /etc/sysctl.conf
sed -i 's/.*net.ipv4.tcp_max_tw_buckets_ub.*/net.ipv4.tcp_max_tw_buckets_ub=65535/g' /etc/sysctl.conf
sed -i 's/.*net.ipv4.ip_forward.*/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
sed -i 's/.*net.ipv4.tcp_syncookies.*/net.ipv4.tcp_syncookies=1/g' /etc/sysctl.conf
sed -i 's/.*net.ipv4.tcp_max_syn_backlog.*/net.ipv4.tcp_max_syn_backlog=65536/g' /etc/sysctl.conf
sed -i 's/.*net.core.somaxconn.*/net.core.somaxconn=65535/g' /etc/sysctl.conf
sed -i 's/.*fs.file-max.*/fs.file-max=99999999/g' /etc/sysctl.conf
sed -i 's/.*kernel.sem.*/kernel.sem=1000 128000 128 512/g' /etc/sysctl.conf
sed -i 's/.*vm.dirty_ratio.*/vm.dirty_ratio=5/g' /etc/sysctl.conf
sed -i 's/.*fs.aio-max-nr.*/fs.aio-max-nr=262144/g' /etc/sysctl.conf
sed -i 's/.*kernel.panic.*/kernel.panic=1/g' /etc/sysctl.conf
sed -i 's/.*net.ipv4.conf.all.rp_filter.*/net.ipv4.conf.all.rp_filter=1/g' /etc/sysctl.conf
sed -i 's/.*kernel.sysrq.*/kernel.sysrq=1/g' /etc/sysctl.conf
sed -i 's/.*net.ipv4.conf.default.send_redirects.*/net.ipv4.conf.default.send_redirects=1/g' /etc/sysctl.conf
sed -i 's/.*net.ipv4.conf.all.send_redirects.*/net.ipv4.conf.all.send_redirects=0/g' /etc/sysctl.conf
sed -i 's/.*net.ipv4.ip_dynaddr.*/net.ipv4.ip_dynaddr=1/g' /etc/sysctl.conf
# new 01now2015
sed -i 's/.*kernel.sem.*/kernel.sem=1000 256000 128 1024/g' /etc/sysctl.conf
sed -i 's/.*kernel.msgmn.*/kernel.msgmn=1024/g' /etc/sysctl.conf
#
# new 10apr2016
sed -i 's/.*fs.inotify.max_user_watches.*/fs.inotify.max_user_watches=524288/g' /etc/sysctl.conf
sed -i 's/.*fs.inotify.max_user_instances.*/fs.inotify.max_user_instances=1024/g' /etc/sysctl.conf

sed -i 's/.*kernel.msgmnb.*/kernel.msgmnb=65536/g' /etc/sysctl.conf
sed -i 's/.*kernel.msgmax.*/kernel.msgmax=65536/g' /etc/sysctl.conf
sed -i 's/.*kernel.shmmax.*/kernel.shmmax=4294967295/g' /etc/sysctl.conf
sed -i 's/.*kernel.shmall.*/kernel.shmall=268435456/g' /etc/sysctl.conf
sed -i 's/.*kernel.shmmni.*/kernel.shmmni=4096/g' /etc/sysctl.conf
sed -i 's/.*net.ipv4.tcp_keepalive_time.*/net.ipv4.tcp_keepalive_time=15/g' /etc/sysctl.conf
sed -i 's/.*net.ipv4.tcp_keepalive_intvl.*/net.ipv4.tcp_keepalive_intvl=10/g' /etc/sysctl.conf
sed -i 's/.*net.ipv4.tcp_keepalive_probes.*/net.ipv4.tcp_keepalive_probes=5/g' /etc/sysctl.conf
sed -i 's/.*net.ipv4.tcp_fin_timeout.*/net.ipv4.tcp_fin_timeout=30/g' /etc/sysctl.conf
sed -i 's/.*net.ipv4.tcp_window_scaling.*/net.ipv4.tcp_window_scaling=0/g' /etc/sysctl.conf
sed -i 's/.*net.ipv4.tcp_sack.*/net.ipv4.tcp_sack=0/g' /etc/sysctl.conf
sed -i 's/.*net.ipv4.tcp_timestamps.*/net.ipv4.tcp_timestamps=0/g' /etc/sysctl.conf 
sed -i 's/.*vm.swappiness.*/vm.swappiness=10/g' /etc/sysctl.conf 
sed -i 's/.*vm.overcommit_memory.*/vm.overcommit_memory=1/g' /etc/sysctl.conf 



# kill duplicates 
mv -f /etc/sysctl.conf /etc/sysctl.old
cat /etc/sysctl.old | sed 's/ =/=/g' | sed 's/= /=/g' | grep -v -e \# -e ^$ > /etc/sysctl.new
awk '! a[$0]++' /etc/sysctl.new >  /etc/sysctl.conf

# apply new parametrs 
sysctl -p

# file limis
cat > /etc/security/limits.d/nofile.conf << EOL
root      soft    nofile           1048576
root      hard    nofile           1048576
*         soft    nofile           1048576
*         hard    nofile           1048576    
*         hard    core           0
EOL

cat > /etc/security/limits.d/90-nproc.conf << EOL
*       hard    nproc   unlimited
*       soft    nproc   unlimited
root    hard    nproc   unlimited
root    soft    nproc   unlimited
EOL

cat > /etc/security/limits.d/90-stack.conf << EOL
*       hard    stack   unlimited
*       soft    stack   unlimited
root    hard    stack   unlimited
root    soft    stack   unlimited
EOL



cat > /etc/nginx/conf.d/realip.conf <<EOL

set_real_ip_from 103.21.244.0/22;
set_real_ip_from 103.22.200.0/22;
set_real_ip_from 103.31.4.0/22;
set_real_ip_from 104.16.0.0/12;
set_real_ip_from 108.162.192.0/18;
set_real_ip_from 131.0.72.0/22;
set_real_ip_from 141.101.64.0/18;
set_real_ip_from 162.158.0.0/15;
set_real_ip_from 172.64.0.0/13;
set_real_ip_from 173.245.48.0/20;
set_real_ip_from 188.114.96.0/20;
set_real_ip_from 190.93.240.0/20;
set_real_ip_from 197.234.240.0/22;
set_real_ip_from 198.41.128.0/17;
set_real_ip_from 2400:cb00::/32;
set_real_ip_from 2606:4700::/32;
set_real_ip_from 2803:f800::/32;
set_real_ip_from 2405:b500::/32;
set_real_ip_from 2405:8100::/32;
set_real_ip_from 2c0f:f248::/32;
set_real_ip_from 2a06:98c0::/29;
real_ip_header CF-Connecting-IP;
#real_ip_header X-Forwarded-For;

EOL


cat > /etc/nginx/conf.d/$sitename.conf <<EOL

server {
	
	access_log /var/log/nginx/$sitename-access.log;
	error_log /var/log/nginx/$sitename-error.log;

	root /var/www/$sitename;

	index index.php index.html index.htm ;

	server_name $sitename www.$sitename;

location / {
    proxy_pass https://$1;
#proxy_set_header Host $http_host;
    proxy_set_header Host \$host;
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    proxy_set_header X-Real-IP \$remote_addr;
    }


    listen 80;

}
EOL

systemctl restart nginx

#echo "Полуить LE сертификат?[Y/y|N/n]:"
#read   le


#if [[ $le == "Y" || $le == "y" ]]; then
#        certbot --nginx -d $sitename
#else
#        echo "Bye-bye"
#	exit 1
#fi
