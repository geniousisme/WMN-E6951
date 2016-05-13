wget -qO- "http://wimaxrf:5052/wimaxrf/bs/get?la_dl" | xml_pp  
wget -qO- "http://wimaxrf:5052/wimaxrf/bs/dlprofile" | xml_pp | grep "value"  
wget -qO- "http://wimaxrf:5052/wimaxrf/bs/get?mpc" | xml_pp | grep "dl_cn_list\."  
wget -qO- "http://wimaxrf:5052/wimaxrf/bs/get?la_ul" | xml_pp  
wget -qO- "http://wimaxrf:5052/wimaxrf/bs/ulprofile" | xml_pp | grep "value"  
wget -qO- "http://wimaxrf:5052/wimaxrf/bs/get?bs_tx_power" | xml_pp  


omf load -i wmxlab-mcs.ndz -t omf.witest.node7,omf.witest.node5,omf.witest.node3,omf.witest.node4  
omf tell -a on -t omf.witest.node7,omf.witest.node5,omf.witest.node3,omf.witest.node4  


echo "Finish all set up process!!!"
echo
echo