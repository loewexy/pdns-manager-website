type: doc

## Let's Encrypt

PDNS Manager allows you to easily use the service of the complete automated 
CA [Let's Encrypt](https://letsencrypt.org) or any other ACME 
compiliant CA by using the [letsencrypt.sh](https://github.com/lukas2511/letsencrypt.sh)
client in combination with the PDNS Manager API.

This Tutorial will guide you step by step to the setup. In repeats 
partly the information in the API tutorial, it also assumes that you 
have a running version of PDNS Manager up and running.

### Getting required components

The software we are using depends on the following tools beeing 
installed.

* jq
* curl
* openssl
* git

On Debian you can get those using:

```bash
sudo apt-get install openssl jq curl git
```

Afterwords change into the Directory you want the tools located and 
clone the following repositories.

```bash
git clone https://github.com/loewexy/pdns-client
git clone https://github.com/loewexy/pdns-acme
git clone https://github.com/lukas2511/letsencrypt.sh
```

### Configure pdns-client
Then change in the directory of pdns-client, generate a keypair and 
output the public key:

```bash
cd pdns-client
./pdns-keygen
cat pdns.public.pem
```

Copy the resulting public key to your clipboard.

In the next step open a browser and login to your PDNS Manager 
instance. Add a record to your domain with the name 
**_acme-challenge.&lt;yourdomain&gt;**, type **TXT** and content **none**. 
Use a Priority of 0 and a TTL of 60.

Afterwords click on to share icon which is the last icon in the row of 
the record. Click on *Add Key*. Enter a description like **ACME** and 
paste the public key from your clipboard into the field. Confirm with 
*Add*. Remember the ID of the permission you have added. You can find 
it in the left table.

### Configure pdns-acme

Change in the directory of pdns-acme and copy the example config.

```
cd ../pdns-acme
cp pdns-acme.json.example pdns-acme.json
```

Open the file **pdns-acme.json** in an editor of your choise. In the 
**config** section adjust the path of your PDNS Manager installation 
and also the deploy-wait value. The deploy-wait parameter determines 
how long the script should wait for the DNS servers to get the right 
results. This value depends on your nameserver setup. The default of 
300 should do well for your most setups. Afterwords the section looks 
like that:

```json
"config": {
        "server": "https://<yourdomain>/",
        "pdns-client": "../pdns-client/pdns-client",
        "deploy-wait": 300
    }
```

Now look at the examples of the domains. They show you how you can add 
hook commands when a new certificate has been deployed, such as 
restarting Apache or anything else. You can add none, one or multiple 
commands in an array. Set the **id** property to the value you remember 
from before. Adjust the domain name to your situation. You can remove 
the remaining domain entrys.

### Configure letsencrypt.sh

Change to the directory of letsencrypt.sh and copy the example config.

```bash
cd ../letsencrypt.sh
cp config.sh.example config.sh
```

Open config.sh in your favourite editor. Uncomment and adjust the 
settings below.

```bash
# Make letsencrypt.sh use the dns-01 challenge
CHALLENGETYPE="dns-01"

# Supply the path to the pdns-acme hook script
HOOK=${BASEDIR}/../pdns-acme/pdns-acme
```

Afterwords run letsencrypt.sh to check weather everything works as 
expected.

```bash
./letsencrypt.sh -c
```

If everything is okay you can find your new certificate in the 
directory certs.

### Automate renewal

The automaically renew the certs add an entry to **/etc/crontab** as 
the following:

```txt
0 2     * * *   root    /root/letsencrypt.sh/letsencrypt.sh -c
```

