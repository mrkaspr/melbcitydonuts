CREATE DATABASE melbcitydonuts;

CREATE TABLE users (
 id SERIAL PRIMARY KEY,
 email TEXT,
 password_digest TEXT
);

CREATE TABLE donut_shops (
  id SERIAL PRIMARY KEY,
  shop_name TEXT,
  location TEXT,
  bio TEXT,
  website TEXT,
  image TEXT,
  date_time TIMESTAMP
);

CREATE TABLE donuts (
  id SERIAL PRIMARY KEY,
  donut_name TEXT,
  shop_id INTEGER,
  shop_name TEXT,
  review TEXT,
  image TEXT,
  date_time TIMESTAMP
);


INSERT INTO users (email, password_digest) VALUES ('kp@ga.com', 'password');

INSERT INTO donut_shops (shop_name, location, bio, website)
VALUES ('Krispy Kreme', 'Melbourne CBD', 'lorem ipsum', 'www.krispykreme.com.au');
INSERT INTO donut_shops (shop_name, location, bio, website)
VALUES ('Doughboy Doughnuts', 'Melbourne CBD', 'lorem ipsum', 'www.doughboysdoughnuts.com.au');
INSERT INTO donut_shops (shop_name, location, bio, website)
VALUES ('Daniel''s Donuts', 'Melbourne CBD', 'lorem ipsum', 'www.danielsdonuts.com.au');

INSERT INTO donuts (donut_name, shop_id, shop_name, review)
VALUES ('Tiramisu Donuts' , '1', 'Krispy Kreme', 'Tiramisu flavoured fillings');

INSERT INTO donuts (donut_name, shop_id, shop_name, review)
VALUES ('Banoffee Pie' , '2', 'Doughboy Doughnuts', 'Banana, dulce de leche, oatmeal pie crust & dark chocolate');

INSERT INTO donuts (donut_name, shop_id, shop_name, review)
VALUES ('Durian Donuts' , '3', 'Daniel''s Donuts', 'Durian cream filling');