-- wrangled/extract-inserts.sql
--    The 3 tables from the vanilla database -- i.e. the raw Census surname data
--    from 1990, 2000, and 2010 -- are all inserted into wrangled.surname,
--    which has a "year" column to keep the datasets differentiated

------------------------------------------
-- 2010 data
INSERT INTO
    wrangled.surname(
        year
        , name
        , rank
        , per_100k
        , count
        , pct_white
        , pct_black
        , pct_hispanic
        , pct_asian
        , pct_ai_an
        , pct_mixed
    )
SELECT
        2010
        , name
        , rank
        , per_100k
        , count
        , pct_white
        , pct_black
        , pct_hispanic
        , pct_asian
        , pct_ai_an
        , pct_mixed
FROM
    vanilla.surnames_2010
ORDER BY
    count DESC
    , rank ASC
    , name ASC
;


------------------------------------------
-- 2000 data
INSERT INTO
    wrangled.surname(
        year
        , name
        , rank
        , per_100k
        , count
        , pct_white
        , pct_black
        , pct_hispanic
        , pct_asian
        , pct_ai_an
        , pct_mixed
    )
SELECT
        2000
        , name
        , rank
        , per_100k
        , count
        , pct_white
        , pct_black
        , pct_hispanic
        , pct_asian
        , pct_ai_an
        , pct_mixed
FROM
    vanilla.surnames_2000
ORDER BY
    count DESC
    , rank ASC
    , name ASC
;


-- 1990 data, (which has only a few of the columns)
INSERT INTO
    wrangled.surname(
        year
        , name
        , rank
        , per_100k
    )
SELECT
    1990
    , name
    , rank
    , ROUND(1000 * frequency, 2)
FROM
    vanilla.surnames_1990
ORDER BY
    frequency DESC
    , rank ASC
    , name ASC
;

--------------------------------------------------------
-- TODO: figure out how to convert 1990's frequency into
--       equivalent 2000/2010 per_100k metric
