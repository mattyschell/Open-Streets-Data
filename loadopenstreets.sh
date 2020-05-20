# regular load of open streets data
#export PGUSER=sehace
#export PGPASSWORD=camino
#export PGDATABASE=alandar
# TODO: automate this via cURL
#https://data.cityofnewyork.us/api/geospatial/uiay-nctu?method=export&format=Shapefile
cd data
shp2pgsql -s 4326:2263 -g shape -a geo_export_36aa5c1f-4e5a-4a62-b06c-44082de070b8.shp openstreetssource > openstreetssource.sql
psql -c 'delete from openstreetssource;'
psql -f openstreetssource.sql

