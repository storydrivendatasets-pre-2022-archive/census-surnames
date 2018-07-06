#!/usr/bin/env bash
tail -n +4 "$0" | sqlite3
exit $?

-- begin the bootstrap
.mode csv
.bail on
.echo on
.timer on

-- drop/create new tables
.open ./data/processed/census-surnames.vanilla.sqlite
.read ./src/dba/vanilla/schema.sql

-- import the data
.changes on

.mode csv
.import ./data/raw/surnames-1990.csv surnames_1990
.import ./data/raw/surnames-2000.csv surnames_2000
.import ./data/raw/surnames-2010.csv surnames_2010


-- remove the repeated headers
DELETE FROM surnames_2000 WHERE name = 'name';
DELETE FROM surnames_2010 WHERE name = 'name';
