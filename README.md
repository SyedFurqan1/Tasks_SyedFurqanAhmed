# Tasks_SyedFurqanAhmed

# ------------ Method 1 to add the bash script to the crontab for the linux environment-----------------

# You can copy and paste the crontab command file in /var/spool/cron/crontabs/

# Make sure you remane the file for the $User 


# ------------ Method 2 to add the bash script to the crontab for the linux environment-----------------

# Go to the terminal and enter "sudo crontab -e" and enter the password. 
# you can also just use "crontab -e" to execute the cronjob without elevated/admin rights.

# Add the following line at the end of the script of this crontab

*/5 * * * * /home/syed/Task1.sh >> /home/syed/Task1_log_`date +\%S-\%M-\%H-\%Y-\%m-\%d`.log

# Make sure the %directories are correct. 

# Save the crontab. 

# ----------------------- Tasks 1 bash script file has been tested and outputs every required information on the terminal---------

