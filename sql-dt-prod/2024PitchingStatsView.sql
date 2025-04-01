CREATE OR REPLACE VIEW baseball.2024pitching_stats AS
SELECT
    p.PitcherKey,
    COUNT(DISTINCT p.GameKey) AS games_played,

    -- Earned Runs (assuming 'home_run' and 'single'/'double'/'triple' count)
    SUM(CASE 
        WHEN p.Event IN ('home_run', 'single', 'double', 'triple') 
             AND p.PitchOutcome = 'in_play' THEN 1 
        ELSE 0 
    END) AS earned_runs,

    -- Hits Allowed
    SUM(CASE 
        WHEN p.Event IN ('single', 'double', 'triple', 'home_run') THEN 1 
        ELSE 0 
    END) AS hits_allowed,

    -- Walks
    SUM(CASE 
        WHEN p.PitchOutcome = 'walk' THEN 1 
        ELSE 0 
    END) AS walks,

    -- Strikeouts
    SUM(CASE 
        WHEN p.Event = 'strikeout' THEN 1 
        ELSE 0 
    END) AS strikeouts,

    -- Home Runs
    SUM(CASE 
        WHEN p.Event = 'home_run' THEN 1 
        ELSE 0 
    END) AS home_runs,

    -- Outs (3 outs per inning)
    ROUND(SUM(CASE 
        WHEN p.Event IN ('strikeout', 'field_out', 'grounded_into_double_play', 'force_out') THEN 1 
        ELSE 0 
    END) / 3, 2) AS innings_pitched,

    -- Batters Faced
    COUNT(DISTINCT CONCAT(p.GameKey, p.atBat)) AS batters_faced

FROM
    Pitches p
LEFT JOIN Games g on p.GameKey = g.GameKey
WHERE
    p.PitcherKey IS NOT NULL
AND g.GameYear = 2024
GROUP BY
    PitcherKey;
