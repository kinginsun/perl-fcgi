#!/bin/sh

su - www-data -c /usr/bin/fastcgi-wrapper.pl;
nginx -g 'daemon off;';
