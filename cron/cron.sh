# !/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
export DISPLAY=:0.0

if [ ! -e /home/apprenant/Bureau/Clone ] #vérifiez si le dossier miniature existe
then
    mkdir /home/apprenant/Bureau/Clone
fi

cp -a /media/apprenant/* /home/apprenant/Bureau/Clone
rsync --info=progress2 /media/apprenant/* /home/apprenant/Bureau/Clone

# In terminal : tapez 'crontab -e' et ajouter => 

# SHELL=/bin/sh
# PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# * * * * * /bin/sh /home/apprenant/Bureau/cron/cron.sh
