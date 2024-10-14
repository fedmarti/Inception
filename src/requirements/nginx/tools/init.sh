#!/bin/bash

echo "init script running" > /var/log/init;

if [[ ! -f ${CERT} ]]; then
echo "Nginx: setting up ssl ..." >> /var/log/get_cert;
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout ${CERT_KEY} -out ${CERT} -subj ${CERT_REQUEST}
echo "Nginx: ssl is set up!" >> /var/log/get_cert;
fi

cd /etc/nginx/sites-available/;
/bin/subst.sh default default.tmp && mv default.tmp default;

echo "substituted variable names in nginx conf file" >> /var/log/init;


echo "key is: " >> /var/log/init;
cat ${CERT} >> /var/log/init;

