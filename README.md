Epicodus Ruby Week 3 Individual Coding Assignment for Code Review:
DB Basics in Ruby/Sinatra.

By James Turello

## Description (Assignment)

> Create an application for a hair salon. The stylists at the salon work independently, so each client will only belong to a single stylist (one stylist, many clients).

>The following user stories should be completed:

> * As a salon owner, I want to view, add, update and delete stylists.
> * As a salon owner, I want to view, add, update and delete clients.
> * As a salon owner, I want to add clients to a stylist.

This webpage is hosted at and can be viewed at the following url: [hair-salon-sinatra](https://git.heroku.com/hair-salon-sinatra.git)

## Setup/Installation Requirements

* Clone this git repository (hair_salon_sinatra).
* In a terminal window cd into the project's root directory and run the `bundle` command.
* Create the databases - (instructions below)
* From the same directory run command: `ruby app.rb`


### Database Setup Instructions

 * cd into the project root directory 
 * start the postgres server (in another terminal window) with command: pg_ctl start
 * enter command: CREATE DATABASE hair_salon
 * enter command: hair_salon < hair_salon.sql
 * in another terminal window start the sinatra server (from the project's root directory) with command: ruby app.rb
 * then enter 'localhost:4567' in your browser's address bar   
 or...
 * Run the following SQL commands in terminal
 * CREATE DATABASE hair_salon;
 * \c hair_salon
 * CREATE TABLE stylists (id serial PRIMARY KEY, name VARCHAR NOT NULL, phone VARCHAR, location VARCHAR);
 * CREATE TABLE clients (id serial PRIMARY KEY, name VARCHAR NOT NULL, phone VARCHAR, location VARCHAR, stylist_id INT REFERENCES stylists(id));
 * CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;

## Known Bugs

No known bugs or issues

## Technologies Used

Coded and tested on Chrome 51 on a Mac Book Pro running ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-darwin15], Bootstrap v3.3.6, and Sinatra 1.4.7

### License

This software is available for use under the MIT license.

Copyright (c) 2016 - James Turello
