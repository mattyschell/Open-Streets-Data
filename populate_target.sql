alter table lion add column shapept geometry(point, 2263);
update lion set shapept = ST_Line_Interpolate_Point(st_linemerge(geom),.50);
create index if not exists lionshapept on lion using GIST(shapept);
delete from openstreetstarget;
insert into openstreetstarget (
    segmentid
   ,nodeidfrom
   ,nodeidto
   ,street
   ,fromleft
   ,toleft
   ,fromright
   ,toright
   ,open_date
   ,days_of_Week
   ,start_time
   ,end_time
   ,length_miles
   ,shape )
select '''' || a.segmentid || '''' as segmentid
      ,'''' || a.nodeidfrom || '''' as nodeidfrom 
      ,'''' || a.nodeidto || '''' as nodeidto
      ,a.street
      ,a.fromleft
      ,a.toleft
      ,a.fromright
      ,a.toright
      ,b.date_open_
      ,b.day_of_wee
      ,b.start_time
      ,b.end_time
      ,b.length_in_
      ,st_transform(st_linemerge(a.geom),4326)
from 
lion a
join
openstreetssource b
on st_within(a.shapept,
             st_buffer(b.shape, 4));
--the insert above is dropping leading 0s from character cols without the quotes
--but quotes not right either, this is some old lady who swallowed the fly ish
update 
    openstreetstarget 
set 
    segmentid = replace(segmentid,'''','')
   ,nodeidfrom = replace(nodeidfrom,'''','')
   ,nodeidto = replace(nodeidto,'''','');
--drop column lionshapept from lion;
delete from openstreetsreview;
insert into openstreetsreview
(   segmentid
   ,nodeidfrom
   ,nodeidto
   ,street
   ,fromleft
   ,toleft
   ,fromright
   ,toright
   ,open_date
   ,days_of_Week
   ,daily_start_time
   ,daily_end_time
   ,length_miles
   ,shape )
select
    segmentid
   ,nodeidfrom
   ,nodeidto
   ,street
   ,fromleft
   ,toleft
   ,fromright
   ,toright
   ,open_date
   ,days_of_Week
   ,daily_start_time
   ,daily_end_time
   ,length_miles
   ,st_transform(shape,2263)
from openstreetstarget;

