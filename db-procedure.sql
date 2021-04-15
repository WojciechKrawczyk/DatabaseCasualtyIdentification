use Disasters
go

CREATE PROCEDURE EventVictimsIdentification (@EventID int)
AS
BEGIN
DECLARE @nulls int
DECLARE @matches int

DECLARE @victim_id int, @victim_age int, @victim_height int, @victim_race varchar(10), @victim_weight float, @victim_eyes varchar(10), @victim_status varchar(40), @victim_conection int
DECLARE Victim CURSOR FOR SELECT PM_Protocols.PMProtocolID, Age, Height, Race, Weight, EyesColor, Status, PM_Protocols.AMProtocolID FROM PM_Protocols 
							JOIN Event_PM_Protocol ON PM_Protocols.PMProtocolID=Event_PM_Protocol.PMProtocolID
							JOIN Events ON Event_PM_Protocol.EventID=Events.EventID
							WHERE Events.EventID=@EventID
OPEN Victim
FETCH NEXT FROM Victim
INTO @victim_id, @victim_age, @victim_height, @victim_race, @victim_weight, @victim_eyes, @victim_status, @victim_conection
WHILE @@FETCH_STATUS = 0  
BEGIN  
	DECLARE @p_victim_id int, @p_victim_age int, @p_victim_height int, @p_victim_race varchar(10), @p_victim_weight float, @p_victim_eyes varchar(10), @p_victim_status varchar(40), @p_victim_conection int
	DECLARE P_Victim CURSOR FOR SELECT AM_Protocols.AMProtocolID, Age, Height, Race, Weight, EyesColor, Status, AM_Protocols.PMProtocolID FROM AM_Protocols 
							JOIN Event_AM_Protocol ON AM_Protocols.AMProtocolID=Event_AM_Protocol.AMProtocolID
							JOIN Events ON Event_AM_Protocol.EventID=Events.EventID
							WHERE Events.EventID=@EventID
	OPEN P_Victim
	FETCH NEXT FROM P_Victim
	INTO @p_victim_id, @p_victim_age, @p_victim_height, @p_victim_race, @p_victim_weight, @p_victim_eyes, @p_victim_status, @p_victim_conection
	WHILE @@FETCH_STATUS = 0  
	BEGIN  
		SELECT @nulls=0
		SELECT @matches=0

		IF @p_victim_status IS NULL
		BEGIN
			UPDATE AM_Protocols
			SET Status='Nie odnaleziony(a)'
			WHERE AMProtocolID=@p_victim_id
		END

		--race
		IF @victim_race IS NULL OR @p_victim_race IS NULL
			SELECT @nulls=@nulls+1
		ELSE
			IF @victim_race=@p_victim_race
				SELECT @matches=@matches+1

		--height
		IF @victim_height IS NULL OR @p_victim_height IS NULL
			SELECT @nulls=@nulls+1
		ELSE
			IF ABS(@victim_height-@p_victim_height) <= 5
				SELECT @matches=@matches+1

		--age
		IF @victim_age IS NULL OR @p_victim_age IS NULL
			SELECT @nulls=@nulls+1
		ELSE
		BEGIN
			IF @p_victim_age < 18 AND ABS(@p_victim_age-@victim_age) <= 2
					SELECT @matches=@matches+1
			IF @p_victim_age >= 18 AND ABS(@p_victim_age-@victim_age) <=10
			SELECT @matches=@matches+1
		END

		--eyes color
		IF @victim_eyes IS NULL OR @p_victim_eyes IS NULL
			SELECT @nulls=@nulls+1
		ELSE
			IF @victim_eyes=@p_victim_eyes
				SELECT @matches=@matches+1

		--weight
		IF @victim_weight IS NULL OR @p_victim_weight IS NULL
			SELECT @nulls=@nulls+1
		ELSE
			IF @victim_weight >= @p_victim_weight*0.9 AND @victim_weight <= @p_victim_weight*1.1
				SELECT @matches=@matches+1

		--conlusions
		IF @nulls <=2 AND @matches >=3
		BEGIN
			IF @p_victim_status='Nie odnaleziony(a)'
			BEGIN
				UPDATE PM_Protocols
				SET AMProtocolID=@p_victim_id, Status='Potencjalnie zidentyﬁkowany(a)'
				WHERE PMProtocolID=@victim_id

				UPDATE AM_Protocols
				SET PMProtocolID=@victim_id, Status='Potencjalnie odnaleziony(a)'
				WHERE AMProtocolID=@p_victim_id
			END
			ELSE IF @p_victim_status='Potencjalnie odnaleziony(a)'
			BEGIN
				UPDATE PM_Protocols
				SET Status='Brak jednoznaczności'
				WHERE PMProtocolID=@victim_id


				UPDATE AM_Protocols
				SET PMProtocolID=null, Status='Brak jednoznaczności'
				WHERE AMProtocolID=@p_victim_conection

				UPDATE AM_Protocols
				SET PMProtocolID=null, Status='Brak jednoznaczności'
				WHERE AMProtocolID=@p_victim_id
			END
		END
		ELSE
		BEGIN
			UPDATE PM_Protocols
			SET Status='Niezidentyﬁkowany(a)'
			WHERE PMProtocolID=@victim_id
		END

		FETCH NEXT FROM P_Victim
		INTO @p_victim_id, @p_victim_age, @p_victim_height, @p_victim_race, @p_victim_weight, @p_victim_eyes, @p_victim_status, @p_victim_conection
	END

	CLOSE P_Victim
	DEALLOCATE P_Victim
    FETCH NEXT FROM Victim  
	INTO @victim_id, @victim_age, @victim_height, @victim_race, @victim_weight, @victim_eyes, @victim_status, @victim_conection
END
END

CLOSE Victim
DEALLOCATE Victim
GO

EXECUTE EventVictimsIdentification @EventID=1
GO

DROP PROCEDURE EventVictimsIdentification 
GO
