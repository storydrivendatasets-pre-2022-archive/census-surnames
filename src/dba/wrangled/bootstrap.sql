#!/usr/bin/env bash
tail -n +4 "$0" | sqlite3
exit $?
---------------------------------------------------------------------
-- wrangled/bootstrap.sql
--    Expects vaniila DB to already exist, i.e.
--       ./data/processed/census-surnames.vanilla.sqlite
--
--    Creates the DB ./data/processed/census-surnames.wrangled.sqlite
.bail on
.echo on
.changes on

-- initialize wrangled version of database file
.open './data/processed/census-surnames.wrangled.sqlite'
-- drop and create new table in the wrangled version
.read ./src/dba/wrangled/schema.sql

-- alias wrangled database as "wrangled"
ATTACH DATABASE
    './data/processed/census-surnames.wrangled.sqlite'
    AS wrangled;

-- attach the existing vanilla DB that we will select/insert from
ATTACH DATABASE
    './data/processed/census-surnames.vanilla.sqlite'
    AS vanilla;

-- import from vaniila and insert into wrangled
.read ./src/dba/wrangled/extract-inserts.sql

-- clean up the namespace
DETACH DATABASE vanilla;
DETACH DATABASE wrangled;

.open './data/processed/census-surnames.wrangled.sqlite'

-- tidy the wrangled data
.read ./src/dba/wrangled/tidy.sql

-- index the data
.read ./src/dba/wrangled/indexes.sql
