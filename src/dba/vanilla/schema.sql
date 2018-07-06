DROP TABLE IF EXISTS "surnames_1990";
CREATE TABLE surnames_1990 (
    name TEXT PRIMARY KEY
    , frequency DECIMAL
    , cum_frequency DECIMAL
    , rank INTEGER
);


DROP TABLE IF EXISTS "surnames_2000";
CREATE TABLE "surnames_2000" (
    name TEXT PRIMARY KEY
    , rank INTEGER
    , count INTEGER
    , per_100k DECIMAL
    , cum_per_100k DECIMAL
    , pct_white DECIMAL
    , pct_black DECIMAL
    , pct_asian DECIMAL
    , pct_ai_an DECIMAL
    , pct_mixed DECIMAL
    , pct_hispanic DECIMAL
);


DROP TABLE IF EXISTS "surnames_2010";
CREATE TABLE "surnames_2010" (
    name TEXT PRIMARY KEY
    , rank INTEGER
    , count INTEGER
    , per_100k DECIMAL
    , cum_per_100k DECIMAL
    , pct_white DECIMAL
    , pct_black DECIMAL
    , pct_asian DECIMAL
    , pct_ai_an DECIMAL
    , pct_mixed DECIMAL
    , pct_hispanic DECIMAL
);
