type: doc

## Upgrading from v1.x

As PDNS Manager 2.0 is a complete rewrite there are some steps required
to upgrade an existing installation to 2.0.

### Prerequisites

 * Update your existing installation to v1.2.1 (while this is not strictly
 required, it tends to cause less problems on upgrade)

 * Make shure to use PHP in version 7.1 or above.

 * Make shure that PHP APCu extension is installed

### Replace PDNS Manager

Replace your current installation with the content of the PDNS Manager
2.0 archive.
 
### Configure Apache

Adjust your Apache VHost configuration to look like
the following.
 
```
<VirtualHost _default_:443>
    ServerAdmin webmaster@localhost

    ServerName pdns.example.com

    DocumentRoot /var/www/html/frontend

    RewriteEngine On
    RewriteRule ^index\.html$ - [L]
    RewriteCond %{DOCUMENT_ROOT}%{REQUEST_FILENAME} !-f
    RewriteCond %{DOCUMENT_ROOT}%{REQUEST_FILENAME} !-d
    RewriteRule !^/api/\.* /index.html [L]

    Alias /api /var/www/html/backend/public
    <Directory /var/www/html/backend/public>
        RewriteEngine On
        RewriteCond %{REQUEST_FILENAME} !-f
        RewriteCond %{REQUEST_FILENAME} !-d
        RewriteRule ^ index.php [QSA,L]
    </Directory>

</VirtualHost>
```

### Configure PDNS Manager

Create the file `backend/config/ConfigUser.php` like the following
with the correct credentials for your database.

```php
<?php

return [
    'db' => [
        'host' => 'your.db.host',
        'user' => 'yourdbuser',
        'password' => 'yourpassword',
        'dbname' => 'yourdbname'
    ]
];
```

### Upgrade the DB schema

Open your PDNS Manager instance. You should be redirected to the
upgrade assistant. Start the upgrade procedure and wait for it to
finish.

### Update your clients

As version 2.0 has some breaking API changes, you have to upgrade
all instances of `pdns-client` and `pdns-acme` to their current versions.

They also work a little different to avoid most of the confusion raised
in the past years. For details how they work now, refer to the documentation.