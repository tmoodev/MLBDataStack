CREATE TABLE DimGame (
    GameKey INT PRIMARY KEY,          -- Unique Game Identifier
    GameDate DATE NOT NULL,           -- Date of the Game
    GameYear INT GENERATED ALWAYS AS (YEAR(GameDate)) STORED, -- Auto-calculated year from GameDate
    GameType VARCHAR(10) NOT NULL,    -- Type of Game (e.g., Regular, Playoff, Spring Training)
    HomeTeam VARCHAR(10) NOT NULL,    -- Home Team Code
    AwayTeam VARCHAR(10) NOT NULL     -- Away Team Code
);
