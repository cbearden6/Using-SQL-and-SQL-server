# Project 4 - Cody Bearden

use world;

# 1 
INSERT city
VALUES
	(1, 'Foo', 'ABW', 'Whee', 100000);
# Row with ID 1 already exists. Default should have been used.

# 2 
INSERT countrylanguage
VALUES 
	('ZZZ', 'Zebraese', 'T', 34.2);
# A new CountryCode on this table would not match the primary key code on the country table, so it is rejected.

# 3 
DELETE FROM country
WHERE Code = 'ABW';
# If we deleted this row in Country, we could create orphans in city & countrylanguage

# 4 
UPDATE country 
SET Code = 'Minionland'
WHERE Code = 'ABW';
# Minionland has too many characters (Only 3 are allowed).

# 5 
INSERT city
VALUES
	(DEFAULT, 'Whoville', 'ABW', 'DistrictX', NULL);
# Population column has a NOT NULL constraint.

# 6
DESCRIBE city;
INSERT city
	(ID, Name, CountryCode, District, Population)
VALUES
	(DEFAULT, 'Impact', 'USA', 'Texas', 43);
    
# 7
DELETE FROM city
WHERE ID = 4081;

# 8
INSERT city
VALUES
	(DEFAULT, 'Impact', 'USA', 'Texas', 43),
    (DEFAULT, 'Terrysberg', 'USA', 'Ohio', 4333),
    (DEFAULT, 'Toad City', 'USA', 'Indiana', 1),
    (DEFAULT, 'Hellscape', 'USA', 'Michigan', 666);
    
    # 9
    UPDATE city
    SET Population = 44
    WHERE ID = 4082;
    
    # 10
    UPDATE city
    SET Population = Population + 1
    WHERE ID = 4082;
    
    # 11, VIN Number = CHAR(17)
    
    # 12, MSRP = MEDIUMINT(5)
    
    # 13, Estimated MPG, City = TINYINT(2)
    
    # 14, Consumer Rating = DECIMAL(2,1)
    
    # 15, Sold = ENUM('AVAILABLE', 'SOLD')
    
    # 16, Make = CHAR(25) 
    
    # 17, Color = CHAR(50)
    
    # 18, Options = SET('Stereo Upgrade', 'Roof Rack', 'Mud Guards', 'Wheel Upgrade', 'Nav System')
    
    # 19, Sales Ratio = DECIMAL(3,1)
    
    # 20, Purchase Date = DATETIME
    










