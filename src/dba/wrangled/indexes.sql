-- wrangled/indexes.sql

CREATE INDEX name_ix_surname ON surname(name);
CREATE INDEX per_100k_year_ix_surname ON surname(per_100k, year);
CREATE INDEX rank_year_ix_surname ON surname(rank, year);
