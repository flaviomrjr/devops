WECORP - Automação com Ansible e Puppet
======
 
DEVOPS
---------
 
* Playbooks
  - wecorp.yml
  - pymysql.yml
  - apache-proxy.yml 
  - puppet-agent.yml

ROLE   |TASKS
-------|---------
wecorp | 7
pymysql| 1
apache | 1
puppet | 1

### MANUAL DE INSTALAÇÃO DO WECORP

**Step 1**

Para que a instalação seja realizada com sucesso, você deve garantir que o novo servidor possua os seguintes requisitos:

ITEM | DESCRICAO
-----| ---------
  1  | O servidor precisa ter conexão de internet, possuir  os repositorios atualizados e sem erros de conexão aos repositorios
  2  | O servidor precisa ter a chave SSH publica do servidor DevOps
  3  | O servidor deve possuir as partições "Servicios e Backup"

_CONFIRA COMO VALIDAR ESSES REQUISITOS_

1 - Verificando conexão com internet e atualizando os repositórios
```shel
ping www.telefonicaeducaciondigital.com
apt-get update
```
Após a execução destes comandos, valide a conexão de internet, verifique se o repositório foi atualizado e se não ocorreu nenhum problema de conexão as URLs dos repositórios

2 - Instalando a chave publica SSH do servidor DevOps no novo servidor de aplicação

Se conecte ao servidor DevOps no IP 192.168.0.87 e execute os seguinte comandos:
```shel
ssh-copy-id root@server-app-ip
ssh root@server-app-ip
exit
```
Com esses comandos você irá copiar a chave SSH publica do servidor DevOps para o novo servidor de aplicação e garantir a conexão

3 - Validando as partições Servicios e Backup
```shel
df -h
```
Com esse comando você irá validar se as partições Servicios e Backup estão criadas, caso não, você precisa criar uma LVM para cada ou criar uma pasta com os nomes servicios e backup no /

**Step 2**

Para fazer o deploy da aplicação e do banco de dados, os mesmos devem estar no diretório da role "wecorp" no servidor DevOps

Realize a copia do arquivo da aplicação compactado com o formato "wecorp_cliente.tar.bz2" ou "wecorp_cliente.tar.gz" e o arquivo de banco de dados no formato "wecorp_client.sql" para o diretório /etc/ansible/roles/wecorp/files/ no servidor DevOps

**Step 3**

Acesse o Rundeck na URL: http://rundeck.telefonicaed.com.br:4440
Acesse o projeto INFRAESTRUTURA e o JOB "DEPLOY_WECORP"
Para finalizar, siga as intruções do JOB do Rundeck 
 
**Extra**

No servidor SRVVM01, você irá encontrar um templete do Ubuntu 16 e 18 com as partições criadas e com a chave configurada no disco H:

Obs: Para utilizar esse template você deve importalo no Hyper-V com um novo ID, alterar o nome do servidor no arquivo hostname e alterar o IP de rede



