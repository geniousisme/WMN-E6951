apt-get update  
apt-get install -y git automake libtool  
export HTTPS_PROXY="http://10.0.0.200:3128"  
git clone https://github.com/esnet/iperf.git  
cd ~/iperf  
./bootstrap.sh
./configure
make  
make install  
ldconfig  
cd  