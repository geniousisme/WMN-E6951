i=0

while [ ${i}!=10 ]
do
	echo "######## The $i-th times #######"
	iperf3 -C reno -c 10.43.4.7 -i 0.1 -J -t 60 | tee iperf3-re-on-$i.json
	echo "End of $i-th times"
	i=$(($i+1)) 
	echo
	echo
done