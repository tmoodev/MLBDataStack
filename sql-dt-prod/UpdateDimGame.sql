DROP PROCEDURE IF EXISTS baseball.UpdateDimGame;

DELIMITER $$
CREATE PROCEDURE UpdateDimGame()
BEGIN
    -- Insert missing games into dim_game
    INSERT INTO Games (
        GameKey, 
        GameDate, 
        GameType, 
        HomeTeam, 
        AwayTeam
    )
    SELECT DISTINCT 
        game_pk as GameKey, 
        game_date as GameDate, 
        game_type as GameType, 
        home_team as HomeTeam, 
        away_team as AwayTeam
    FROM PitchData
    WHERE game_pk NOT IN (SELECT GameKey FROM Games);
END $$
DELIMITER ;
