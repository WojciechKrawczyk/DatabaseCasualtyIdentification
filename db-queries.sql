use Disasters

--1. Łączna liczba katastrof w danym państwie posortowana alfabetycznie.
SELECT Countries.Name as Country, COUNT(EventID) as DisastersCount
FROM Countries
	JOIN Events ON Countries.CountryID=Events.CountryID
GROUP BY Countries.Name
ORDER BY Countries.Name

--2. Narastająca liczba oﬁar we wszystkich katastrofach naturalnych razem wziętych w ostatnich 10-ciu latach. 
SELECT Events.EventID, COUNT(PMProtocolID) as VictimCount
FROM Events
	JOIN Event_PM_Protocol ON Events.EventID=Event_PM_Protocol.EventID
WHERE Events.EventTypeID=5 AND YEAR(Events.Date) + 10 >= YEAR(CURRENT_TIMESTAMP)
GROUP BY Events.EventID
ORDER BY VictimCount ASC

--3. Lista antropologów, którzy pracowali przy identyﬁkacji ponadprzeciętnej liczby oﬁar. 
SELECT Anthropologists.FirstName, Anthropologists.LastName, COUNT(PMProtocolID) as VictimCount
FROM Anthropologists
	JOIN Event_Anthropologist ON Anthropologists.AnthropologistID=Event_Anthropologist.AnthropologistID
	JOIN Events ON Event_Anthropologist.EventID=Events.EventID
	JOIN Event_PM_Protocol ON Events.EventID=Event_PM_Protocol.EventID
GROUP BY Anthropologists.FirstName, Anthropologists.LastName
HAVING COUNT(PMProtocolID) > ((SELECT COUNT(*) FROM PM_Protocols) / (SELECT COUNT(*) FROM Anthropologists))

--4. Lista instytucji, której antropolodzy pracowali przy przynajmniej dwóch katastrofach. 
SELECT Affiliations.Name, COUNT(EventID) as EventCount
FROM Affiliations
	JOIN Anthropologists ON Affiliations.AffiliationID=Anthropologists.AffiliationID
	JOIN Event_Anthropologist ON Anthropologists.AnthropologistID=Event_Anthropologist.AnthropologistID
GROUP BY Affiliations.Name
HAVING COUNT(EventID) > 1

--5. Lista oﬁar, przy której nie znaleziono żadnych przedmiotów.
SELECT PM_Protocols.PMProtocolID, PM_Protocols.Items FROM PM_Protocols
WHERE Items IS NULL;

--Dodatkowy przykład realizujacy analogiczne żądanie dla Zdarzenia
--Chcemy zrobić listę wydarzeń, w których nie ma ofiar
--Na potrzeby przykładu dodajemu do tabeli Events dwa rekordy i ich spodziewamy się w wyniku kwerendy

set quoted_identifier on
go
set identity_insert "Events" on
go
ALTER TABLE "Events" NOCHECK CONSTRAINT ALL
go
INSERT "Events"("EventID","CountryID","EventTypeID","Date","Description") VALUES(11,1,1,'2020-05-09','Zawalenie mostu')
INSERT "Events"("EventID","CountryID","EventTypeID","Date","Description") VALUES(12,3,5,'2019-11-21','Osunięcie skarpy')
set identity_insert "Events" off
go
ALTER TABLE "Events" CHECK CONSTRAINT ALL
go

SELECT Events.EventID, Events.Description
FROM Events
WHERE NOT EXISTS (SELECT * FROM Event_PM_Protocol WHERE Events.EventID=Event_PM_Protocol.EventID)