# ClouditaliaCall2HTTPConverter
Docker image based on Freeswitch on top of Debian Wheezy to convert inbound calls into HTTP Request

Introduction
------------
ClouditaliaCall2HTTPConverter lets you send regular http request anywhere when an incoming call occurs.
ClouditaliaCall2HTTPConverter works only with Clouditalia sip accounts, you can get some for free at <a href="http://www.clouditaliaorchestra.com">http://www.clouditaliaorchestra.com</a>.
This repository bulds a new docker image based on Freeswitch over a regular Debian 7 image.
Freeswitch was built following the instructions reported in this book : <a href=http://www.youcanprint.it/youcanprint-libreria/saggistica/costruire-centralini-telefonici-con-freeswitch.html>http://www.youcanprint.it/youcanprint-libreria/saggistica/costruire-centralini-telefonici-con-freeswitch.html</a>.

Instructions
------------
To run a new container first make sure you have docker and docker-compose installed on your server.
This is a docker-compose configuration file example
```yaml
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
   - HTTP_URL=http://192.168.1.2
```

On this 2 examples an HTTP request to 192.168.1.1 is triggered everytime a whitelisted caller calls sipaccount1 and to 192.168.1.2 whenever sipaccount2 is called.
Clouditalia offers free sip accounts related to geographical phone numbers (mostly italian) at <a href="www.clouditaliaorchestra.com">www.clouditaliaorchestra.com</a>.
After a call has been received a busy signal is sent back to the caller so you won't be charged from your telco company.
I use this process for home automation purposes, the most common possible situation is a raspberry pi connected to some appliance that triggers his GPIOs for every incoming HTTP request.
ClouditaliaCall2HTTPConverter extens this feature so you can control your home appliances directly from your cellphone with a simple voicecall.

SIP Ports
------------
Running cointainers should't need to expose any port, docker should take care of masquerading outgoing traffic automatically.
If you're on a modern Linux distribution you can check the ongoing masquerading packets with the 'conntrack' command line utility. 
Just make sure to don't overlap the SIP_PORT env variable on your yml file and that the ports you entered are usable.




