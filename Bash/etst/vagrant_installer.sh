	#!/bin/bash

#############################################
# ZOGHLAMI Mohamed                          #
# 9/10/2019                                 #
# Script Vagrant / nodejs                   #
#                                           #
#############################################

deleteAll="false"

echo -e "Voulez-vous crée une\033[31m VM \033[0m? \033[32moui/non\033[0m"
read reponse

boucle_main="true"
while [ $boucle_main == "true" ]
do
    # Reponse negative, quitter
    if [ $reponse == "non" ]
    then
        #echo -e "D'accord, \033[34mBonne journée\033[0m !"
        boucle_main="false"

    # Reponse positive, créer la VM
    elif [ $reponse == "oui" ]
    then
        echo -e "Quel serat le nom de votre dossier local ?\033[32m Entrez un nom \033[0m? \033[31m (data par défault) \033[0m "
        read name
        if [ $name == "non" ]
        then
            name="data"
        fi
        echo -e "Quel box voulez-vous ? - unbuntu/xenial64 => \033[36m Tapez 1 \033[0m - ubuntu/trusty64 \033[33m Tapez 2 \033[0m "
        read box
        if [ $box == "2" ]
        then
            boxChoice="ubuntu/trusty64"
        else
            boxChoice="ubuntu/xenial64" 
        fi
        # Variables
        l1='Vagrant.configure("2") do |config|'
        l2='config.vm.box = "'${boxChoice}'"'
        l3='config.vm.network "private_network", ip: "192.168.33.10"'
        l4="config.vm.synced_folder \"./${name}\", \"/var/www/html\""
        l5='end'
        #creation du fichier Vagranfile
        touch Vagrantfile
        echo $l1 > Vagrantfile
        echo $l2 >> Vagrantfile
        echo $l3 >> Vagrantfile
        echo $l4 >> Vagrantfile
        echo $l5 >> Vagrantfile
        
        # Creation de install.sh
        # il se trouvera dans /var/www/html
        mkdir $name 
        touch $name/install.sh

        echo "sudo apt update" >$name/install.sh
        echo "sudo apt install apache2 mysql-server php7.0 libapache2-mod-php7.0 php-mysql -y" >>$name/install.sh
        echo "sudo service apache2 restart" >>$name/install.sh

#        echo "sudo apt install php7.0  nodejs npm mongodb -y" >> data/install.sh
#        echo "sudo apt-get install php libapache2-mod-php a2enmod -y" >> data/install.sh
        
        # Installer aussi composer, voir https://getcomposer.org/download/

        # Lancement du VM  
        vagrant up
        vagrant ssh
        boucle_main="false"
    else
        echo "Erreur, repondez par 'oui' ou par 'non'"
        read reponse
    fi
done

### Autre commandes Vagrant
# # Quitter MySQL : exit;
# Arrêter la Vagrant : vagrant halt
# Se connecter en SSH sur la Vagrant : vagrant ssh

#connection mysql
#> mysql -u root -p

#restart apache 2
#> sudo service apache2 restart

#si erreur 2002
#> mysqld restart
