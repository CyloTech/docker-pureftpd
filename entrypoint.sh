#!/usr/bin/env bash

set -x

pure-pw list | grep ${FTP_USER} || (echo ${FTP_PASSWORD}; echo ${FTP_PASSWORD}) | pure-pw useradd ${FTP_USER} -f /etc/pure-ftpd/passwd/pureftpd.passwd -m -u ftpuser -d /home/ftpusers/default

while [ ! -f /ssl/key.pem ]
do
  sleep 2
done

while [ ! -f /ssl/cert.pem ]
do
  sleep 2
done

cat /ssl/key.pem > /etc/ssl/private/pure-ftpd.pem
echo '' >> /etc/ssl/private/pure-ftpd.pem
cat /ssl/cert.pem >> /etc/ssl/private/pure-ftpd.pem
echo '' >> /etc/ssl/private/pure-ftpd.pem
chmod 600 /etc/ssl/private/pure-ftpd.pem

exec "$@"
