#!/bin/bash
# create a "telegram" file in /usr/bin with commands starting the file 

#####
# write into the file:

# change directory to the "git-executable"
echo "cd $PWD/Telegram" > /usr/bin/telegram

# execute the "git executable"
echo "./Telegram" >> /usr/bin/telegram

#####
# change file permissions:

# change the permissions
chmod 755 /usr/bin/telegram

# make the file executable
chmod +x /usr/bin/telegram
