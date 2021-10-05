CREATE DATABASE BuildQueryTest
USE BuildQueryTest
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
*/