## Configuration - Sessionstorage

PDNS Manager features a plugin system to support different session storage
mechanisms.

The configuration in general looks like the following:
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

`plugin` chooses the plugin used as session storage backend.

`timeout` configures how long a session without any further action will stay
active. The value is an integer in seconds.

`config` may store additional information used by the session storage plugin.

### APCu

The PHP APCu cache can be used as back-end with the following config:
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
For that the PHP APCu extension must be installed.

### Memcached

Memcached can also be used as session back-end with the following config:
```php
return [
    ...
    'sessionstorage' => [
        'plugin' => 'memcached',
        'timeout' => 3600,
        'config' => [
            'host' => '127.0.0.1',
            'port' => '11211'
        ]
    ],
    ...
];
```
Where `host` and `port` is the location of the Memcached server.
