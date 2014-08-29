litcoffee-sms
=============

A simple literate CoffeeScript program for sending text messages via email.

###Carrier Email to SMS Gateway Listing:

This list was taken from [Crake][1]'s [Python_Message][2] repository.

[1]: https://github.com/CrakeNotSnowman
[2]: https://github.com/CrakeNotSnowman/Python_Message

| Carrier                        | Suffix                  | Type |
|:-------------------------------|:------------------------|:-----|
| Alltel                         | message.alltel.com      | SMS  |
| AT&T (formerly Cingular)       | txt.att.net             | SMS  |
| AT&T (formerly Cingular)       | mms.att.net             | MMS  |
| AT&T (formerly Cingular)       | cingularme.com          | SMS  |
| Boost Mobile                   | myboostmobile.com       | SMS  |
| Nextel (now Sprint Nextel)     | messaging.nextel.com    | SMS  |
| Sprint PCS (now Sprint Nextel) | messaging.sprintpcs.com | SMS  |
| Sprint PCS (now Sprint Nextel) | pm.sprint.com           | MMS  |
| T-Mobile                       | tmomail.net             | SMS  |
| US Cellular                    | email.uscc.net          | SMS  |
| US Cellular                    | mms.uscc.net            | MMS  |
| Verizon                        | vtext.com               | SMS  |
| Verizon                        | vzwpix.com              | MMS  |
| Virgin Mobile USA              | vmobl.com               | SMS  |

All of the carriers above use email addresses in the following format.
```
[10-digit phone number]@carriersuffix.tld
```

Example:
```
1234567890@tmomail.net
```
