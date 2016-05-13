i=0

while [ ${i}!=10 ]
do
	echo "######## The $i-th times #######"
	i=$(($i+1)) 
	iperf -c 10.43.4.3 -t 4  
	iperf -c 10.43.4.4 -t 4  
	iperf -c 10.43.4.5 -t 4  
	iperf -c 10.43.4.7 -t 4  
	echo "End of $i-th times"
	echo
	echo
done

# Set first MCS profile to 13 (QPSK 1/2)
wget -qO- "http://wimaxrf:5052/wimaxrf/bs/dlprofile?dlprof1=13"  
# disable all others
wget -qO- "http://wimaxrf:5052/wimaxrf/bs/dlprofile?dlprof2=255&dlprof3=255&dlprof4=255&dlprof5=255&dlprof6=255&dlprof7=255&dlprof8=255"  

sleep 1m

i=0
while [ ${i}!=10 ]
do
	echo "######## The $i-th times #######"
	i=$(($i+1)) 
	iperf -c 10.43.4.3 -t 4  
	iperf -c 10.43.4.4 -t 4  
	iperf -c 10.43.4.5 -t 4  
	iperf -c 10.43.4.7 -t 4  
	echo "End of $i-th times"
	echo
	echo
done

# Set first MCS profile to 17 (16QAM 3/4)
wget -qO- "http://wimaxrf:5052/wimaxrf/bs/dlprofile?dlprof1=17"  
# disable all others
wget -qO- "http://wimaxrf:5052/wimaxrf/bs/dlprofile?dlprof2=255&dlprof3=255&dlprof4=255&dlprof5=255&dlprof6=255&dlprof7=255&dlprof8=255"  

sleep 1m

i=0
while [ ${i}!=10 ]
do
	echo "######## The $i-th times #######"
	i=$(($i+1)) 
	iperf -c 10.43.4.3 -t 4  
	iperf -c 10.43.4.4 -t 4  
	iperf -c 10.43.4.5 -t 4  
	iperf -c 10.43.4.7 -t 4  
	echo "End of $i-th times"
	echo
	echo
done