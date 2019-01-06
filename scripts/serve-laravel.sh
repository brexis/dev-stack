#!/usr/bin/env bash

block="server {
    listen 80;
    listen 443 ssl http2;
    server_name .$1;
    root \"$2\";
    index index.html index.htm index.php;
    charset utf-8;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    access_log /var/log/nginx/$1-access.log;
    error_log  /var/log/nginx/$1-error.log error;
    sendfile off;
    client_max_body_size 100m;
    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/home/brexis/.phpbrew/php/php-${3:-7.1.25}/var/run/php-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        fastcgi_intercept_errors off;
        fastcgi_buffer_size 16k;
        fastcgi_buffers 4 16k;
        fastcgi_connect_timeout 300;
        fastcgi_send_timeout 300;
        fastcgi_read_timeout 300;
    }
    location ~ /\.ht {
        deny all;
    }
    ssl_certificate     /etc/nginx/ssl/$1.crt;
    ssl_certificate_key /etc/nginx/ssl/$1.key;
}
"

echo "$block" | sudo tee "/etc/nginx/sites-available/$1"
sudo ln -fs "/etc/nginx/sites-available/$1" "/etc/nginx/sites-enabled/$1"
grep -q -x -F "127.0.0.1 $1" /etc/hosts || echo "127.0.0.1 $1" | sudo tee -a /etc/hosts
sudo service nginx restart
phpbrew fpm stop
phpbrew fpm start