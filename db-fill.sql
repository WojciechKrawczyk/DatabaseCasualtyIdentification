--2.2 Wype³nienie bazy danych danymi
use Disasters

set quoted_identifier on
go
set identity_insert "Countries" on
go
ALTER TABLE "Countries" NOCHECK CONSTRAINT ALL
go
INSERT "Countries"("CountryID","Name") VALUES(1,'Portugalia')
INSERT "Countries"("CountryID","Name") VALUES(2,'Holandia')
INSERT "Countries"("CountryID","Name") VALUES(3,'RPA')
INSERT "Countries"("CountryID","Name") VALUES(4,'Japonia')
INSERT "Countries"("CountryID","Name") VALUES(5,'USA')
INSERT "Countries"("CountryID","Name") VALUES(6,'Izrael')
INSERT "Countries"("CountryID","Name") VALUES(7,'Australia')
set identity_insert "Countries" off
go
ALTER TABLE "Countries" CHECK CONSTRAINT ALL
go

set quoted_identifier on
go
set identity_insert "EventTypes" on
go
ALTER TABLE "EventTypes" NOCHECK CONSTRAINT ALL
go
INSERT "EventTypes"("EventTypeID","Name") VALUES(1,'katastrofa budowlana')
INSERT "EventTypes"("EventTypeID","Name") VALUES(2,'zamach bombowy')
INSERT "EventTypes"("EventTypeID","Name") VALUES(3,'katastrofa lotnicza')
INSERT "EventTypes"("EventTypeID","Name") VALUES(4,'katastrofa kolejowa')
INSERT "EventTypes"("EventTypeID","Name") VALUES(5,'katastrofa naturalna')
set identity_insert "EventTypes" off
go
ALTER TABLE "EventTypes" CHECK CONSTRAINT ALL
go

set quoted_identifier on
go
set identity_insert "Affiliations" on
go
ALTER TABLE "Affiliations" NOCHECK CONSTRAINT ALL
go
INSERT "Affiliations"("AffiliationID","Name") VALUES(1,'Instytut katastrof naturalnych')
INSERT "Affiliations"("AffiliationID","Name") VALUES(2,'Laboratorium lotnicze')
INSERT "Affiliations"("AffiliationID","Name") VALUES(3,'Laboratorium kryminalistyczne')
INSERT "Affiliations"("AffiliationID","Name") VALUES(4,'Instytut katastrof komunikacyjnych')
INSERT "Affiliations"("AffiliationID","Name") VALUES(5,'Instytut katastrof budowlanych')
set identity_insert "Affiliations" off
go
ALTER TABLE "Affiliations" CHECK CONSTRAINT ALL
go

set quoted_identifier on
go
set identity_insert "Anthropologists" on
go
ALTER TABLE "Anthropologists" NOCHECK CONSTRAINT ALL
go
INSERT "Anthropologists"("AnthropologistID","FirstName","LastName","AffiliationID") VALUES(1,'Tomasz','Bednarek',1)
INSERT "Anthropologists"("AnthropologistID","FirstName","LastName","AffiliationID") VALUES(2,'Jan','Nowak',1)
INSERT "Anthropologists"("AnthropologistID","FirstName","LastName","AffiliationID") VALUES(3,'Kazimierz','Burek',5)
INSERT "Anthropologists"("AnthropologistID","FirstName","LastName","AffiliationID") VALUES(4,'Micha³','Maziarz',4)
INSERT "Anthropologists"("AnthropologistID","FirstName","LastName","AffiliationID") VALUES(5,'Franciszek','Michalski',2)
INSERT "Anthropologists"("AnthropologistID","FirstName","LastName","AffiliationID") VALUES(6,'Paulina','Steczkowska',3)
set identity_insert "Anthropologists" off
go
ALTER TABLE "Anthropologists" CHECK CONSTRAINT ALL
go

set quoted_identifier on
go
set identity_insert "Events" on
go
ALTER TABLE "Events" NOCHECK CONSTRAINT ALL
go
INSERT "Events"("EventID","CountryID","EventTypeID","Date","Description") VALUES(1,5,3,'2000-06-12','Katastrofa lotnicza Boeing 737 w USA')
INSERT "Events"("EventID","CountryID","EventTypeID","Date","Description") VALUES(2,2,1,'2005-05-20','Zawalenie rusztowania podczas budowy wie¿owca w Amsterdamie')
INSERT "Events"("EventID","CountryID","EventTypeID","Date","Description") VALUES(3,1,4,'2003-04-15','Wykolejenie sk³adu poci¹gu osobowego w drodze do Lizbony')
INSERT "Events"("EventID","CountryID","EventTypeID","Date","Description") VALUES(4,5,5,'2015-06-12','Tornado w okolicach Jackson')
INSERT "Events"("EventID","CountryID","EventTypeID","Date","Description") VALUES(5,6,2,'2012-01-22','Atak terrorystyczny, wysadzenie bomby (samochód pu³apka)')
INSERT "Events"("EventID","CountryID","EventTypeID","Date","Description") VALUES(6,3,1,'2013-10-15','Po¿ar biurowca w centrum Kapsztadu')
INSERT "Events"("EventID","CountryID","EventTypeID","Date","Description") VALUES(7,4,5,'1996-08-29','PowódŸ w Tokio')
INSERT "Events"("EventID","CountryID","EventTypeID","Date","Description") VALUES(8,7,5,'2019-09-09','Po¿ar buszu w Australi')
INSERT "Events"("EventID","CountryID","EventTypeID","Date","Description") VALUES(9,5,4,'2009-11-12','Zderzenie poci¹gu z ciê¿arówk¹ w Nowym Jorku')
INSERT "Events"("EventID","CountryID","EventTypeID","Date","Description") VALUES(10,4,5,'2018-08-11','PowódŸ w Hiroszimie')
set identity_insert "Events" off
go
ALTER TABLE "Events" CHECK CONSTRAINT ALL
go

set quoted_identifier on
go
set identity_insert "Event_Anthropologist" on
go
ALTER TABLE "Event_Anthropologist" NOCHECK CONSTRAINT ALL
go
INSERT "Event_Anthropologist"("EventID","AnthropologistID") VALUES(1,5)
INSERT "Event_Anthropologist"("EventID","AnthropologistID") VALUES(1,4)
INSERT "Event_Anthropologist"("EventID","AnthropologistID") VALUES(2,3)
INSERT "Event_Anthropologist"("EventID","AnthropologistID") VALUES(3,4)
INSERT "Event_Anthropologist"("EventID","AnthropologistID") VALUES(4,1)
INSERT "Event_Anthropologist"("EventID","AnthropologistID") VALUES(5,1)
INSERT "Event_Anthropologist"("EventID","AnthropologistID") VALUES(6,6)
INSERT "Event_Anthropologist"("EventID","AnthropologistID") VALUES(7,1)
INSERT "Event_Anthropologist"("EventID","AnthropologistID") VALUES(7,2)
INSERT "Event_Anthropologist"("EventID","AnthropologistID") VALUES(8,2)
INSERT "Event_Anthropologist"("EventID","AnthropologistID") VALUES(9,4)
INSERT "Event_Anthropologist"("EventID","AnthropologistID") VALUES(10,1)
set identity_insert "Event_Anthropologist" off
go
ALTER TABLE "Event_Anthropologist" CHECK CONSTRAINT ALL
go

set quoted_identifier on
go
set identity_insert "PM_Protocols" on
go
ALTER TABLE "PM_Protocols" NOCHECK CONSTRAINT ALL
go
INSERT "PM_Protocols"("PMProtocolID","Sex","Age","Height","Race","Weight") VALUES(1,0,33,185,'bia³a',90)
INSERT "PM_Protocols"("PMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","DistinctiveFeatures","Items") VALUES(2,0,14,195,'czarna',110,'br¹zowe','Sekcja wykaza³a wrodzon¹ wadê serca','Portfel, Zegarek')
INSERT "PM_Protocols"("PMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","DistinctiveFeatures","Items") VALUES(3,0,56,179,'czarna',80,'niebieskie','Z³oty z¹b','Laptop')
INSERT "PM_Protocols"("PMProtocolID","Sex","Age","Height","Weight","EyesColor","DistinctiveFeatures") VALUES(4,0,22,182,90,'br¹zowe','Znamiê ko³o lewego ucha')
INSERT "PM_Protocols"("PMProtocolID","Sex","Age","Height","DistinctiveFeatures","Items") VALUES(5,0,34,185,'Proteza w lewej nodze','Portfel')
INSERT "PM_Protocols"("PMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","DistinctiveFeatures","Items") VALUES(6,0,80,179,'¿ó³ta',75.2,'zielone','sztuczna szczêka','Laska')
INSERT "PM_Protocols"("PMProtocolID","Sex","Age","Height","Race","Weight","EyesColor") VALUES(7,1,15,172,'bia³a',68,'niebieskie')
INSERT "PM_Protocols"("PMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","DistinctiveFeatures") VALUES(8,1,36,179,'zó³ta',72.5,'br¹zowe','Dwa pieprzyki na lewym policzku')
INSERT "PM_Protocols"("PMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","DistinctiveFeatures") VALUES(9,1,25,160,'bia³a',70,'zielone','Kolczyk w prawym uchu')
INSERT "PM_Protocols"("PMProtocolID","Sex","Height","Race","EyesColor","DistinctiveFeatures","Items") VALUES(10,1,182,'czarna','zielone','Kolczyk w nosie','Torebka')
INSERT "PM_Protocols"("PMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","DistinctiveFeatures","Items") VALUES(11,1,38,172,'czarna',65.6,'piwne','Peruka','Plecak')
INSERT "PM_Protocols"("PMProtocolID","Sex","Age","Height","Race","Weight","EyesColor") VALUES(12,1,39,171,'¿ó³ta',70.1,'niebieskie')
INSERT "PM_Protocols"("PMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","Items") VALUES(13,1,45,165,'bia³a',60.2,'niebieskie','Torebka, Laptop')
INSERT "PM_Protocols"("PMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","DistinctiveFeatures","Items") VALUES(14,1,75,173,'bia³a',69.9,'br¹zowe','Rozrusznik serca','Torebka')
INSERT "PM_Protocols"("PMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","Items") VALUES(15,1,51,167,'¿ó³ta',73.7,'br¹zowe','Zegarek, Torebka')
set identity_insert "PM_Protocols" off
go
ALTER TABLE "PM_Protocols" CHECK CONSTRAINT ALL
go

set quoted_identifier on
go
set identity_insert "Event_PM_Protocol" on
go
ALTER TABLE "Event_PM_Protocol" NOCHECK CONSTRAINT ALL
go
INSERT "Event_PM_Protocol"("EventID","PMProtocolID") VALUES(1,1)
INSERT "Event_PM_Protocol"("EventID","PMProtocolID") VALUES(6,2)
INSERT "Event_PM_Protocol"("EventID","PMProtocolID") VALUES(3,3)
INSERT "Event_PM_Protocol"("EventID","PMProtocolID") VALUES(2,4)
INSERT "Event_PM_Protocol"("EventID","PMProtocolID") VALUES(5,5)
INSERT "Event_PM_Protocol"("EventID","PMProtocolID") VALUES(7,6)
INSERT "Event_PM_Protocol"("EventID","PMProtocolID") VALUES(8,7)
INSERT "Event_PM_Protocol"("EventID","PMProtocolID") VALUES(10,8)
INSERT "Event_PM_Protocol"("EventID","PMProtocolID") VALUES(2,9)
INSERT "Event_PM_Protocol"("EventID","PMProtocolID") VALUES(4,10)
INSERT "Event_PM_Protocol"("EventID","PMProtocolID") VALUES(9,11)
INSERT "Event_PM_Protocol"("EventID","PMProtocolID") VALUES(6,12)
INSERT "Event_PM_Protocol"("EventID","PMProtocolID") VALUES(10,13)
INSERT "Event_PM_Protocol"("EventID","PMProtocolID") VALUES(3,14)
INSERT "Event_PM_Protocol"("EventID","PMProtocolID") VALUES(1,15)
set identity_insert "Event_PM_Protocol" off
go
ALTER TABLE "Event_PM_Protocol" CHECK CONSTRAINT ALL
go

set quoted_identifier on
go
set identity_insert "AM_Protocols" on
go
ALTER TABLE "AM_Protocols" NOCHECK CONSTRAINT ALL
go
INSERT "AM_Protocols"("AMProtocolID","Sex","Age","Height","Race","Weight","EyesColor") VALUES(1,0,33,187,'bia³a',90,'zielone')
INSERT "AM_Protocols"("AMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","DistinctiveFeatures","Items") VALUES(2,0,17,195,'czarna',110,'br¹zowe','Sekcja wykaza³a wrodzon¹ wadê serca','Portfel, Zegarek')
INSERT "AM_Protocols"("AMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","DistinctiveFeatures","Items") VALUES(3,0,56,179,'czarna',80,'niebieskie','Z³oty z¹b','Laptop')
INSERT "AM_Protocols"("AMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","DistinctiveFeatures") VALUES(4,0,22,182,'bia³a',90,'br¹zowe','Znamiê ko³o lewego ucha')
INSERT "AM_Protocols"("AMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","DistinctiveFeatures","Items") VALUES(5,0,34,185,'bia³a',95.3,'br¹zowe','Proteza w lewej nodze','Portfel, Laptop')
INSERT "AM_Protocols"("AMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","DistinctiveFeatures","Items") VALUES(6,0,80,179,'¿ó³ta',75.2,'zielone','sztuczna szczêka','Laska')
INSERT "AM_Protocols"("AMProtocolID","Sex","Age","Height","Race","Weight","EyesColor") VALUES(7,1,16,172,'bia³a',68,'niebieskie')
INSERT "AM_Protocols"("AMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","DistinctiveFeatures") VALUES(8,1,40,175,'zó³ta',72.5,'br¹zowe','Dwa pieprzyki na lewym policzku')
INSERT "AM_Protocols"("AMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","DistinctiveFeatures") VALUES(9,1,25,169,'bia³a',70,'zielone','Kolczyk w prawym uchu')
INSERT "AM_Protocols"("AMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","DistinctiveFeatures","Items") VALUES(10,1,22,180,'czarna',120.8,'zielone','Kolczyk w nosie','Torebka')
INSERT "AM_Protocols"("AMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","DistinctiveFeatures","Items") VALUES(11,1,38,172,'czarna',65.6,'piwne','Peruka','Plecak')
INSERT "AM_Protocols"("AMProtocolID","Sex","Age","Height","Race","Weight","EyesColor") VALUES(12,1,39,171,'¿ó³ta',70.1,'niebieskie')
INSERT "AM_Protocols"("AMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","Items") VALUES(13,1,45,165,'bia³a',60.2,'niebieskie','Torebka, Laptop')
INSERT "AM_Protocols"("AMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","DistinctiveFeatures","Items") VALUES(14,1,75,173,'bia³a',69.9,'br¹zowe','Rozrusznik serca','Torebka')
INSERT "AM_Protocols"("AMProtocolID","Sex","Age","Height","Race","Weight","EyesColor","Items") VALUES(15,1,62,167,'¿ó³ta',73.7,'br¹zowe','Zegarek, Torebka')
set identity_insert "AM_Protocols" off
go
ALTER TABLE "AM_Protocols" CHECK CONSTRAINT ALL
go

set quoted_identifier on
go
set identity_insert "Event_AM_Protocol" on
go
ALTER TABLE "Event_AM_Protocol" NOCHECK CONSTRAINT ALL
go
INSERT "Event_AM_Protocol"("EventID","AMProtocolID") VALUES(1,1)
INSERT "Event_AM_Protocol"("EventID","AMProtocolID") VALUES(6,2)
INSERT "Event_AM_Protocol"("EventID","AMProtocolID") VALUES(3,3)
INSERT "Event_AM_Protocol"("EventID","AMProtocolID") VALUES(2,4)
INSERT "Event_AM_Protocol"("EventID","AMProtocolID") VALUES(5,5)
INSERT "Event_AM_Protocol"("EventID","AMProtocolID") VALUES(7,6)
INSERT "Event_AM_Protocol"("EventID","AMProtocolID") VALUES(8,7)
INSERT "Event_AM_Protocol"("EventID","AMProtocolID") VALUES(10,8)
INSERT "Event_AM_Protocol"("EventID","AMProtocolID") VALUES(2,9)
INSERT "Event_AM_Protocol"("EventID","AMProtocolID") VALUES(4,10)
INSERT "Event_AM_Protocol"("EventID","AMProtocolID") VALUES(9,11)
INSERT "Event_AM_Protocol"("EventID","AMProtocolID") VALUES(6,12)
INSERT "Event_AM_Protocol"("EventID","AMProtocolID") VALUES(1,13)
INSERT "Event_AM_Protocol"("EventID","AMProtocolID") VALUES(3,14)
INSERT "Event_AM_Protocol"("EventID","AMProtocolID") VALUES(1,15)
set identity_insert "Event_AM_Protocol" off
go
ALTER TABLE "Event_AM_Protocol" CHECK CONSTRAINT ALL
go


--2.3 Modyfikacja wybranego rekordu z wybranej tabeli
UPDATE PM_Protocols
SET Age=28, Race='¿ó³ta'
WHERE PMProtocolID=9;