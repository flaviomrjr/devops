BACKUP_DIR="/backup/{{ dbname }}"
monitor="ERROR"
incio=$(date +'%Y-%m-%d %H:%M:%S')
directorio="/servicios/{{ dbname }}"
retencion="4"
proximo=$(date -d "+1 day" +'%Y-%m-%d %H:%M:%S')


echo "LIFERAY|EMBRACON|INICIO|FULL|$directorio|$BACKUP_DIR|$proximo|$incio|1900-01-01 00:00:00|NOPROCESADO|0|$retencion" >>/var/log/backup.log


tar -cvzf  $BACKUP_DIR/bkdiario{{ dbname }}`date +%Y%m%d`.tar.gz /servicios/{{ dbname }} --exclude '/servicios/{{ dbname }}/logs' --exclude '/servicios/{{ dbname }}/tomcat-7.0.35/logs' --exclude '/servicios/{{ dbname }}/tomcat-7.0.35/temp/*' --exclude '/servicios/{{ dbname }}/tomcat-7.0.35/work/Catalina' |grep -v "File removed before we read it"  && monitor="OK"

cd $BACKUP_DIR
find $BACKUP_DIR -mindepth 1 -maxdepth 1 -type f -name '*.tar.gz' -mtime +$retencion -exec rm {} \;||monitor="ERROR PURGADO"
fin=$(date +'%Y-%m-%d %H:%M:%S')
ocupacion=$(du -k $BACKUP_DIR/bkdiario{{ dbname }}`date +%Y%m%d`.tar.gz| cut -f -1)
echo "LIFERAY|EMBRACON|$monitor|FULL|$directorio|$BACKUP_DIR|$proximo|$incio|$fin|NOPROCESADO|$ocupacion|$retencion" >>/var/log/backup.log

old_output_file="$BACKUP_DIR/bkdiario{{ dbname }}$(date --date='4 days ago' +'%Y%m%d').tar.gz"

if [ -f $old_output_file ]
	then
        	rm -f $old_output_file
	fi
