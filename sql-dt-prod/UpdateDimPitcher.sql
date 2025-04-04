DROP PROCEDURE IF EXISTS UpdateDimPitcher;
DELIMITER $$
CREATE PROCEDURE `baseball`.`UpdateDimPitcher`()
BEGIN
    INSERT INTO Pitchers (
    	PitcherKey,
    	PlayerLastName,
    	PlayerFirstName,
    	PlayerName, 
    	PlayerThrows, 
    	PlayerAge,
    	FirstMLBAppearance,
    	LastMLBAppearance)
    SELECT DISTINCT 
    	pd.pitcher as PitcherKey, 
    	pit.name_last as PlayerLastName,
    	pit.name_first as PlayerFirstName,
    	concat(pit.name_first, " ", pit.name_last) as PlayerName, 
    	pd.p_throws as PlayerThrows, 
    	pd.age_bat as PlayerAge,
    	pit.mlb_played_first as FirstMLBAppearance,
    	pit.mlb_played_last as LastMLBAppearance
    FROM PitchData pd
    LEFT JOIN PlayerInfo pit
    	ON pd.pitcher = pit.key_mlbam
    ON DUPLICATE KEY UPDATE
        PlayerLastName = VALUES(PlayerLastName),
        PlayerFirstName = VALUES(PlayerFirstName),
        PlayerThrows = VALUES(PlayerThrows),
        PlayerAge = VALUES(PlayerAge),
		FirstMLBAppearance = VALUES(FirstMLBAppearance),
		LastMLBAppearance = VALUES(LastMLBAppearance);
END $$
DELIMITER ;