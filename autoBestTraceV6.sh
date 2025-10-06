#!/bin/bash

# apt -y install unzip

# install nexttrace
if [ ! -f "/usr/local/bin/nexttrace" ]; then
    curl nxtrace.org/nt | bash
fi

## start to use nexttrace

next() {
    printf "%-70s\n" "-" | sed 's/\s/-/g'
}

clear
next

ip_list=(240e:904:800:8200:3::10 2408:8706:0:5800::23 2409:8702:489c:8:40::1 240e:96c:6000:1700::b00:60 2408:8740:41ff:a:1800::40 2409:8c1e:8fc0:f001:8000:0:b00:111 240e:97c:20:401:800::1c 2408:875c:0:80::91 2409:8754:f111:71:6c::42)
ip_addr=(北京电信 北京联通 天津移动 上海电信 杭州联通 上海移动 广州电信 柳州联通 广州移动)
# ip_len=${#ip_list[@]}

for i in {0..9}
do
	echo ${ip_addr[$i]}
	nexttrace --tcp -M ${ip_list[$i]}
	next
done
