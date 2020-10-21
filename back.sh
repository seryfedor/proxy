#!/bin/bash

mkdir -p /root/backup
cp /etc/nginx/nginx.conf /root/backup/
cp /etc/sysctl.conf /root/backup/

#sysctl.conf

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

#nginx


echo "set_real_ip_from 0.0.0.0/0;" >> /etc/nginx/conf.d/local/keitaro/server.inc 
sed -i 's/.*worker_processes.*/worker_processes auto;/' /etc/nginx/nginx.conf
sed -i '/worker_processes auto;/a worker_rlimit_nofile 40960;' /etc/nginx/nginx.conf

nginx -s reload
