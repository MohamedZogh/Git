#!/bin/bash

#############################################
# ZOGHLAMI Mohamed                          #
# 10/10/2019                                #
# Evaluation Script Bash                    #
#                                           #
#############################################

# Commande permmettant de rendre le fichier seulement executable : Mastermind.sh $ chmod 711 
logo () {
cat << "EOS"
███╗   ███╗ █████╗ ███████╗████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗██████╗
████╗ ████║██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗
██╔████╔██║███████║███████╗   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║██║  ██║
██║╚██╔╝██║██╔══██║╚════██║   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██║  ██║
██║ ╚═╝ ██║██║  ██║███████║   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██████╔╝
╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝
EOS
}

main_menu () {
    echo "                               WELCOME TO "
    logo
    echo -e "\n \033[34mVOULEZ VOUS JOUER ?\033[0m ( \033[31m y \033[0m / \033[32m n \033[0m )"
    read play
    
    if [ $play != y ]
    then
    echo "Ciao !"
    else
        boule1=$(< /dev/urandom tr -dc 1-6 | head -c1)
        boule2=$(< /dev/urandom tr -dc 1-6 | head -c1)
        while [ $boule2 == $boule1 ]
        do
            boule2=$(< /dev/urandom tr -dc 1-6 | head -c1)
        done
        boule3=$(< /dev/urandom tr -dc 1-6 | head -c1)
        while [[ $boule3 -eq $boule1 ]] || [[ $boule3 -eq $boule2 ]]
        do
            boule3=$(< /dev/urandom tr -dc 1-6 | head -c1)
        done
        boule4=$(< /dev/urandom tr -dc 1-6 | head -c1)
        while [[ $boule4 -eq $boule1 ]] || [[ $boule4 -eq $boule2 ]] || [[ $boule4 -eq $boule3 ]]
        do
            boule4=$(< /dev/urandom tr -dc 1-6 | head -c1)
        done

        boule1Color
        boule2Color
        boule3Color
        boule4Color
        solution="$boule1/$boule2/$boule3/$boule4"
        echo $solution
        i=0
        while [ $i -lt 9 ]
        do
        echo -e "Couleur disponible : R / B / V / J / N / M"
        echo -e "indiquer votre choix tel que : 'R/B/V/J'"
        read reponse

        if [ $reponse == $solution ]
        then
            echo -e "Vous avez gagné !"
            break
        else
            clear
            echo -e "Plus que $((8-$i)) tentative"
            i=$(($i+1))
        fi
        done
        if [ $i -eq 9 ]
        then
            echo "Perdu !"
        fi
    fi
}

boule1Color () {
   case $boule1 in
    1) 
        boule1="R"
    ;;
    2) 
        boule1="B"
    ;;
    3) 
        boule1="V"
    ;;
    4) 
        boule1="J"
    ;;
    5) 
        boule1="N"
    ;;
    6) 
        boule1="M"
    ;;
    esac
}
boule2Color () {
   case $boule2 in
    1) 
        boule2="R"
    ;;
    2) 
        boule2="B"
    ;;
    3) 
        boule2="V"
    ;;
    4) 
        boule2="J"
    ;;
    5) 
        boule2="N"
    ;;
    6) 
        boule2="M"
    ;;
    esac
}
boule3Color () {
   case $boule3 in
    1) 
        boule3="R"
    ;;
    2) 
        boule3="B"
    ;;
    3) 
        boule3="V"
    ;;
    4) 
        boule3="J"
    ;;
    5) 
        boule3="N"
    ;;
    6) 
        boule3="M"
    ;;
    esac
}
boule4Color () {
   case $boule4 in
    1) 
        boule4="R"
    ;;
    2) 
        boule4="B"
    ;;
    3) 
        boule4="V"
    ;;
    4) 
        boule4="J"
    ;;
    5) 
        boule4="N"
    ;;
    6) 
        boule4="M"
    ;;
    esac
}

main_menu






