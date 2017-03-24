
#log roller for dnsmasq

#daemon launcher

#viviparous 2017

#args =workdir =storagedir

#workdir should contain the logrotate script and dnsmasq.log

workdir=$1
storagedir=$2


while [ 1 ]; do
 cd $workdir
 sh logrotate.sh 5000000 dnsmasq.log $storagedir
 sleep 900
done
