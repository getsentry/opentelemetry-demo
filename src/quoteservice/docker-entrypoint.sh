#!/bin/sh
set -euxo

sed -i "s/\b80\b/${QUOTE_SERVICE_PORT}/g" /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf 

apache2-foreground
