#!/bin/bash
USER="appwecorp"
PASSWORD="Wecorp99@"
BACKUPDIR="/backup/dump"
monitor="ERROR"
incio=$(date +'%Y-%m-%d %H:%M:%S')
directorio="mysql"
retencion="15"
proximo=$(date -d "+1 day" +'%Y-%m-%d %H:%M:%S')
databases=`mysql --user=$USER --password=$PASSWORD -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`
for db in $databases; do
echo  "MYSQL|$db|INICIO|FULL|$directorio|$BACKUPDIR|$proximo|$incio|1900-01-01 00:00:00|NOPROCESADO|0|$retencion" >>/var/log/backup.log
sed -i '/schema/d' /var/log/backup.log
sed -i '/sys/d' /var/log/backup.log
    if [[ "$db" != "information_schema" ]] && [[ "$db" != _* ]] ; then
        echo "Dumping database: $db"
        mysqldump --force --single-transaction --lock-tables=false --routines --events --user=$USER --password=$PASSWORD $db |gzip > $BACKUPDIR/$db.`date +%Y%m%d`.sql.gz && monitor="OK"

#        gzip $BACKUPDIR/$db.`date +%Y%m%d`.sql || monitor="ERROR COMPRESION"
cd /backup/dump
find $BACKUPDIR -mindepth 1 -maxdepth 1 -type f -name '*.sql.gz'  -mtime +$retencion -exec rm {} \;|| monitor="ERROR PURGADO"
fin=$(date +'%Y-%m-%d %H:%M:%S')
ocupacion=$(du -k $BACKUP_DIR$db.`date +%Y%m%d`.sql.gz| cut -f -1)
echo  "MYSQL|$db|$monitor|FULL|$directorio|$BACKUPDIR|$proximo|$incio|$fin|NOPROCESADO|$ocupacion|$retencion" >>/var/log/backup.log
sed -i '/schema/d' /var/log/backup.log
sed -i '/sys/d' /var/log/backup.log
fi
done
