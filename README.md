# Case Study
=============

Created documentation on this case study along with all chronological steps.


# Coding Challenge
====================

Create script with name "main.sh", which is basically covering scope of coding challenge -

0 If process is not found, wait for 2 sec and restart it.
1 If process is found, all ok.
* If process running 2 or more, kill the last.

In all above 3 steps, generate logs for each events.

To make my script as daemon, follwing below steps :
1) Set right permission to script.
sudo chmod +x /usr/bin/main.sh

2) Create A SystemD File. Save the file and close it.
sudo nano /lib/systemd/system/shellscript.service 

File Content-
[Unit]
Description=Shell script for process status check

[Service]
ExecStart=/usr/bin/main.sh

[Install]
WantedBy=multi-user.target

3) Enable New Service by reloading systemctl daemon to read new file. We need to reload this deamon each time after making any changes in  .service file.

sudo systemctl daemon-reload 

We can enable the service to start on system boot, also start the service using the following commands.

sudo systemctl enable shellscript.service 
sudo systemctl start shellscript.service

To check status :
sudo systemctl status shellscript.service 
 


 
