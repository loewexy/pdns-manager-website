## nginx

Nginx can also be used to proxy requsts to PDNS Manager, here is a template configuration:

```nginx
server {
    listen 80;
    server_name ns1.o.o;

    root <installation directory>/public;

    location / {
        root <installation directory>/frontend;
        try_files $uri $uri/ /index.html;
    }

    location /api {
        try_files $uri $uri/ /index.php;
    }

    location ~* \.php$ {
        if ($request_uri ~* "/api(.*)") {
            set $req $1;
        }
        fastcgi_split_path_info ^(/api)(/.*)$;
        fastcgi_pass     unix:/var/run/php/php7.3-fpm.sock;
        include          fastcgi_params;
        fastcgi_param    SCRIPT_FILENAME $request_filename;
        fastcgi_param    REQUEST_URI $req;
        fastcgi_read_timeout 900;
    }
}
```

Make sure you update the PHP version to what you are running in the fastcgi_pass section above. Also note that [this wont work](https://github.com/loewexy/pdnsmanager/issues/81) in PHP older than 7.1.
