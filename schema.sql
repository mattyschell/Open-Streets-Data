create table if not exists openstreetstarget (
    objectid            serial primary key
   ,segmentid           text   -- these are LION attributes
   ,nodeidfrom          text
   ,nodeidto            text
   ,street              varchar(4000)
   ,fromleft            varchar(32) -- house number, can include non numeric
   ,toleft              varchar(32)
   ,fromright           varchar(32)
   ,toright             varchar(32) 
   ,open_date           date         -- open streets starts here..
   ,days_of_week        varchar(256)  
   ,daily_start_time    varchar(256)
   ,daily_end_time      varchar(256)
   ,length_miles        numeric
   ,shape               geometry(linestring, 4326) -- this is lion 
); 
create index if not exists openstreetstargetshape on openstreetstarget using GIST(shape);
alter table openstreetstarget alter column shape set not null;
--
CREATE TABLE openstreetssource (
    gid         serial primary key,
    borough     varchar(254) NULL,
    day_of_wee  varchar(254) NULL,
    end_time    varchar(254) NULL,
    from_stree  varchar(254) NULL,
    length_in_  numeric NULL,
    location_p  varchar(254) NULL,
    on_street   varchar(254) NULL,
    date_open_  date NULL,
    time_open_  varchar(254) NULL,
    shape_leng  numeric NULL,
    start_time  varchar(254) NULL,
    to_street   varchar(254) NULL,
    "type"      varchar(254) NULL,
    shape       geometry(multilinestring, 2263) NULL
);
--
create table if not exists openstreetsreview (
    objectid            serial primary key
   ,segmentid           varchar(32)   -- these are LION attributes
   ,nodeidfrom          varchar(32) 
   ,nodeidto            varchar(32)
   ,street              varchar(4000)
   ,fromleft            varchar(32) -- house number, can include non numeric
   ,toleft              varchar(32)
   ,fromright           varchar(32)
   ,toright             varchar(32) 
   ,open_date           date         -- open streets starts here..
   ,days_of_week        varchar(256)  
   ,daily_start_time    varchar(256)
   ,daily_end_time      varchar(256)
   ,length_miles        numeric
   ,shape               geometry(linestring, 2263) 
); 