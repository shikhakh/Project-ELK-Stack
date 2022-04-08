#!/bin/bash
# script that will execute various Linux tools to parse information about the system.
# Each of these tools should output results to a text file inside its respective system 
# information directory


free -h > ~/backups/freemem/free_mem.txt

du -h > ~/backups/diskuse/disk_usage.txt

lsof > ~/backups/openlist/open_list.txt
