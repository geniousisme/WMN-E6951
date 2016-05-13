wget -qO- "http://wimaxrf:5052/wimaxrf/bs/get?la_dl" | xml_pp  
wget -qO- "http://wimaxrf:5052/wimaxrf/bs/dlprofile" | xml_pp | grep "value"  
wget -qO- "http://wimaxrf:5052/wimaxrf/bs/get?mpc" | xml_pp | grep "dl_cn_list\."  
wget -qO- "http://wimaxrf:5052/wimaxrf/bs/get?la_ul" | xml_pp  
wget -qO- "http://wimaxrf:5052/wimaxrf/bs/ulprofile" | xml_pp | grep "value"  
wget -qO- "http://wimaxrf:5052/wimaxrf/bs/get?bs_tx_power" | xml_pp  


omf load -i wmxlab-mcs.ndz -t omf.witest.node7,omf.witest.node2,omf.witest.node3,omf.witest.node4  
omf tell -a on -t omf.witest.node7,omf.witest.node2,omf.witest.node3,omf.witest.node4  

omf load -i wmxlab-mcs.ndz -t omf.witest.node7,omf.witest.node5,omf.witest.node3,omf.witest.node4  
omf tell -a on -t omf.witest.node7,omf.witest.node5,omf.witest.node3,omf.witest.node4  


omf exec mcs.rb  


sqlite3 -csv /var/lib/oml2/geni-ch3141-default_slice-2016-04-15t14.51.54-04.00.sq3 "SELECT * FROM mcs_dl;"  > dl.csv
sqlite3 -csv /var/lib/oml2/geni-ch3141-default_slice-2016-04-15t14.51.54-04.00.sq3 "SELECT * FROM mcs_ul;"  > ul.csv


wimaxcu connect network 51  
n=$(hostname)  
n=${n:4}  
ifconfig wmx0 10.43.4.$n netmask 255.255.255.0  

wimaxcu status link  

iperf -s -i 1  

iperf -s -i 1 -D > iperflog.txt

# to node2
iperf -c 10.43.4.2 -t 4  
# to node3
iperf -c 10.43.4.3 -t 4  
# to node4
iperf -c 10.43.4.4 -t 4  
# to node7
iperf -c 10.43.4.7 -t 4  




# to node5
iperf -c 10.43.4.5 -t 4  
# to node3
iperf -c 10.43.4.3 -t 4  
# to node4
iperf -c 10.43.4.4 -t 4  
# to node7
iperf -c 10.43.4.7 -t 4  


# Set first MCS profile to 13 (QPSK 1/2)
wget -qO- "http://wimaxrf:5052/wimaxrf/bs/dlprofile?dlprof1=13"  
# disable all others
wget -qO- "http://wimaxrf:5052/wimaxrf/bs/dlprofile?dlprof2=255&dlprof3=255&dlprof4=255&dlprof5=255&dlprof6=255&dlprof7=255&dlprof8=255"  


# Set first MCS profile to 17 (16QAM 3/4)
wget -qO- "http://wimaxrf:5052/wimaxrf/bs/dlprofile?dlprof1=17"  
# disable all others
wget -qO- "http://wimaxrf:5052/wimaxrf/bs/dlprofile?dlprof2=255&dlprof3=255&dlprof4=255&dlprof5=255&dlprof6=255&dlprof7=255&dlprof8=255"  