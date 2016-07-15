Epicodus Ruby Week 3 Individual Coding Assignment for Code Review:
DB Basics in Ruby/Sinatra.

By James Turello

## Description

This application contains two classes: One for Word, and one for Definition.

This webpage is hosted at and can be viewed at the following url: [XXXXXXXXXX](http://)

## Setup/Installation Requirements

* Clone this git repository (hair_salon_sinatra).
* In a terminal window cd into the project's root directory and run the `bundle` command.
* Create the databases - (instructions below)
* From the same directory run command: `ruby app.rb`


### Database Setup Instructions

 * unpack sql dump file...XXXXX
 *
 *
 or...
 * Run the following SQL commands in terminal...XXXXX
 * CREATE DATABASE hair_salon;
 * \c hair_salon
 * CREATE TABLE stylists (id serial PRIMARY KEY, name VARCHAR, phone VARCHAR, location VARCHAR);
 * CREATE TABLE clients (id serial PRIMARY KEY, name VARCHAR, phone VARCHAR, location VARCHAR, stylist_id INT REFERENCES stylists(id));
 * CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;

## Known Bugs

No known bugs or issues

## Technologies Used

Coded and tested on Chrome 51 on a Mac Book Pro running ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-darwin15], Bootstrap v3.3.6, and Sinatra 1.4.7

### License

This software is available for use under the MIT license.

Copyright (c) 2016 - James Turello
