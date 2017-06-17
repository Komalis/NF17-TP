DROP VIEW IF EXISTS view_all;
DROP TABLE IF EXISTS NoReturn00100;
DROP TABLE IF EXISTS Catalogue;
DROP TABLE IF EXISTS Factory;
DROP TABLE IF EXISTS Family;
DROP TABLE IF EXISTS Store;
DROP TABLE IF EXISTS City;

CREATE TABLE City
(
	City varchar(255) PRIMARY KEY,
	Population int
);

CREATE TABLE Store
(
	Store int PRIMARY KEY,
	DateOfOpening date,
	DateOfRenovation date
);

CREATE TABLE Family
(
	Subfamily varchar(255) PRIMARY KEY,
	Grp varchar(255)
);

CREATE TABLE Factory
(
	Factory int PRIMARY KEY,
	AgeOfFactory int,
	Capacity int,
	FactoryLocation varchar(255) REFERENCES City(City)
);

CREATE TABLE Catalogue
(
	IDDevice varchar(255) PRIMARY KEY,
	REFDevice varchar(255),
	SubFamily varchar(255) REFERENCES Family,
	Maker varchar(255)
);

CREATE TABLE NoReturn00100
(
	TicketNumber int PRIMARY KEY,
	Date date,
	IDDevice varchar(255) REFERENCES Catalogue,
	Store int REFERENCES Store,
	Factory int REFERENCES Factory
);

\copy City FROM 'city_fr.csv' DELIMITER ';' csv;
\copy Store FROM 'Store.csv' DELIMITER ';' csv;
\copy Family FROM 'family.csv' DELIMITER ';' csv;
\copy Factory FROM 'Factory.csv' DELIMITER ';' csv;
\copy Catalogue FROM 'catalogue.csv' DELIMITER ';' csv;
\copy NoReturn00100 FROM 'NoReturn00100_new.csv' DELIMITER ';' csv;

CREATE VIEW view_all AS
SELECT * FROM NoReturn00100
RIGHT JOIN Catalogue USING (IDDevice)
RIGHT JOIN Store USING (Store)
RIGHT JOIN Factory USING (Factory)
RIGHT JOIN Family USING (SubFamily)
RIGHT JOIN City ON Factory.FactoryLocation = City.City;

SELECT * FROM view_all;