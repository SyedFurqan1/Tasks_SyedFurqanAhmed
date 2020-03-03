#!/bin/bash

#Checking for the available RAM 

echo "Script Starting - Syed Furqan Ahmed"

# the command 'cat /proc/meminfo' prints out some memory info
# from that information we select 'MemFree' line using grep command line
# utility
echo "RAM available:"
cat /proc/meminfo | grep MemFree
echo "###################################################"

# the command 'cat /proc/cpuinfo' preints out some cpu information for every 
# core. 
# To avoid repetition of the information we add "-m1" since that will print 
# print only 1 line. 
echo "Number of CPUs available"
cat /proc/cpuinfo | grep "cpu cores" -m1
echo "###################################################"

# we can use the 'df' command to get all the drive related information for 
# every mount point. -H can be used to display it in a human readable format.
# we use the --output command to only specify the relevant outputs for this 
# task

echo "Available storage space on all mount points"
df -h --output=source,avail
echo "###################################################"

# we use the process status (ps) command line and -eo to list down the fields
# we want to see. we sort the processes by cpu usage. We can also sort 
# the processes by memory by --sort=%mem and list top memory using processes.
# pipe the command search (grep) by the root user and display the top 5 processes

echo "Top 5 processes for the root user based on CPU usage:"
echo "Columns displayed are USER, PID, CMD, CPU, MEM"
ps -eo user,pid,cmd,%cpu,%mem --sort=%cpu | grep "root" -m5
echo "###################################################"

# list down the number of ports and processes listening to that port.
# Making sure net-tools are installed. 
# We use netstat command line utility to display connections
# We can specify the command -tulpn which displays tcp, udp, listening ports,
# processes and network which displays our result.

echo "Making sure net-tools is installed."
echo "IF NOT INSTALLED then run: sudo apt install net-tools"
sudo apt install net-tools
echo "###################################################"
echo "!!PORTS are defined in Local Address after colon (:)"
echo "Columns displayed are:"
echo "PROTOCOL, REC-Q, SEND-Q, LOCAL ADDRESS, FORIEGN ADDRESS, STATUS, PID/Process Name"
netstat -tulpn | grep "LISTEN"

echo "###################################################"

#********** LISTING FILES FOR A DIRECTORY *************

# For the sake of this task, we can take the directory as an input 
# But for the job to not prompt every 5 minutes we have used a pre-determined
# directory
# dir is the variable in which the input can be taken 
# du utility is used to list disk usage and file name, -h is used to human 
# readable (MBs - except for smaller files)
# -c displays all files and adds a total line
# -d adds the depth for the directorys, max-depth is set to 0 hence we only
# get files and du doesn't go into subdirectories 
# We sort the list by human readable format
# to get the required order (descending) we reverse using the sorted list by -r
#echo "A defined directory '/lib/' has been entered, uncomment and edit lines in bash script to prompt"


# !!Uncomment the following lines to prompt directory, otherwise a defined 
# one will be used!!.

#echo "!Enter directory in the format of '/%dir/%dir/' format."
#read -p "Please enter the directory name to print the 'files' and sizes:" dir
#sudo du -BM -c -d0 $dir* | sort -h -r

echo "A defined directory '/dev/' has been entered, uncomment line in bash script to prompt!"
sudo du -BM -c -d0 /dev/* | sort -h -r  #comment this line when prompting dir
echo "###################################################"




#******************* LISTING FOLDERS FOR A DIRECTORY **************

# For the sake of this task, we can take the directory as an input 
# But for the job to not prompt every 5 minutes we have used a pre-determined
# directory
# -s summarises the disk usage for every argument/folder/directories and does
# not go into the subdirectories. we use the directory in the format of 
# /dir/*/ format so that the files are excluded and * represents a SELECT ALL
# before the last '/'. We sort the folders in a human readable format by -h 
# and reverse it to get a descending order.

# !!Uncomment the following lines to prompt directory, otherwise a defined 
# one will be used!!.
 
#echo "!Enter directory in the format of '/%dir/%dir/' format."
#read -p "Please enter the directory name to print the 'folders' and sizes:" x
#sudo du -s -h $x*/ | sort -h -r

echo "A defined directory '/lib/' has been entered, uncomment line in bash script to prompt"
sudo du -s -BM /lib/*/ | sort -h -r  
echo "###################################################"




