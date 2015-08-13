# ClouditaliaCall2HTTPConverter
Docker image based on Freeswitch on top of Debian Wheezy to convert inbound calls into HTTP Request

Introduction
------------
ClouditaliaCall2HTTPConverter lets you send an HTTP request anywhere whenever a phone call is received.
ClouditaliaCall2HTTPConverter works with Clouditalia sip accounts only, you can get some for free at [Clouditalia Orchestra](http://www.clouditaliaorchestra.com).

Clouditalia offers free sip accounts related to italian geographical phone numbers, for non italian phone numbers a monthly fee is applied.

This repository bulds a new docker image based on Freeswitch over a regular Debian 7 image.

Freeswitch was built following the instructions reported in this book :
[Amazon Link](http://www.amazon.it/Costruire-centralini-telefonici-con-FreeSWITCH/dp/8891173096/ref=sr_1_1?ie=UTF8&qid=1439468932&sr=8-1&keywords=freeswitch)

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

After a call has been received a busy signal is sent back to the caller so you won't be charged from your telco company.
I use this process for home automation purposes: the most common scenario is a raspberry pi connected to some appliance by his GPIO.
Using a simple http server on the raspberry you can control its GPIO (therefore your home appliances) directly from your cellphone just making a simple voicecall.

No smartphones are required, no dataplan is required.

SIP Ports
------------
Running cointainers should't need to expose any port, docker should take care of masquerading outgoing traffic automatically.
If you're on a modern Linux distribution you can check the ongoing masquerading packets with the 'conntrack' command line utility. 
Just make sure to don't overlap the SIP_PORT env variable on your yml file and that the ports you entered are usable.




