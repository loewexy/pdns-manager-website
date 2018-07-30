type: doc

## API

PDNS Manager features a powerful API which enables you to update 
records pragmatically whilst providing some helper functions at the same time.

This can be used for example to achieve a Dynamic DNS service.

### GET API

#### Update via GET request

The most simple API is to update a record via a simple GET request. 
Therefore you must create the record you wish to update.

The next step is to enable remote access for that record. Therefore, 
click on the key symbol, which is the last icon in the record row.

Then click on *Password*. Enter a description for that API access and 
supply a password. Repeat the password and confirm it with *Add*.

![Screenshot](img/api.md/screenshot_1.png)

Now everything is configured to update the record remotely. To do so, 
make a request to:

```markdown
https://dns.example.com/remote/updatepw?record=<recordId>&password=<pass>&content=<content>
```

| parameter | explanation |
| --- | --- |
| record | The id of the record to update |
| content | The new content |
| password | The password used for authentication |

| code | result |
| --- | --- |
| 204 | Everything okay, therefore content is empty |
| 403 | No permission for the given record |
| 404 | Record does not exist |
| 422 | One of the required arguments is missing |

#### Get IP via API

You can read your client IP address using a get
request as the following:

```markdown
https://dns.example.com/remote/ip
```

You get a JSON like the following:

```json
{
    "ip": "12.34.56.78"
}
```

#### Get servertime via API

You can read the server time using a get
request as the following:

```markdown
https://dns.example.com/remote/servertime
```

You get a JSON like the following:

```json
{
    "time": 1525006738
}
```

### Post API with signature

PDNS Manager also has an API which uses asymmetric cryptography as 
authentication method. This API is used via HTTP POST requests.

A client for that API implemented in a simple bash script is available. 
The client is described first, afterwards the protocol is described.

#### Using the client software

To get the client, it is obligated to have git installed first. If this is not the case 
you can do that for Debian using:

```bash
sudo apt-get install git
```

The client depends on jq and curl which can be installed as follows:
```bash
sudo apt-get install jq curl
```

Now you can clone the repository into a directory of your choice, and 
change to the cloned repository.

```bash
git clone https://github.com/loewexy/pdns-client
cd pdns-client
```

In the next step you have to generate a RSA keypair using:

```bash
./pdns-keygen
```

This creates two files: *pdns.private.pem* and *pdns.public.pem*

Get the public key using cat:

```bash
cat pdns.public.pem
```

Copy the output to the clipboard. Now go to PDNS Manager and add the 
record you want to update. Click on the key symbol, the last icon in
the record row.

On the following page, press *Key*. Enter some description and paste 
the public key from the clipboard into the text field.

Confirm your inputs with *Save*.

Now back on your machine which should do the update, you can call the 
client with data of your choice like that:

```bash
./pdns-client -s https://dns.example.com/ -i <recordId> -c <content>
```

With:

* &lt;recordId&gt;: beeing the id of the record to update
* &lt;content&gt;: beeing the new content of your record

This should update the data as you requested.

You can get more options of pdns-keygen and pdns-client through the -h 
option, which will give you some hints about what you can do.

#### API description

The POST API is very simple. You need a RSA keypair and you must be 
able to sign data with it.

To obtain the signature you must have a Unix-Timestamp with
sufficient precision. You can obtain it from the server with
the `GET /remote/servertime` API. Concatenate the record id
(as string), the content and the timestamp (also as string).
Sign this data with SHA512 using your private key and base64
encode the signature.

```json
{
  "record": 5,
  "content": "1.2.3.4",
  "time": 1525009108,
  "signature": "YIRJppYL55dOuC[...]u0sXYgClo="
}
```

| parameter | explanation |
| --- | --- |
| record | The id of the record to update |
| content | The new content |
| time | The unix timestamp used in the signature |
| signature | The signature |

| code | result |
| --- | --- |
| 204 | Everything okay, therefore content is empty |
| 403 | No permission for the given record |
| 404 | Record does not exist |
| 422 | One of the required arguments is missing |
