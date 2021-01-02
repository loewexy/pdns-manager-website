template: full.html

## Download

Download the current release of PDNS Manager. It is recommended to use
the current stable version, but you can also download the current
development release. Older releases can be found below.

[<button class="btn btn-success piwik_download">Stable v2.1.0</button>](https://dl.pdnsmanager.org/pdnsmanager-2.1.0.tar.gz)
[<button class="btn btn-danger piwik_download">Development</button>](https://dl.pdnsmanager.org/pdnsmanager-snapshot.tar.gz)


### Changelog

#### 2.1.0
##### Improvements:
* Added Memcached plugin for session storage
* Added LUA record type
* Added version metadata to packaging
* Clarification of some messages

##### Bugfixes:
* Fixed deletion of password data when updating user
* Fixed wrong client IP detection with Reverse Proxy

[<p class="piwik_download">Download v2.1.0</p>](https://dl.pdnsmanager.org/pdnsmanager-2.1.0.tar.gz)

#### 2.0.1
##### Bugfixes:
* Fixed broken login, after upgrading from PDNSManager before 2.0.0

[<p class="piwik_download">Download v2.0.1</p>](https://dl.pdnsmanager.org/pdnsmanager-2.0.1.tar.gz)

#### 2.0.0

This version is a complete rewrite of PDNS Manager. It is now based on Slimphp and Angular.
For upgrading see [Upgrading from version 1.x](documentation/upgrading-v1.md).

##### Improvements:
* Master, Slave and Native Zones supported
* Documented API between frontend and backend
* Flexible Plugin API for authentication and session storage
* Improved public key API
* New pdns-acme, which handles more automatically

[<p class="piwik_download">Download v2.0.0</p>](https://dl.pdnsmanager.org/pdnsmanager-2.0.0.tar.gz)

#### 1.2.1
##### Improvements:
* Added pagination

##### Bugfixes:
* Compatibility with SQL92
* Fixed regex for mail addresses

[<p class="piwik_download">Download v1.2.1</p>](https://dl.pdnsmanager.org/pdnsmanager-1.2.1.tar.gz)

#### 1.2.0
##### Improvements:
* GetIp API works now behind proxy
* Added support for NATIVE zones

##### Bugfixes:
* Disabled pointer cursor on record table
* Removed SOA from possible record types as it is pointless

[<p class="piwik_download">Download v1.2.0</p>](https://dl.pdnsmanager.org/pdnsmanager-1.2.0.tar.gz)

#### 1.1.7
##### Improvements:
* Added word wraping for long records
* Added shake movements on errors for better visual feedback
* Added default values for ttl and prio

##### Bugfixes:
* Changed cursor type to pointer on all clickable tables
* Added missing input validation when editing record

[<p class="piwik_download">Download v1.1.7</p>](https://dl.pdnsmanager.org/pdnsmanager-1.1.7.tar.gz)

#### 1.1.6
##### Improvements:
* Added getIp action to remote.php

[<p class=" piwik_download">Download v1.1.6</p>](https://dl.pdnsmanager.org/pdnsmanager-1.1.6.tar.gz)

#### 1.1.5
##### Bugfixes:
* Fixed database for compatibility with newer versions of Powerdns

[<p class="piwik_download">Download v1.1.5</p>](https://dl.pdnsmanager.org/pdnsmanager-1.1.5.tar.gz)

#### 1.1.4
##### Improvements:
* Separating the zone part from the rest of the record

[<p class="piwik_download">Download v1.1.4</p>](https://dl.pdnsmanager.org/pdnsmanager-1.1.4.tar.gz)

#### 1.1.3
##### Improvements:
* Added additional constraints for better database consistency

[<p class="piwik_download">Download v1.1.3</p>](https://dl.pdnsmanager.org/pdnsmanager-1.1.3.tar.gz)

#### 1.1.2
##### Bugfixes:
* Fixed incomplete deletion of domains

[<p class="piwik_download">Download v1.1.2</p>](https://dl.pdnsmanager.org/pdnsmanager-1.1.2.tar.gz)

#### 1.1.1
##### Bugfixes:
* Fixed broken installer

[<p class="piwik_download">Download v1.1.1</p>](https://dl.pdnsmanager.org/pdnsmanager-1.1.1.tar.gz)

#### 1.1.0
##### Improvements:
* Added remote API
* Changes release process

##### Bugfixes:
* Fixed missing csrfToken in edit-user.js
* Corrected headings
* Fixed broken installer

[<p class="piwik_download">Download v1.1.0</p>](https://dl.pdnsmanager.org/pdnsmanager-1.1.0.tar.gz)

#### 1.0.0

* Initial released version

[<p class="piwik_download">Download v1.0.0</p>](https://dl.pdnsmanager.org/pdnsmanager-1.0.0.tar.gz)
