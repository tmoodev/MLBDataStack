CREATE TABLE DimPitcher (
    PitcherKey INT NOT NULL PRIMARY KEY,  -- Unique Pitcher ID
    PlayerName VARCHAR(255) NOT NULL, -- Player's name
    PlayerThrows CHAR(1) NOT NULL, 
    PlayerAge DECIMAL(4,1) 
);
