#FIndMe @ CU !!
 	
- [Requirements](#requirements)
- [Using FIND](#using-find)
  - [1. Fingerprint locations](#1-fingerprint-locations)
  - [2. Analyze fingerprints](#2-analyze-fingerprints)
  - [3. Track locations](#3-track-locations)

**FIndMe @CU is a web application accompanied with open source app (FIND) to allow user to use your smartphone to find your and your friends' location in Columbia University. User can easily use this application to distinguish whether you are in which floor of the building in Columbia Univ, for example Lerner Hall - 1F, Uris Hall - 2F, etc.
<blockquote>Simply put, FIND will allow you to replace <em>tons</em> of motion sensors with a <em>single</em> smartphone!</blockquote>

The system is built on two main components - a server program and a fingerprinting device. The fingerprinting device (android app - FIND) sends RSSI data to the server with machine learning method to identify the location of the user. It then returns the result to website - [FIndMe @ CU](http://45.79.141.71:8888) and also stores the result on the server.

# Requirements
To use this system you need to have the following
- Andorid Device with FIND app
- Either WiFi capable device to checkout the website.

# Using FIND
First [download the app from the Google Play store](https://play.google.com/store/apps/details?id=com.hcp.find)
1. Open the app in Columbia University.
2. Set your server to 45.79.141.71:8888.
3. Simply hit the track button to start tracking yout location.
4. Open any web browser to check where you and your friends are!