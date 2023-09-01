mysqldump --user=admin --password=Afpa1234 GesCom > backup_gescom.sql


cat backup_gescom.sql | mysql --user=admin --password=Afpa1234 new_gescom


