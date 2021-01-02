## Configuration

PDNS Manager has a configuration file in `backend/config/ConfigUser.php`. All
options can be changed here. PDNS Manager uses for defaults for all options, if
no overriding is done in `ConfigUser.php`. The following page describes which
options can be used, each of them adds an entry to the config dictionary.

### DB Options
```php
return [
    ...
    'db' => [
        'host' => 'localhost',
        'user' => 'user',
        'password' => 'password',
        'dbname' => 'pdnsmanager',
        'port' => 3306
    ]
    ...
];
```
This should be self explanatory. It stores the credentials for the database. It
is required to be present. It is the only required config entry.

### Logging
```php
return [
    ...
    'logging' => [
        'level' => 'info',
        'path' => ''
    ]
    ...
];
```
This configures how PDNS Manager logs events.

If `path` is an empty string the
messages end up in the PHP error log. Otherwise the string describes the path
to the logfile, make sure the webserver has permissions on this file and that
it is not served publicly, as it may contain sensitive data.

`level` sets the lowest level for which events are recorded in the log. Possible values are
in ascending order `debug, info, notice, warning, error, critical`.

### Session storage
```php
return [
    ...
    'sessionstorage' => [
        'plugin' => 'apcu',
        'timeout' => 3600,
        'config' => null
    ]
    ...
];
```
This configures how sessions are handeled in PDNS Manager. For details see [Session Storage](configuration_sessionstorage.md).

### Authentication
```php
return [
    ...
    'authentication' => [
        'native' => [
            'plugin' => 'native',
            'prefix' => 'default',
            'config' => null
        ]
    ]
    ...
];
```
This configures how PDNS Manager authenticates users. For details see
[Authentication](configuration_authentication.md).

### Remote API Timestampwindow
```php
return [
    ...
    'remote' => [
        'timestampWindow' => 15
    ]
    ...
];
```
This configures options for the remote API. Currently the only field is
`timestampWindow`, which configures how much the timestamp in the
signature of the post API may differ from the system time, while still
being valid.

### Trusted Proxys
```php
return [
    ...
    'proxys' => ['10.0.0.1']
    ...
];
```
This array should contain the ip addresses of proxys before the server
which serves PDNS Manager. They are allowed to set `X-Forwarded-For` headers.
