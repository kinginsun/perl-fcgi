FROM nginx

COPY default.conf /etc/nginx/conf.d/default.conf
COPY fastcgi-wrapper.pl /usr/bin/fastcgi-wrapper.pl
COPY init.sh /init.sh

RUN apt-get update && \
    apt-get install -y libfcgi-perl libcgi-pm-perl libwww-perl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /init.sh && \
    chmod +x /usr/bin/fastcgi-wrapper.pl && \
    mkdir -p /var/www/my_site && \
    mkdir  /var/www/log && \
    mkdir /var/run/perl-fcgi && \
    chown -R www-data:www-data /var/run/perl-fcgi && \
    chown -R www-data:www-data /var/www/my_site && \
    touch /var/www/log/my_site.access.log && \
    chsh www-data -s /bin/bash 

EXPOSE 80

CMD /init.sh
