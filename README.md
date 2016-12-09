

CREATE DATABASE hair_salon;

\c hair_salon

CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);

CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);

\c Guest  - Change to other directory.

CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
