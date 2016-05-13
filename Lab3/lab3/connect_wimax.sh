wimaxcu scan  
wimaxcu connect network 51

n=$(hostname)  
n=${n:4}  
ifconfig wmx0 10.43.4.$n netmask 255.255.255.0  

ping -c 5 10.43.4.200  