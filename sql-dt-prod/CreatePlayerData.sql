DROP TABLE IF EXISTS baseball.player_data;

CREATE TABLE baseball.player_data (
    mlbam_id INT NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    retro_id VARCHAR(20),
    bbref_id VARCHAR(20),
    fangraphs_id VARCHAR(20),
    mlb_first_year INT UNSIGNED,
    mlb_last_year INT UNSIGNED,
    PRIMARY KEY (mlbam_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
