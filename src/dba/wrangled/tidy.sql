-- wrangled/tidy.sql


----------------------------------------------------------
--
-- The very last line in the 2010 dataset is reserved
-- for a special data point of 'ALL OTHER NAMES', which
-- gives a count of all the people with names too uncommon
-- to disclose in the public dataset. This data point only
-- exists in the 2010 dataset.

UPDATE
    surname
SET
    rank = NULL
        -- original value for "rank" is 0
WHERE
    name = 'ALL OTHER NAMES'
;


----------------------------------------------------------
--
-- In the 2000 and 2010 datasets, the string '(S)' is used
-- for fields in which the values have been
-- "suppressed for confidentiality"
-- To keep the values consistent with the column datatypes
-- (i.e. DECIMAL), we change all instances of '(S)' to
-- NULL values

UPDATE
    surname
SET
    pct_white = NULL
WHERE
    pct_white = '(S)'
;

UPDATE
    surname
SET
    pct_black = NULL
WHERE
    pct_black = '(S)'
;

UPDATE
    surname
SET
    pct_hispanic = NULL
WHERE
    pct_hispanic = '(S)'
;

UPDATE
    surname
SET
    pct_asian = NULL
WHERE
    pct_asian = '(S)'
;

UPDATE
    surname
SET
    pct_ai_an = NULL
WHERE
    pct_ai_an = '(S)'
;

UPDATE
    surname
SET
    pct_mixed = NULL
WHERE
    pct_mixed = '(S)'
;
