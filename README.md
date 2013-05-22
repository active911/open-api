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

To get started, you'll need to register as a developer.  This is free; it just means we know who you are and how to contact you.  Once you register, you can create one or or apps.  Each app can interface with Active911 to push and pull data.

Once you've done this, go ahead and clone the examples in this repository.  Technical documentation is available in the [wiki](wiki) .


