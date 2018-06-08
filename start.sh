
#!/bin/bash
echo "Criando volume REPORTS"
docker volume create REPORTS

echo "copiando o relatório modelo para a pasta do volume criado"
cp reports/Customers.rptdesign /var/lib/docker/volumes/REPORTS/_data

echo "Criando container"
docker run --name BIRT001 -i -t -p 9090:8080 -v reports:/usr/local/tomcat/webapps/birt/reports cdorde/mybirt:4.5.0
