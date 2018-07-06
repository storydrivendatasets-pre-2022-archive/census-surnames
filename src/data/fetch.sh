#!/usr/bin/env bash
# Downloads and unzips name data from 1990, 2000, and 2010

RAW_DIR=data/raw
ZIP_DIR=${RAW_DIR}/zips
mkdir -p $ZIP_DIR

#############################
# 2010
# Landing page: https://www.census.gov/topics/population/genealogy/data/2010_surnames.html
#############################
(>&2 echo "Downloading: https://www2.census.gov/topics/genealogy/2010surnames/names.zip")
curl https://www2.census.gov/topics/genealogy/2010surnames/names.zip \
    -o ${ZIP_DIR}/census-names-2010.zip

# data file: Names_2010Census.csv
_dname='Names_2010Census.csv'
(>&2 echo "Unzipping ${ZIP_DIR}/census-names-2010.zip and extracting ${_dname}")
unzip -op ${ZIP_DIR}/census-names-2010.zip \
          ${_dname} \
    > ${RAW_DIR}/surnames-2010.csv


#############################
# 2000
# Landing page: https://www.census.gov/topics/population/genealogy/data/2000_surnames.html
#############################
(>&2 echo "Downloading: https://www2.census.gov/topics/genealogy/2000surnames/names.zip")
curl https://www2.census.gov/topics/genealogy/2000surnames/names.zip \
      -o ${ZIP_DIR}/census-names-2000.zip

# data file: app_c.csv
_dname='app_c.csv'
(>&2 echo "Unzipping ${ZIP_DIR}/census-names-2000.zip and extracting ${_dname}")
unzip -op ${ZIP_DIR}/census-names-2000.zip \
          ${_dname} \
    > ${RAW_DIR}/surnames-2000.csv


#############################
# 1990
# landing page: https://www.census.gov/topics/population/genealogy/data/1990_census.html
#############################
# data file is the file downloaded
_dname='dist.all.last'
(>&2 echo "Downloading: https://www2.census.gov/topics/genealogy/1990surnames/${_dname}")
curl https://www2.census.gov/topics/genealogy/1990surnames/${_dname} \
    -o ${RAW_DIR}/surnames-1990.txt
