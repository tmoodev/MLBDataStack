DROP TABLE IF EXISTS baseball.Pitchers;

CREATE TABLE Pitchers (
    PitcherKey INT PRIMARY KEY,
    PlayerLastName VARCHAR(50),
    PlayerFirstName VARCHAR(50),
    PlayerName VARCHAR(100),
    PlayerThrows VARCHAR(5),           -- Typically 'R', 'L', or 'S'
    PlayerAge INT,
    FirstMLBAppearance INT,
    LastMLBAppearance INT
);
