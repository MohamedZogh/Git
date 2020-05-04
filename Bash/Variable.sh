# !/bin/bash
Calculatrice ()
{
echo "Calculette 2.0"
read -p "Choisissez Nombre 1, un opérateur(* / - +), etle second nombre : (Ex : '8 / 2') " nbr1 operateur nbr2
bc -l <<< "$nbr1 $operateur $nbr2" #afficher nbra virgule
}
# Calculatrice
Question ()
{
read -p "Salut quel est ton prenom ?" prenom
read -p "Quel est ton nom ?" nom
read -p "Salut quel est ton âge ?" age
read -p "Salut quel est ta ville ?" ville
read -p "Salut quel est ta taille ?" taille

echo "Tu t'appelles $prenom $nom, tu as $age et mesure $taille. tu viens de $ville"
}
# while [ -z $reponse ] || [ $reponse != 'oui' ]
# do
#         read -p 'Dites oui : ' reponse
# done

# liste_fichiers=`ls`

# for fichier in $liste_fichiers
# do
#         echo "Fichier trouvé : $fichier"
# done

Cow()
{
    read -p "Bonjour, saisissez les deux caractere qui remplacerons les yeux.." G D
    cowsay -e $G$D Chab
}

Tux()
{
    cowsay -f tux "This is a tux' world"
}

Aleatoire()
{
    MAXIMUM=10
    VAL=$((RANDOM*$MAXIMUM))
    echo $VAL
}

Cron()
{
 echo "test"
}
Cron
