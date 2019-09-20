#!/bin/bash
#Senha do BD Mysql usado no JOB Rundeck
    
    secret=@option.mysql-admin-password@
    table_name=wecorp_embracon

#Parameters para Dump
    
    DATE=`date +%Y%m%d%H%M`
    dir_folder=`date +%Y-%m-%d`
    dump_path=/backup/deploy-embracon/backup_bbdd/$dir_folder
    mkdir -p /backup/deploy-embracon/backup_bbdd/$dir_folder

echo "..."
echo "Inicio de backup BD"

mysqldump -u root -p$secret -R --opt $table_name > $dump_path/$table_name.$DATE.sql


echo "..."
echo "...Backup realizado em:"
echo $dump_path
echo "...Backup com nome:"
echo "$table_name.$DATE.sql"
echo "..."
echo "FIM BACKUP DE BD"
echo "..."
echo "..."

