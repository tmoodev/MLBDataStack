DELIMITER $$

CREATE PROCEDURE UpdateDimPitcher()
BEGIN
    -- Insert missing pitchers
    INSERT INTO DimPitcher (
        PitcherKey, 
        PlayerName, 
        PlayerThrows, 
        PlayerAge
    )
    SELECT DISTINCT 
        pd.pitcher AS PitcherKey, 
        pd.player_name AS PlayerName, 
        pd.p_throws AS PlayerThrows, 
        pd.age_pit AS PlayerAge
    FROM PitchData pd
    WHERE NOT EXISTS (
        SELECT 1 FROM DimPitcher dp WHERE dp.PitcherKey = pd.pitcher
    );
END $$

DELIMITER ;
