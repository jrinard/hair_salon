# _Hair Salon_

#### By _**Joshua Rinard**_

## Description

This site allows the user to make a word list. Then add multiple definitions to the word

## Setup/Installation Requirements

CREATE DATABASE hair_salon;

\c hair_salon

CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);

CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);

\c Guest  - Change to other directory.

CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;

## Known Bugs

This version contains no known issues.

## Support and contact details

* Github for Joshua Rinard: jrinard
* Email: jrinard@hotmail.com

## Technologies Used

HTML, CSS, Bootstrap, Ruby, Sinatra, Capybara were used in the production of this site.

### License

Open Source

Copyright (c) 2016 Joshua Rinard
