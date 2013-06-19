Active911 Open API
========

### Introduction

The Active911 cloud manages a large amount of data relevant to emergency response.  Active911 also has mapping, response, and resource GIS data that is constantly being updated in real time. 

This data is available to developers, both as read-only and read-write datasets, via the Active911 Open API.

Here are some examples:

- Suppose you work for a response district with a custom GIS system.  Perhaps you have a command vehicle with a Mobile Data Terminal (MDT) linked to a GPS.    You could use the Active911 Open API to make it so pressing a button on the MDT would automatically populate all Active911 devices with a map marker representing the incident command post location.
- An App Developer writing custom software for Prehospital Care Report (PCR) writing could use the API to pull data from Active911 and pre-populate reports with skeleton information at the time of the alarm
- Computer Aided Dispatch (CAD) vendors can use the API to make it so that response actions transmitted from tablets and smartphones running Active911 can be automatically incorporated into the incident


### Security

In order to access all of this information, you will need to contact the administrator of each Active911 account you want to access.  Normally, you will already be working together - they are probably buying your software, or you are their IT administrator.  They will need to log into the Active911 account and create an API grant and give it to you.  We give detailed, realtime information about emergency response.... so you aren't going to get it without the explicit permission of the person in charge. :)

### Data available through the API

The following is available under the API:

- Alert data (location, description, current response, CAD time, etc)
- Device (personnel) data: name, GPS location, response activity
- GIS data: push and pull map markers 
- Realtime information callback and injection as alerts happen (we poll your server)

### Getting started

1. Contact Activ911 to register as a developer.  This is free. You'll also create an app, and register it with Active911.
2. Log into your Active911 account and generate an API key.
3. Clone this Github repo, and browse to examples/web_client
4. Enter your API key and your developer app key.  Push the buttons.  See how it works.
5. Write your own client to do whatever you like

### Documentation 

Please see the [wiki](https://github.com/active911/open-api/wiki) .


