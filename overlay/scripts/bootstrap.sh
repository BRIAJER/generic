#!/bin/sh
set -e

sed -i "s/CACHE_MEM_SIZE/${CACHE_MEM_SIZE}/"  /etc/nginx/sites-available/generic.conf
sed -i "s/CACHE_DISK_SIZE/${CACHE_DISK_SIZE}/" /etc/nginx/sites-available/generic.conf
sed -i "s/CACHE_MAX_AGE/${CACHE_MAX_AGE}/"    /etc/nginx/sites-available/generic.conf

echo "Checking permissions..."
chown -R ${WEBUSER}:${WEBUSER} /data/cache /data/info /data/logs
echo "Done. Starting caching server."

/usr/sbin/nginx -t

/usr/sbin/nginx -g "daemon off;"
