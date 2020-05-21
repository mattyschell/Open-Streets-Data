# Open Streets Data Enhanced with Attributes and Time Machine


## Data In This Repo

TBD



# How Did It Get Here

Open Streets Source

    https://data.cityofnewyork.us/Health/Open-Streets-Locations/uiay-nctu 

LION 20B
    
    https://www1.nyc.gov/site/planning/data-maps/open-data/dwn-lion.page


```shell
$ ./loadopenstreets.sh
```

```
$ psql -f populate_target.sql
```

ogr2ogr 