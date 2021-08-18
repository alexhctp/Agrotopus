#!/bin/bash
TOMCAT_PATH=`ps aux | grep org.apache.catalina | awk -F'-Dcatalina.home=' '{print $2}' | awk '{print $1}'` 
POSTGRES_VER=`systemctl | grep postgresql | awk '{print $1}'`
DATA=$(date +%Y%m%d_%H%M)

# Para o Tomcat
systemctl stop tomcat

# Para o Postgres
systemctl stop $POSTGRES_VER

# Compacta os logs atuais para consulta posterior
tar -czf tomcat_logs.tar.gz $TOMCAT_PATH/logs/
mv tomcat_logstar.gz /web/tomcat_logs/tomcat_logs_$DATA.tar.gz

# Limpa os logs e temporarios do Tomcat
cd $TOMCAT_PATH/logs
rm -rf $TOMCAT_PATH/logs/*log
rm -rf $TOMCAT_PATH/logs/*txt
rm -rf $TOMCAT_PATH/logs/catalina.out


# Limpa os logs e temporarios do Postgres
cd $TOMCAT_PATH/temp
rm -rf $TOMCAT_PATH/temp/*tmp

# Inicializa os serviços do Tomcat e Postgres
systemctl start $POSTGRES_VER
systemctl start tomcat


