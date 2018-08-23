## Configuration - Authentication

PDNS Manager features a plugin system to support different authentication
sources. It also allows multiple sources to be active at the same time.
The distinction between the sources is done by prefixing the username.
So for example the username `foo` will use the default source, while
`ldap/foo` will use the source with prefix `ldap`. Only the username
part will be passed to the plugin.

An example of the authentication configuration could be.
```php
return [
    ...
    'authentication' => [
        'native' => [
            'plugin' => 'native',
            'prefix' => 'default',
            'config' => null
        ],
        'foo' => [
            'plugin' => 'config',
            'prefix' => 'bar',
            'config' => [
                'peter' => '$2y$10$twlIJ0hYeaHqMsiM7OdLr.4HkV6/EEQneDg9uZiU.l7yn1bpxSD1.'
            ]
        ]
    ]
    ...
];

```

The key in the array (called source identifier) must identify an
authentication source uniquely. It must not change for a given
authentication source, otherwise all permissions for those users
will be lost. `native` is the reserved identifier for PDNS Managers
internal authentication added by the setup assistant.

The value has 3 properties
 
`plugin` the name of the authentication plugin to use (see rest of the
page for available options)

`prefix` the prefix used to choose the source, if no prefix is provided
`default` will be used. This can be used to allow users to login without
providing a prefix if they use some sort of default authentication source.
This setting can be changed at any time.

`config` this can contain plugin specific configuration data. For
information what this should be for a specific plugin see below.

### native Plugin
This plugin uses users directly in PDNS Managers database. They can
be added and changed by administrators on the instance.

The source identifier for usage with this plugin **must** be `native`.
The prefix can be chosen arbitrary.

No additional configuration data is required.

**Example**
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

### config Plugin
This plugin uses users directly given in the config file. It is mainly
for testing puposes.

The `config` field should be an associative array mapping usernames
to PHP password hashes optained by PHPs `password_hash()` function.

**Example**
```php
return [
    ...
    'authentication' => [
        'foo' => [
            'plugin' => 'config',
            'prefix' => 'default',
            'config' => [
                'peter' => '$2y$10$twlIJ0hYeaHqMsiM7OdLr.4HkV6/EEQneDg9uZiU.l7yn1bpxSD1.'
            ]
        ]
    ]
    ...
];

```