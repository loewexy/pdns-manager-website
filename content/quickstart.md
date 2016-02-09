type: doc

## Getting started

This page guides you through the installation of PDNS Manager and
Powerdns as an authoritative nameserver on a Debian system.

### Prerequisites

In order to complete this tutorial you must fillfill 2 Prerequisites. 
Both are very basic and if you want to setup a authoritative DNS server 
you propably have no problems to fullfill them. If not ask the 
internet, there are a lot of tutorials out there.

Firstly have to know how to configure Apache that it delivers a page
from a specific document root for a given hostname. The configuration of
HTTPS for that hostname is not required although highly recommended in
order to protect your sensitive data.

Secondly you need a MySQL or Maria DB server and a new empty database 
on it, prererably with separate user credentials only for the DNS 
stuff.

