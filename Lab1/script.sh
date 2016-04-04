cat wmxpings-load.txt | grep "bytes from" | awk 'BEGIN { FS = " |=" } ; { print $10 }' >> wmx-load-rtt.txt
cat wifipings-load.txt | grep "bytes from" | awk 'BEGIN { FS = " |=" } ; { print $10 }' >> wifi-load-rtt.txt
cat wmxpings.txt | grep "bytes from" | awk 'BEGIN { FS = " |=" } ; { print $10 }' >> wmx-rtt.txt
cat wifipings.txt | grep "bytes from" | awk 'BEGIN { FS = " |=" } ; { print $10 }' >> wifi-rtt.txt