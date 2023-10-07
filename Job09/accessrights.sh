#!/bin/bash

# Emplacement du fichier CSV (dans le même dossier que le script)
csv_file="Shell_Userlist.csv"

# Parcours du fichier CSV
while IFS=',' read -r id prenom nom mdp role; do 

	# Saut de la première ligne
	if [ "$id" != "Id" ]; then

		# Vérification de l existance de l utilisateur
		if id "$prenom" &>/dev/null; then

			#modification de l'utilisateur
			sudo usermod -m -d "/home/$prenom" -c "$prenom $nom" -p `mkpasswd "$mdp"` "$prenom"

			# Elévation ou suppression des privilèges administrateur
			if [ "$role" = "Admin" ]; then
				sudo usermod -aG sudo "$prenom"
			else
				sudo deluser "$prenom" sudo &>/dev/null
			fi

		else

			# Création de l'utilisateur
			sudo useradd --badname -m "$prenom" -d "/home/$prenom" -G users -c "$prenom $nom" -p `mkpasswd "$mdp"`

			# Elévation des privilèges administrateur
			if [ "$role" == "Admin" ]; then
				sudo useradd -aG "$prenom" sudo
			fi
		fi
	fi
done < "$csv_file"
