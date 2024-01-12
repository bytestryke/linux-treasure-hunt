#!/bin/bash

# Define the escape sequences for changing the font size and style
bold=$(tput bold)
normal=$(tput sgr0)
big=$(tput setaf 4; tput bold)

# ASCII art to announce the script's purpose
echo "${big}Local Interesting File Hunt${normal}"

sleep 1

echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"

# look for SETUID vulns
echo "${big}Find SETUID Vulns${normal}"
echo "${big}===========================================================================${normal}"
find / -perm -u=s -type f 2>/dev/null
echo "${big}===========================================================================${normal}"

echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"

# look for GETCAP vulns
echo "${big}Find GETCAP Vulns${normal}"
echo "${big}===========================================================================${normal}"
getcap -r / 2>/dev/null
echo "${big}===========================================================================${normal}"

echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"


# look for directories
echo "${big}Find Writeable Directories${normal}"
echo "${big}===========================================================================${normal}"
find / -writable -type d 2>/dev/null
echo "${big}===========================================================================${normal}"

echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"

# search history
echo "${big}Searching Bash_history for kewwords${normal}"
echo "${big}===========================================================================${normal}"
cat ~/.bash_history | grep "su"
cat ~/.bash_history | grep "chmod"
cat ~/.bash_history | grep "root"
cat ~/.bash_history | grep "./"
cat ~/.bash_history | grep "pass"
cat ~/.bash_history | grep "conf"
cat ~/.bash_history | grep "cd"
cat ~/.bash_history | grep "ssh"
cat ~/.bash_history | grep "cat"
cat ~/.bash_history | grep "cp"
cat ~/.bash_history | grep "mv"
cat ~/.bash_history | grep "scp"
cat ~/.bash_history | grep "py"
cat ~/.bash_history | grep "php"
cat ~/.bash_history | grep "sh"
cat ~/.bash_history | grep "rb"
cat ~/.bash_history | grep "elf"

echo "${big}===========================================================================${normal}"

echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"

# Search for TXT files
echo  "Find TXT files:"
echo "${big}===========================================================================${normal}"
find /home/* -type f -name "*.txt" -o ! -name "*.*"
echo "${big}===========================================================================${normal}"

echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"

# Search for ZIP files
echo  "Find ZIP/archives files:"
echo "${big}===========================================================================${normal}"
find /home/* -type f -name "*.zip" -o ! -name "*.*"
find /home/* -type f -name "*.tar" -o ! -name "*.*"
find /home/* -type f -name "*.bz2" -o ! -name "*.*"
find /home/* -type f -name "*.gz" -o ! -name "*.*"
echo "${big}===========================================================================${normal}"

echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"



# Search for scripts
echo "${big}Found scripts${normal}"
echo "${big}===========================================================================${normal}"
for l in $(echo ".py .pyc .pl .go .jar .c .sh .exe .elf");do echo -e "\nFile extension: " $l; find / -name *$l 2>/dev/null | grep -v "doc\|lib\|headers\|share";done

echo "${big}===========================================================================${normal}"


echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"



# Search for Cronjobs
echo "${big}Found Cronjobs${normal}"
echo "${big}===========================================================================${normal}"
cat /etc/crontab && ls -ls /etc/cron.*/
echo "${big}===========================================================================${normal}"


echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"


# Search for SSH keys
echo "${big}Found SSH Private Keys"
echo "${big}===========================================================================${normal}"
grep -rnw "PRIVATE KEY" /home/* 2>/dev/null | grep ":1"
echo "${big}===========================================================================${normal}"


echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"


echo "${big}Found SSH Public Keys${normal}"
echo "${big}===========================================================================${normal}"
grep -rnw "ssh-rsa" /home/* 2>/dev/null | grep ":1"
echo "${big}===========================================================================${normal}"


echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"

# Find Stored Firefox Creds
echo "${big}Stored Firefox Creds"
echo "${big}===========================================================================${normal}"
ls -l ~/.mozilla/firefox/ | grep default 
echo "${big}===========================================================================${normal}"

echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"

# Find Configuration Files
echo "${big}Find Configuration Files"
echo "${big}===========================================================================${normal}"
for l in $(echo ".conf .config .cnf .php");do echo -e "\nFile extension: " $l; find / -name *$l 2>/dev/null | grep -v "lib\|fonts\|share\|core" ;done

echo "${big}===========================================================================${normal}"

echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"

# Find Databases
echo "${big}Find Databases"
echo "${big}===========================================================================${normal}"
for l in $(echo ".sql .db .*db .db*");do echo -e "\nDB File extension: " $l; find / -name *$l 2>/dev/null | grep -v "doc\|lib\|headers\|share\|man";done


echo "${big}===========================================================================${normal}"

echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"
echo "${big} ${normal}"
