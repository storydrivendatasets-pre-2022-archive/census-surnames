-- wrangled/indexes.sql

CREATE INDEX name_ix_surname ON surname(name);
CREATE INDEX per_100k_ix_surname ON surname(per_100k);
CREATE INDEX rank_ix_surname ON surname(rank);
CREATE INDEX majority_group_ix_surname ON surname(majority_group);
CREATE INDEX majority_pct_ix_surname ON surname(majority_pct);
