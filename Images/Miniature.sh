#!/bin/bash
read -p "Choisissez le Nom du fichier html: " name
while [ -z $name ] || [ -f $name ]
do
            read -p "Le nom n'est pas disponible, veuillez en choisir un autre " name
done
fichier=$name.html

echo '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" >
   <head>
       <title>Ma galerie</title>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <link href="'$name'.css" rel="stylesheet">
   </head>
   <body><p>' > $fichier

if [ ! -e miniatures ] #vérifiez si le dossier miniature existe
then
    mkdir miniatures
fi

# Génération des miniatures et de la page
for image in `ls *.png *.jpg *.jpeg *.gif 2>/dev/null`
do
        convert $image -thumbnail '200x200>' miniatures/$image
        echo '<a href="'$image'"><img src="miniatures/'$image'" alt="" /> </a> '>> $fichier
done

echo '</p>
   </body>
</html>' >> $fichier
echo 'body{
    background-color: rgb(82, 79, 79);
}
a img { border:0;
    transition:         transform .8s ease-in-out; }
a:hover img{
    transform: rotate(360deg);
}' > $name.css