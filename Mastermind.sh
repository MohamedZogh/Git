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

s1="X"
bonnecouleur1="X"
s2="X"
bonnecouleur2="X"
s3="X"
bonnecouleur3="X"
s4="X"
bonnecouleur4="X"

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
        echo -e "Couleur disponible : \033[31m R \033[0m / \033[34m B \033[0m / \033[32m V \033[0m / \033[1;33m J \033[0m / \033[36m C \033[0m / \033[35m P \033[0m"
        echo -e "indiquer votre choix tel que : 'R/B/V/J'"
        read reponse
        if [ $reponse == $solution ]
        then
            echo -e "Vous avez gagné !"
            break
        else
            r1=$(echo $reponse | cut -d\/ -f1)
            r2=$(echo $reponse | cut -d\/ -f2)
            r3=$(echo $reponse | cut -d\/ -f3)
            r4=$(echo $reponse | cut -d\/ -f4)

            if [ "$r1" = "$boule1" ]
            then
                s1=$r1
            elif [[ $r1 = $boule2 ]] || [[ $r1 = $boule3 ]] || [[ $r1 = $boule4 ]]
            then
                bonnecouleur1=$r1
            fi
            if [ "$r2" = "$boule2" ]
            then
                s2=$r2
            elif [[ $r2 = $boule1 ]] || [[ $r2 = $boule3 ]] || [[ $r2 = $boule4 ]]
            then
                bonnecouleur2=$r2
            fi
            if [ "$r3" = "$boule3" ]
            then
                s3=$r3
            elif [[ "$r3" = "$boule1" ]] || [[ "$r3" = "$boule2" ]] || [[ "$r3" = "$boule4" ]]
            then
                bonnecouleur3=$r3
            fi
            if [ "$r4" = "$boule4" ]
            then
                s4=$r4
            elif [[ $r4 = $boule1 ]] || [[ $r4 = $boule3 ]] || [[ $r4 = $boule4 ]]
            then
                bonnecouleur4=$r4
            fi
            echo "Boule bien placé : $s1/$s2/$s3/$s4"
            echo "Bonne couleur mais boule mal placée : $bonnecouleur1/$bonnecouleur2/$bonnecouleur3/$bonnecouleur4"
            echo -e "Plus que $((8-$i)) tentative \n"
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
        boule1="C"
    ;;
    6) 
        boule1="P"
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
        boule2="C"
    ;;
    6) 
        boule2="P"
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
        boule3="C"
    ;;
    6) 
        boule3="P"
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
        boule4="C"
    ;;
    6) 
        boule4="P"
    ;;
    esac
}

main_menu






