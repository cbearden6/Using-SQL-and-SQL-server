# Project 6 - Cody Bearden

DROP DATABASE IF EXISTS FranksFrames;
CREATE DATABASE FranksFrames;
USE FranksFrames;

CREATE TABLE Frame (
FrameId     	INT  							 		 	 AUTO_INCREMENT NOT NULL,
FrameName   	VARCHAR(45)							 		 NOT NULL,
FrameColor  	ENUM('Gold', 'Silver', 'Black', 'White')	 NOT NULL,
FrameWidth 		FLOAT										 NOT NULL,
FramePricePLF   DECIMAL(5,2)								 NOT NULL,
CONSTRAINT PRIMARY KEY (FrameId)
);

CREATE TABLE Glass (
GlassId		   INT 				AUTO_INCREMENT NOT NULL,
GlassStyle 	   VARCHAR(45)		NOT NULL,
GlassPricePSF  DECIMAL(4,2)		NOT NULL,
CONSTRAINT PRIMARY KEY (GlassId)
);

CREATE TABLE Customer (
CustomerId 	 	INT			  AUTO_INCREMENT NOT NULL,
CustomerName 	VARCHAR(45)   NOT NULL,
CustomerPhone	CHAR(10),
CONSTRAINT PRIMARY KEY (CustomerId)
);

CREATE TABLE Mat (
MatId 		  INT 										    AUTO_INCREMENT  NOT NULL,
MatColor 	  ENUM('White', 'Gray', 'Black', 'Sand')		NOT NULL,
MatPricePSF   DECIMAL(4,2)									NOT NULL,
CONSTRAINT PRIMARY KEY (MatId)
);

CREATE TABLE Poster (
PosterId		INT				AUTO_INCREMENT NOT NULL,
PosterName		VARCHAR(45)		NOT NULL,
PosterPrice		DECIMAL(5,2)	NOT NULL,
PosterWidth		FLOAT,
PosterHeight	FLOAT,
CONSTRAINT PRIMARY KEY (PosterId)
);

CREATE TABLE Supplier (
SupplierId		INT				AUTO_INCREMENT NOT NULL,
SupplierName	VARCHAR(45)		NOT NULL,
SupplierPhone	CHAR(10)		NOT NULL,
CONSTRAINT PRIMARY KEY (SupplierId)
);

CREATE TABLE PosterSupplier (
PosterId	INT		  NOT NULL,
SupplierID	INT		  NOT NULL,
CONSTRAINT PRIMARY KEY (PosterId, SupplierId),
CONSTRAINT FranksFrames_PosterId_PK FOREIGN KEY (PosterId)
	REFERENCES Poster (PosterId)
    ON DELETE CASCADE,
CONSTRAINT FranksFrames_SupplierId_PK FOREIGN KEY (SupplierId)
	REFERENCES Supplier (SupplierId)
    ON DELETE CASCADE
);

CREATE TABLE FrameOrder (
OrderId 		INT 			AUTO_INCREMENT NOT NULL,
CustomerId 		INT 			NOT NULL,
PosterId 		INT 			NOT NULL, 
MatId 			INT 			NOT NULL, 
FrameId 		INT 			NOT NULL,
GlassId 		INT 			NOT NULL, 
OrderPromised 	DATE 		    NOT NULL, 
OrderPrice 		DECIMAL(6,2) 	NOT NULL,
CONSTRAINT PRIMARY KEY (OrderId),
CONSTRAINT FranksFrames_CustomerId_FK FOREIGN KEY (CustomerId)
	REFERENCES Customer (CustomerId)
    ON DELETE CASCADE,
CONSTRAINT FranksFrames_PosterId_FK FOREIGN KEY (PosterId)
	REFERENCES Poster (PosterId)
    ON DELETE CASCADE,
CONSTRAINT FranksFrames_MatId_FK FOREIGN KEY (MatId)
	REFERENCES Mat (MatId)
    ON DELETE CASCADE,
CONSTRAINT FranksFrames_FrameId_FK FOREIGN KEY (FrameId)
	REFERENCES Frame (FrameId)
    ON DELETE CASCADE,
CONSTRAINT FranksFrames_GlassId_FK FOREIGN KEY (GlassId)
	REFERENCES Glass (GlassId)
    ON DELETE CASCADE
);

CREATE INDEX Cust_phone_IDX ON Customer (CustomerPhone);


INSERT Frame
VALUES 
	(DEFAULT, 'Oak', 'Gold', 34, 111.11),
    (DEFAULT, 'Steel', 'Silver', 34.2, 11.11),
    (DEFAULT, 'Plastic', 'Gold', 24.2, 131.11),
    (DEFAULT, 'Cedar', 'white', 14.2, 311.11),
    (DEFAULT, 'Teak', 'Black', 20, 666.66);

INSERT Glass
VALUES
	(DEFAULT, 'Cool', 40),
    (DEFAULT, 'Frosted', 60.11),
    (DEFAULT, 'Reflective', 80.66),
    (DEFAULT, 'Plexiglass', 15.15),
    (DEFAULT, 'Invisible', 5);
    
INSERT Customer 
VALUES
	(DEFAULT, 'Harrie Earie', 8046600726),
    (DEFAULT, 'Dalis Laurie', 5724255533),
    (DEFAULT, 'Pip Bigrigg', 1633331770),
    (DEFAULT, 'Jordon Bakewell', 8262108968),
    (DEFAULT, 'Julina Chazerand', 8405195227);
    
    
INSERT Supplier 
VALUES
	(DEFAULT, 'Labadie, Friesen and Ledner', 5657589249),
    (DEFAULT, 'Koelpin-Kemmer', 5277618279),
    (DEFAULT, 'Hermiston, Green and Herman', 9959029247),
    (DEFAULT, 'Schaden Inc', 9417986509),
    (DEFAULT, 'Cruickshank LLC', 4534187734);
    
INSERT Poster
VALUES 
	(DEFAULT, 'Dr. Bronner''s Magic Soapbox', 69.99, 30, 60),
    (DEFAULT, 'I Am Legend', 115.99, 30, 60),
    (DEFAULT, 'Drunken Master (Jui kuen)', 200, 30, 60),
    (DEFAULT, 'The Pee-Wee Herman Show on Broadway', 500, 30, 60),
    (DEFAULT, 'Cemetery Man (Dellamorte Dellamore)', 999.99, 60, 60);
    
INSERT Mat
VALUES
	(DEFAULT, 'White', 15.99),
    (DEFAULT, 'Gray', 35.99),
    (DEFAULT, 'Black', 69.99),
    (DEFAULT, 'Sand', 75.99),
    (DEFAULT, 'Black', 99.99);
    
INSERT PosterSupplier
VALUES
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);
    
INSERT FrameOrder
VALUES
	(DEFAULT, 1, 1, 1, 1, 1, '2021-10-31', 333),
    (DEFAULT, 2, 2, 2, 2, 2, '2021-10-30', 444),
    (DEFAULT, 3, 3, 3, 3, 3, '2021-10-29', 555),
    (DEFAULT, 4, 4, 4, 4, 4, '2021-10-28', 666),
    (DEFAULT, 5, 5, 5, 5, 5, '2021-10-27', 2000);
    

SELECT PosterName 
FROM Poster JOIN FrameOrder USING (PosterId)
	JOIN Frame USING (FrameId)
WHERE FrameColor = 'Black';

SELECT CustomerName, PosterName
FROM Customer JOIN FrameOrder USING (CustomerId)
	JOIN Poster USING (PosterId);
    
SELECT SupplierName, PosterName, PosterPrice
FROM  Supplier JOIN PosterSupplier USING (SupplierId)
	JOIN Poster USING (PosterId);
	








