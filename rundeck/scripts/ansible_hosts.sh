#!/bin/bash
### SCRITP RESPONSAVEL PELA VERIFICAÇÃO E ALTERAÇÃO DO ARQUIVOS HOST DO ANSIBLE
### AUTOR: FLAVIO ROCHA
### EMAIL: flavio.rocha16@gmail.com
### DATA: 20/09/2019
cat /etc/ansible/hosts | grep @option.hostgroup@ #CHECK IF THE HOSTGROUP EXISTS
if [ $? -eq 0 ]; then
	echo "HosGroup ja existe" 
else
	echo [@option.hostgroup@] >> /etc/ansible/hosts #ADD THE HOSTGROUP
fi
cat /etc/ansible/hosts | grep @option.hostip@ #CHECK IF THE HOST EXISTS
if [ $? -eq 0 ]; then
	echo "HostIP ja existe" 
else
	sed -i "s/"@option.hostgroup@]"/"@option.hostgroup@]"\n@option.hostip@/" /etc/ansible/hosts #ADD THE HOST IP BOLLOW THE HOSTGROUP THAT IT BELONGS TO
fi
