#one time (or few time) only load of lion reference data
#export PGUSER=sehace
#export PGPASSWORD=camino
#export PGDATABASE=alandar
cd scratch/lion20b_extracts
shp2pgsql -s 2263 lion.shp lion > lion.sql
psql -f lion.sql
# node not used just for reference
shp2pgsql -s 2263 node.shp node > node.sql
psql -f node.sql
