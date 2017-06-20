DROP TABLE IF EXISTS Lawnmower00201;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Factory;
DROP TABLE IF EXISTS dpt_fr;
DROP TABLE IF EXISTS DefaultType;
DROP TABLE IF EXISTS Category;

CREATE TABLE Category
(
	Category varchar(1) PRIMARY KEY,
	CategoryName varchar(255)
);

CREATE TABLE DefaultType
(
	DefaultType int PRIMARY KEY,
	fkCategory varchar(1) REFERENCES Category(Category)
);

CREATE TABLE dpt_fr
(
	Departement varchar(2) PRIMARY KEY,
	DptName varchar(255),
	Population varchar(255)
);

CREATE TABLE Factory
(
	Factory int PRIMARY KEY,
	AgeOfFactory int,
	Capacity int,
	fkFactoryLocation varchar(2) REFERENCES dpt_fr(Departement)
);

CREATE TABLE Product
(
	Product varchar(255) PRIMARY KEY,
	Color varchar(255),
	Size int,
	Weight int,
	DateOfDesign date,
	AgeOfDesign int
);

CREATE TABLE Lawnmower00201
(
	artificialKey serial PRIMARY KEY,
	TicketNumber varchar(255),
	Date date,
	fkProduct varchar(255) REFERENCES Product(Product),
	fkFactory int REFERENCES Factory(Factory),
	fkDefaultType int REFERENCES DefaultType(DefaultType)
);

\copy Category FROM 'C:\Users\Komalis\Documents\Miao\NF17-TP\201\Category.csv' DELIMITER ';' csv;
\copy DefaultType FROM 'C:\Users\Komalis\Documents\Miao\NF17-TP\201\DefaultType.csv' DELIMITER ';' csv;
\copy dpt_fr FROM 'C:\Users\Komalis\Documents\Miao\NF17-TP\201\dpt_fr.csv' DELIMITER ';' csv;
\copy Factory FROM 'C:\Users\Komalis\Documents\Miao\NF17-TP\201\Factory.csv' DELIMITER ';' csv;
\copy Product FROM 'C:\Users\Komalis\Documents\Miao\NF17-TP\201\Product.csv' DELIMITER ';' csv;
\copy Lawnmower00201(TicketNumber, Date, fkProduct, fkFactory, fkDefaultType) FROM 'C:\Users\Komalis\Documents\Miao\NF17-TP\201\Lawnmower00201.csv' DELIMITER ';' csv;