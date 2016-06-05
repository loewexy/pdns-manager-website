type: doc

## Configuration

PDNS Manager has two configuration files: *config/config-default.php* and *config/config-user.php*.
Default values are saved in *config-default.php*, you should not edit these values as they will get
overwritten if you update PDNS Manager.

Instead, you can edit these settings in *config-user.php* which overrides the settings made in
*config-default.php*.

### config-default.php


```php
//Database settings
$config['db_host'] = "localhost";
$config['db_user'] = "root";
$config['db_password'] = "";
$config['db_port'] = 3306;
$config['db_name'] = "pdnsmanager";

//Remote update
$config['nonce_lifetime'] = 15;

//Number of rows in domain overview
$config['domain_rows'] = 20;
```

### config-user.php
When you install PDNS Manager, the installation script will save your database connection parameters
in this file.

The *db_* named values specify the database connection. 

The *nonce_lifetime* value specifies how long a request may take to be signed and sent back to the server. If your requests
take really long - maybe you are using a micro controller which takes some time to sign the request or your connection is 
really wonky - try increasing this value.

The *domain_rows* value is the number of domains that is displayed per page when you open the domain overview. Set this to
whatever you want, depending on the speed of your connection and how fast you want your results displayed.
