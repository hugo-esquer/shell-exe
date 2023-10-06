last utilisateur | grep utilisateur | wc -l > number_connection-`date +%d-%m-%Y-%H:%M`
tar --force-local -cvf number_connection-`date +%d-%m-%Y-%H:%M`.tar number_connection-`date +%d-%m-%Y-%H:%M`
mv number_connection-`date +%d-%m-%Y-%H:%M`.tar ~/Documents/shell-exe/Job08/Backup/
