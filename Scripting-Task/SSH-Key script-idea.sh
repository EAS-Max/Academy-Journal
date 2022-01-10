#!bin/bash

 #Example of use of SSH keys to remove some user input

 ssh-keygen -t rsa -b 4096
 #should prompt for passphrase in this case i would leave it blank

 scp ~/.ssh/id_rsa.pub root@192.168.1.175:/root/uploadedkey.pub

 ssh root@192.168.1.175
 #will prompt password

mkdir .ssh
cat ~/.ssh/uploadedkey.pub >> ~/.ssh/authorized_keys
#^^^ do this within the 175 machine

chmod 700 ~/.ssh

chmod 600 ~/.ssh/*

#Using keygen was the first thought that came to me when thinking 
#about what could reduce the use of password prompts and other prompts
#however i quickly realised that this would take more or less the same amount of
#input as in order to add the keys to a machine you must first ssh into it using
#a password which defeats the purpose of this challenge. however I am sure there 
#is probably a way to use ssh keys in a way that would reduce our user input but 
#as of right now I do not know it which is why i looked for other possible solutions.
#(this script is not intended for actual use, just used as first draft example)

#Also to automate the final check to see if the apps were running I would simply
#add a curl command to the end of the master script to curl the apps to see if they are running.
