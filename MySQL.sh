#!/bin/sh
###############################################################################
###################   JAN 15 2021                     #########################
###################   Mysql Database                  #########################
###############################################################################

sudo apt-get update

echo "#####  Installing Mysql #####"

echo "mysql-server mysql-server/root_password password root" | sudo debconf-set-selections

echo "mysql-server mysql-server/root_password_again password root" | sudo debconf-set-selections

sudo apt-get install mysql-server -y

sudo ufw enable

sudo ufw allow mysql

sudo systemctl start mysql

sudo systemctl enable mysql

sudo systemctl restart mysql

mysql -u root --password=root -e '

	CREATE DATABASE movie;

	use movie;

	CREATE TABLE movie_details (id INT NOT NULL AUTO_INCREMENT , MovieName varchar(255) NOT
NULL, LeadActorName varchar(255) NOT NULL, DirectorName varchar(255) NOT NULL, primary key (id));

	INSERT INTO movie_details (MovieName , LeadActorName, DirectorName) VALUES ("Venom", "Tom Hardy","Andy Serkis"), ("Amazing spider man", "Andrew Garfield", "Marc webb"), (" Tumbbad ", "Soham Shah", "Anand Gandhi");  
	
	FLUSH PRIVILEGES;

	exit'

