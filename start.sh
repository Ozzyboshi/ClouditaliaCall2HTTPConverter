#!/bin/bash
sed -e "s;%SIP_PORT%;$SIP_PORT;g" /varstemplate.xml > /etc/freeswitch/vars.xml
sed -e "s;%SIP_LOGIN%;$SIP_LOGIN;g" -e "s;%SIP_PASSWORD%;$SIP_PASSWORD;g" /numtemplate.xml > /etc/freeswitch/sip_profiles/external/$SIP_LOGIN.xml
#sed "s/voiplogin/$SIP_LOGIN/g" /numtemplate.xml > /etc/freeswitch/sip_profiles/external/$SIP_LOGIN.xml
#sed -i "s/voippassword/$SIP_PASSWORD/g" /etc/freeswitch/sip_profiles/external/$SIP_LOGIN.xml
sed -e "s;%SIP_LOGIN%;$SIP_LOGIN;g" -e "s;%WHITELISTED_NUMBERS%;$WHITELISTED_NUMBERS;g" -e "s;%HTTP_URL%;curl $HTTP_URL;g" /01_inbound_template.xml > /etc/freeswitch/dialplan/public/01_inbound_command.xml
service freeswitch start
fs_cli -x reloadxml
fs_cli