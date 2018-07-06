U.S. Census Surnames
====================

Most frequent surnames, as recorded by the U.S. Census

Census landing page: https://www.census.gov/topics/population/genealogy/data.html

## Manifest (in-progress)

- [src/data/fetch.sh](src/data/fetch.sh): Downloads the data from the Census website and unzips to `data/raw`
- [src/data/import-prep.sh](src/data/import-prep.sh): One-liner that converts the (multi-)whitespace-delimited 1990 dataset to comma-delimited
- [src/dba/vanilla/bootstrap.sql](src/dba/vanilla/bootstrap.sql): Self-executing bash/SQLite script that imports the raw CSV data into `data/processed/census-surnames.vanila.sqlite`
- [src/dba/wrangled/bootstrap.sql](src/dba/wrangled/bootstrap.sql): Self-executing bash/SQLite script that imports from the vanilla DB tables and wrangles/tidies/indexes the data as a new database, `data/processed/census-surnames.wrangled.sqlite`



--------

<!-- credits footer -->


[storydriven-cookiecutter](https://github.com/storydrivendata/storydriven-cookiecutter) is a simplified version of [cookiecutter-data-science](https://drivendata.github.io/cookiecutter-data-science/) project template.


To use:

```sh
cookiecutter https://github.com/storydrivendata/storydriven-cookiecutter
```

