# ClouditaliaCall2HTTPConverter
Docker image based on Freeswitch on top of Debian Wheezy to convert inbound calls into HTTP Request

Introduction
------------
ClouditaliaCall2HTTPConverter lets you send regular http request anywhere when an incoming call occurs.
ClouditaliaCall2HTTPConverter works only with Clouditalia sip accounts, you can get some for free at <a href="http://www.clouditaliaorchestra.com">http://www.clouditaliaorchestra.com</a>.
This repository bulds a new docker image based on Freeswitch over a regular Debian 7 image.
Freeswitch was built following the instructions reported to this book : <a href=http://www.youcanprint.it/youcanprint-libreria/saggistica/costruire-centralini-telefonici-con-freeswitch.html>http://www.youcanprint.it/youcanprint-libreria/saggistica/costruire-centralini-telefonici-con-freeswitch.html</a>.

Instructions
------------
To run a new container first make sure you have git client, docker and docker-compose installed you your server(docker compose is optional).
This is a docker-compose configuration file example
```bash
num1:
  image: ozzyboshi/clouditaliacall2httpconverter
  dns:
   - 8.8.8.8
  environment:
   - SIP_LOGIN=#sipaccount1#
   - SIP_PASSWORD=#sippassword1#
   - SIP_PORT=#sipport1#
   - WHITELISTED_NUMBERS=#caller1#|#caller2#|...
   - HTTP_URL=http://192.168.1.1

num2:
  image: ozzyboshi/clouditaliacall2httpconverter
  dns:
   - 8.8.8.8
  environment:
   - SIP_LOGIN=#sipaccount2#
   - SIP_PASSWORD=#sippassword2#
   - SIP_PORT=#sipport2#
   - WHITELISTED_NUMBERS=#caller1#|#caller2#|...
   - HTTP_URL=http://192.168.1.1
```

Once the containers are created try to call your sipaccounts from any of the whitelisted numbers, for every call you'll generate a new http request




