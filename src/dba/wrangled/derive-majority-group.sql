-- wrangled/derive-majority-group.sql
--
--    Calculates the "majority_group" and "majority_pct" fields,
--    which are convenience fields so that we can easily query,
--    for example, all surnames that are popular among ethnically
--    Hispanic persons. Or, surnames in which the majority ethnic/race
--    group is less than 80 percent.

--------------------------------------------------------------------
--
-- In SQLite, comparisons with NULL aren't valid, so we create
-- a temporary table, "numnulls", that converts all NULL pct fields
-- to -1
DROP TABLE IF EXISTS numnulls;
CREATE TEMPORARY TABLE
    numnulls AS
        SELECT *
        FROM surname
        WHERE year <> 1990
            -- because 1990 does not have the ethnic/racial breakdown
;

--  I'm sure there's a more elegant way to set corresponding NULL fields to -1
--  using recursion or something, but oh well!
UPDATE
    numnulls
SET
    pct_white = -1
WHERE
    pct_white IS NULL
;

UPDATE
    numnulls
SET
    pct_black = -1
WHERE
    pct_black IS NULL
;

UPDATE
    numnulls
SET
    pct_hispanic = -1
WHERE
    pct_hispanic IS NULL
;

UPDATE
    numnulls
SET
    pct_asian = -1
WHERE
    pct_asian IS NULL
;

UPDATE
    numnulls
SET
    pct_ai_an = -1
WHERE
    pct_ai_an IS NULL
;

UPDATE
    numnulls
SET
    pct_mixed = -1
WHERE
    pct_mixed IS NULL
;


--------------------------------------------------------------------
--
-- OK, now we use SQLite's row-value comparisons to do a type of
-- JOIN between surname and numnulls to do the proper calculation
-- This requires SQLite version >= 3.15.0
-- h/t https://dba.stackexchange.com/questions/175803/how-to-update-a-sqlite-column-with-an-inner-join-on-two-fields

UPDATE surname
SET
    (majority_group, majority_pct) = ('white', pct_white)
WHERE
    (year, name)
    IN (
        SELECT year, name
        FROM numnulls
        WHERE
            MAX(
                pct_white, pct_black, pct_hispanic, pct_asian, pct_ai_an, pct_mixed
               ) = pct_white
    )
;
-- black
UPDATE surname
SET
    (majority_group, majority_pct) = ('black', pct_black)
WHERE
    (year, name)
    IN (
        SELECT year, name
        FROM numnulls
        WHERE
            MAX(
                pct_white, pct_black, pct_hispanic, pct_asian, pct_ai_an, pct_mixed
               ) = pct_black
    )
;

-- hispanic
UPDATE surname
SET
    (majority_group, majority_pct) = ('hispanic', pct_hispanic)
WHERE
    (year, name)
    IN (
        SELECT year, name
        FROM numnulls
        WHERE
            MAX(
                pct_white, pct_black, pct_hispanic, pct_asian, pct_ai_an, pct_mixed
               ) = pct_hispanic
    )
;

-- asian
UPDATE surname
SET
    (majority_group, majority_pct) = ('asian', pct_asian)
WHERE
    (year, name)
    IN (
        SELECT year, name
        FROM numnulls
        WHERE
            MAX(
                pct_white, pct_black, pct_hispanic, pct_asian, pct_ai_an, pct_mixed
               ) = pct_asian
    )
;

-- ai_an (american indian/alaskan native)
UPDATE surname
SET
    (majority_group, majority_pct) = ('ai_an', pct_ai_an)
WHERE
    (year, name)
    IN (
        SELECT year, name
        FROM numnulls
        WHERE
            MAX(
                pct_white, pct_black, pct_hispanic, pct_asian, pct_ai_an, pct_mixed
               ) = pct_ai_an
    )
;

-- mixed (two or more races)
UPDATE surname
SET
    (majority_group, majority_pct) = ('mixed', pct_mixed)
WHERE
    (year, name)
    IN (
        SELECT year, name
        FROM numnulls
        WHERE
            MAX(
                pct_white, pct_black, pct_hispanic, pct_asian, pct_ai_an, pct_mixed
               ) = pct_mixed
    )
;


-- whew, all done!

------------------------------------------------------------
--
-- SQLite drops temporary tables upon database disconnection
-- but might as well do it explictly
-- DROP TABLE numnulls;
