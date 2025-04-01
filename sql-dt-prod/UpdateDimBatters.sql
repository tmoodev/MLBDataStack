DROP PROCEDURE IF EXISTS UpdateDimBatter;

DELIMITER $$
CREATE PROCEDURE UpdateDimBatter()
BEGIN
    INSERT INTO Batters (
    	BatterKey,
    	PlayerLastName,
    	PlayerFirstName,
    	PlayerName, 
    	PlayerStands, 
    	PlayerAge,
    	FirstMLBAppearance,
    	LastMLBAppearance)
    SELECT DISTINCT 
    	pd.batter as BatterKey, 
    	pit.name_last as PlayerLastName,
    	pit.name_first as PlayerFirstName,
    	concat(pit.name_first, " ", pit.name_last) as PlayerName, 
    	pd.stand as PlayerStands, 
    	pd.age_bat as PlayerAge,
    	pit.mlb_played_first as FirstMLBAppearance,
    	pit.mlb_played_last as LastMLBAppearance
    FROM PitchData pd
    LEFT JOIN PlayerInfo pit
    	ON pd.batter = pit.key_mlbam
    ON DUPLICATE KEY UPDATE
        PlayerLastName = VALUES(PlayerLastName),
        PlayerFirstName = VALUES(PlayerFirstName),
        PlayerStands = VALUES(PlayerStands),
        PlayerAge = VALUES(PlayerAge),
		FirstMLBAppearance = VALUES(FirstMLBAppearance),
		LastMLBAppearance = VALUES(LastMLBAppearance);
END $$
DELIMITER ;