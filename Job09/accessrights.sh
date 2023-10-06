#!/bin/bash

# Emplacement du fichier CSV (dans le même dossier que le script)
csv_file="Shell_Userlist.csv"

# Parcours du fichier CSV
while IFS=',' read -r id prenom nom mdp role;
do 
# Creation de l'utilisateur
	if [ "$id" != "Id" ];then
		sudo useradd --badname -p `mkpasswd "$mdp"` -d /home/"$prenom $nom" -m -g users -s /bin/bash "$prenom $nom"
	fi
# Elévation des privilèges administrateur
	if [ "$role" == "Admin" ];then
		sudo useradd "$prenom $nom" sudo
	fi
done < "$csv_file"
