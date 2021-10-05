CREATE DATABASE BuildQueryTest2
USE BuildQueryTest2
--Dion Finnerty
--103545669


/*
--TASK1--
RELATIONAL SCHEMA


ORGANISATION(OrgID, OrganisationName)
PRIMARY KEY(OrgID)

CLIENT(ClientID, OrgID, Name, Phone)
PRIMARY KEY(ClientID)
FOREIGN KEY(OrgID)  REFERENCES ORGANISATION

ORDER(DateTimePlaced, ClientID, DeliveryAddress)
PRIMARY KEY(DateTimePlaced, ClientID)
FOREIGN KEY(ClientID) REFERENCES CLIENT

MENUITEM(ItemID, Description, ServesPerUnit, UnitPrice)
PRIMARY KEY(ItemID)

ORDERLINE(ClientID, DateTimePlaced, ItemID, Qty)
PRIMARY KEY(ClientID, DateTimePlaced, ItemID)
FOREIGN KEY(ClientID, DateTimePlaced) REFERENCES ORDER
FOREIGN KEY(ItemID) REFERENCES MENUITEM

DROP TABLE ORGANISATION5669
DROP TABLE CLIENT5669
DROP TABLE ORDER5559
DROP TABLE MENUITEM5669
DROP TABLE ORDERLINE5669
DROP TABLE ORGANISATION
DROP TABLE CLIENT
DROP TABLE ORDER
DROP TABLE MENUITEM
DROP TABLE ORDERLINE
*/


--TASK2 
CREATE TABLE ORGANISATION5669(
    OrgID NVARCHAR(4), 
    OrganisationName NVARCHAR(200) UNIQUE NOT NULL,
    PRIMARY KEY(OrgID)
)

CREATE TABLE CLIENT5669(
    ClientID INT,  
    [Name] NVARCHAR(100) NOT NULL, 
    Phone NVARCHAR(15) UNIQUE NOT NULL,
    OrgID NVARCHAR(4),
    PRIMARY KEY(ClientID),
    FOREIGN KEY(OrgID) REFERENCES ORGANISATION5669
)

CREATE TABLE ORDER5669(
    ClientID INT, 
    DateTimePlaced DATE, 
    DeliveryAddress NVARCHAR(MAX) NOT NULL,
    PRIMARY KEY(ClientID, DateTimePlaced),
    FOREIGN KEY(ClientID) REFERENCES CLIENT5669
)

CREATE TABLE MENUITEM5669(
    ItemID INT, 
    [Description] NVARCHAR(100) UNIQUE NOT NULL, 
    ServesPerUnit INT, 
    UnitPrice MONEY NOT NULL,
    PRIMARY KEY(ItemID),
    CONSTRAINT CHK_ServePerUnit CHECK (ServesPerUnit > 0)
)

CREATE TABLE ORDERLINE5669(
    ItemID INT, 
    ClientID INT, 
    DateTimePlaced DATE, 
    Qty INT NOT NULL,
    PRIMARY KEY(ClientID, DateTimePlaced, ItemID),
    FOREIGN KEY (ClientID, DateTimePlaced) REFERENCES ORDER5669,
    FOREIGN KEY(ItemID) REFERENCES MENUITEM5669,
    CONSTRAINT CHK_Qty CHECK (Qty > 0)
)

SELECT * FROM  ORGANISATION5669
SELECT * FROM  CLIENT5669
SELECT * FROM  ORDER5669
SELECT * FROM MENUITEM5669
SELECT * FROM  ORDERLINE5669


DELETE
FROM ORGANISATION5669

DELETE 
FROM CLIENT5669

DELETE 
FROM ORDER5669

DELETE 
FROM ORDERLINE5669

DELETE
FROM MENUITEM5669

INSERT INTO ORGANISATION5669 (OrgID, OrganisationName) VALUES
('DODG',	'Dod & Gy Widget Importers'),
('SWUT',	'Swinburne University of Technology');

INSERT INTO CLIENT5669 (ClientID, [Name], Phone ,OrgId) VALUES
(12,	'James Hallinan',	'(03)5555-1234',	'SWUT'),
(15,	'Any Nguyen',	'(03)5555-2345',	'DODG'),
(18,	'Karen Mok',	'(03)5555-3456',	'SWUT'),
(21,	'Tim Baird',	'(03)5555-4567',	'DODG');

INSERT INTO ORDER5669 (ClientID, DateTimePlaced, DeliveryAddress) VALUES
(12,	'2021-09-20',	'Room TB225 - SUT - 1 John Street, Hawthorn, 3122'),
(21,	'2021-09-14',	'Room ATC009 - SUT - 1 John Street, Hawthorn, 3122'),
(21,	'2021-09-27',	'Room TB225 - SUT - 1 John Street, Hawthorn, 3122'),
(15,	'2021-09-20',	'The George - 1 John Street, Hawthorn, 3122'),
(18,	'2021-09-30',	'Room TB225 - SUT - 1 John Street, Hawthorn, 3122');

INSERT INTO MENUITEM5669 (ItemID, [Description], ServesPerUnit,	UnitPrice) VALUES
(3214,	'Tropical Pizza - Large',	2,	 16.00),
(3216,	'Tropical Pizza - Small',	1,	 12.00),
(3218,	'Tropical Pizza - Family',	4,	 23.00),
(4325,	'Can - Coke Zero',	1,	 2.50), 
(4326,	'Can - Lemonade',	1,	 2.50), 
(4327,	'Can - Harden Up',	1,	 7.50 );

INSERT INTO ORDERLINE5669 (ItemId, ClientId, DateTimePlaced, Qty) VALUES 
(3216,	12,	'2021-09-20',	2),
(4326,	12,	'2021-09-20',	1),
(3218,	21,	'2021-09-14',	1),
(3214,	21,	'2021-09-14',	1),
(4325,	21,	'2021-09-14',	4),
(4327,	21,	'2021-09-14',	2),
(3216,	21,	'2021-09-27',	1),
(4327,	21,	'2021-09-27',	1),
(3218,	21,	'2021-09-27',	2),
(3216,	15,	'2021-09-20',	2),
(4326,	15,	'2021-09-20',	1),
(3216,	18,	'2021-09-30',	1),
(4327,	18,	'2021-09-30',	1);


