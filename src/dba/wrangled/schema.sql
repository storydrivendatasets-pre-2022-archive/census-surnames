-- wrangled/schema.sql

-- Differences from the "vanilla" schema:
    --    Just one "surname" table, instead of a table for each dataset year
    --    Adds the "year" column
    --    Removes the cum_per_100k column
    --    Re-arranges the race/ethnicity columns

DROP TABLE IF EXISTS surname;
CREATE TABLE surname (
    year INTEGER
    , name TEXT
    , rank INTEGER
    , count INTEGER
    , per_100k DECIMAL
    , pct_white DECIMAL
    , pct_black DECIMAL
    , pct_hispanic DECIMAL
    , pct_asian DECIMAL
    , pct_ai_an DECIMAL
    , pct_mixed DECIMAL
    , PRIMARY KEY (year, name)
);

