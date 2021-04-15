if exists (select * from sysdatabases where name='Disasters')
		drop database "Disasters"
go

if exists (select * from sysobjects where id = object_id('Events') and sysstat & 0xf = 3)
	drop table "Events"
go

if exists (select * from sysobjects where id = object_id('Countries') and sysstat & 0xf = 3)
	drop table "Countries"
go

if exists (select * from sysobjects where id = object_id('EventTypes') and sysstat & 0xf = 3)
	drop table "EventTypes"
go

if exists (select * from sysobjects where id = object_id('Affiliations') and sysstat & 0xf = 3)
	drop table "Affiliations"
go

if exists (select * from sysobjects where id = object_id('Anthropologists') and sysstat & 0xf = 3)
	drop table "Anthropologists"
go

if exists (select * from sysobjects where id = object_id('Event_Anthropologist') and sysstat & 0xf = 3)
	drop table "Event_Anthropologist"
go

if exists (select * from sysobjects where id = object_id('PM_Protocols') and sysstat & 0xf = 3)
	drop table "PM_Protocols"
go

if exists (select * from sysobjects where id = object_id('Event_PM_Protocol') and sysstat & 0xf = 3)
	drop table "Event_PM_Protocol"
go

if exists (select * from sysobjects where id = object_id('AM_Protocols') and sysstat & 0xf = 3)
	drop table "AM_Protocols"
go

if exists (select * from sysobjects where id = object_id('Event_AM_Protocol') and sysstat & 0xf = 3)
	drop table "Event_AM_Protocol"
go

CREATE DATABASE "Disasters"
GO

use Disasters
go

CREATE TABLE "Countries"(
	"CountryID"		int IDENTITY(1,1)	NOT NULL,
	"Name"			nvarchar (15)		NOT NULL,

	CONSTRAINT "PK_Countries" PRIMARY KEY NONCLUSTERED ("CountryID")
)
GO

CREATE TABLE "EventTypes"(
	"EventTypeID"		int IDENTITY(1,1)	NOT NULL,
	"Name"				nvarchar(30)		NOT NULL,

	CONSTRAINT "PK_EventTypes" PRIMARY KEY NONCLUSTERED ("EventTypeID")
)
GO

CREATE TABLE "Events"(
	"EventID"		int IDENTITY(1,1)	NOT NULL,
	"CountryID"		int					NOT NULL,
	"EventTypeID"	int 				NOT NULL,
	"Date"			datetime			NOT NULL,
	"Description"	text				NOT NULL,

	CONSTRAINT "PK_Events" PRIMARY KEY NONCLUSTERED ("EventID"),

	CONSTRAINT "FK_CountryID" FOREIGN KEY ("CountryID") 
	REFERENCES "Countries" ("CountryID")
	ON DELETE CASCADE,

	CONSTRAINT "FK_EventTypeID" FOREIGN KEY ("EventTypeID") 
	REFERENCES "EventTypes" ("EventTypeID")
	ON DELETE CASCADE
)
GO
CREATE INDEX "CountryID" ON "Events"("CountryID")
Go
CREATE INDEX "EventTypeID" ON "Events"("EventTypeID")
GO
CREATE INDEX "Date" ON "Events"("Date")
GO

CREATE TABLE "Affiliations"(
	"AffiliationID"		int IDENTITY(1,1)	NOT NULL,
	"Name"				nvarchar(100)		NOT NULL,

	CONSTRAINT "PK_Affiliations" PRIMARY KEY NONCLUSTERED ("AffiliationID")
)
GO

CREATE TABLE "Anthropologists"(
	"AnthropologistID"		int IDENTITY(1,1)	NOT NULL,
	"FirstName"				nvarchar(10)		NOT NULL,
	"LastName"				nvarchar(20)		NOT NULL,
	"AffiliationID"			int					NOT NULL,

	CONSTRAINT "PK_Anthropologists" PRIMARY KEY NONCLUSTERED ("AnthropologistID"),

	CONSTRAINT "FK_AffiliationID" FOREIGN KEY ("AffiliationID") 
	REFERENCES "Affiliations" ("AffiliationID")
	ON DELETE CASCADE
)
GO
CREATE INDEX "AffiliationID" ON "Anthropologists"("AffiliationID")
GO

CREATE TABLE "Event_Anthropologist"(
	"EventID"				int		NOT NULL,
	"AnthropologistID"		int		NOT NULL,

	CONSTRAINT "PK_Event_Anthropologist" PRIMARY KEY NONCLUSTERED ("AnthropologistID", "EventID"),

	FOREIGN KEY ("EventID") 
	REFERENCES "Events" ("EventID")
	ON DELETE CASCADE,

	CONSTRAINT "FK_AnthropologistID" FOREIGN KEY ("AnthropologistID") 
	REFERENCES "Anthropologists" ("AnthropologistID")
	ON DELETE CASCADE
)
GO
CREATE INDEX "EventID" ON "Event_Anthropologist"("EventID")
GO
CREATE INDEX "AnthropologistID" ON "Event_Anthropologist"("AnthropologistID")
GO

CREATE TABLE "AM_Protocols"(
	"AMProtocolID"			int IDENTITY(1,1)	NOT NULL,
	"Sex"					bit					NULL,
	"Age"					tinyint				NULL,
	"Height"				tinyint				NULL,
	"Race"					nvarchar(20)		NULL,
	"Weight"				float				NULL,
	"EyesColor"				nvarchar(10)		NULL,
	"DistinctiveFeatures"	text				NULL,
	"Items"					text				NULL,
	"Status"				nvarchar(40)		NULL,
	"PMProtocolID"			int					NULL,

	CONSTRAINT "PK_AMProtocolID" PRIMARY KEY NONCLUSTERED ("AMProtocolID"),
)
GO
CREATE UNIQUE CLUSTERED INDEX "AMProtocolID" ON "AM_Protocols"("AMProtocolID")
GO

CREATE TABLE "PM_Protocols"(
	"PMProtocolID"			int IDENTITY(1,1)	NOT NULL,
	"Sex"					bit					NULL,
	"Age"					tinyint				NULL,
	"Height"				tinyint				NULL,
	"Race"					nvarchar(20)		NULL,
	"Weight"				float				NULL,
	"EyesColor"				nvarchar(10)		NULL,
	"DistinctiveFeatures"	text				NULL,
	"Items"					text				NULL,
	"Status"				nvarchar(40)		NULL,
	"AMProtocolID"			int					NULL,

	CONSTRAINT "PK_PMProtocolID" PRIMARY KEY NONCLUSTERED  ("PMProtocolID"),

	CONSTRAINT "FK_AMProtocolID" FOREIGN KEY ("AMProtocolID") 
	REFERENCES "AM_Protocols" ("AMProtocolID")
)
GO
CREATE UNIQUE CLUSTERED INDEX "PMProtocolID" ON "PM_Protocols"("PMProtocolID")
GO

ALTER TABLE "AM_Protocols"
ADD CONSTRAINT "FK_PMProtocolID" FOREIGN KEY ("PMProtocolID") 
REFERENCES "PM_Protocols" ("PMProtocolID")

CREATE TABLE "Event_PM_Protocol"(
	"EventID"				int		NOT NULL,
	"PMProtocolID"			int		NOT NULL,

	CONSTRAINT "PK_Event_PM_Protocol" PRIMARY KEY NONCLUSTERED  ("PMProtocolID", "EventID"),

	FOREIGN KEY ("EventID") 
	REFERENCES "Events" ("EventID")
	ON DELETE CASCADE,

	FOREIGN KEY ("PMProtocolID") 
	REFERENCES "PM_Protocols" ("PMProtocolID")
	ON DELETE CASCADE
)
GO
CREATE INDEX "EventID" ON "Event_PM_Protocol"("EventID")
GO
CREATE INDEX "PMProtocolID" ON "Event_PM_Protocol"("PMProtocolID")
GO

CREATE TABLE "Event_AM_Protocol"(
	"EventID"				int		NOT NULL,
	"AMProtocolID"			int		NOT NULL,

	CONSTRAINT "PK_Event_AM_Protocol" PRIMARY KEY NONCLUSTERED ("AMProtocolID", "EventID"),

	FOREIGN KEY ("EventID") 
	REFERENCES "Events" ("EventID")
	ON DELETE CASCADE,

	FOREIGN KEY ("AMProtocolID") 
	REFERENCES "AM_Protocols" ("AMProtocolID")
	ON DELETE CASCADE
)
GO
CREATE INDEX "EventID" ON "Event_AM_Protocol"("EventID")
GO
CREATE INDEX "AMProtocolID" ON "Event_AM_Protocol"("AMProtocolID")
GO