/*Exercise for SELECT statement in SQL*/

/*From record_company database select all records of each table*/
select * from bands;
select * from albums;
select * from songs;

/*Find out number of albums of each band.*/
select b.name as "Band Name", count(a.name) as "Album Name" 
from bands as b join albums as a
on b.id = a.band_id
group by b.name;

/*Find total number of songs in an album of each band.*/
select b.name as "Band Name", a.name as "Album Name", count(s.id) as "Song ID"
from bands as b 
join albums as a on b.id = a.band_id
join songs as s on a.id = s.album_id
group by b.name;

select b.name as "Band Name", a.name as "Album Name", s.id as "Song ID"
from bands as b 
join albums as a on b.id = a.band_id
join songs as s on a.id = s.album_id
where b.name = "Metallica";

/*Only select 1990 - 2010  band, albums and songs*/
select b.name as "Band Name", a.name as "Album Name", s.name as "Song Name", a.release_year as "Released Date" 
from bands as b join albums as a 
on b.id = a.band_id
join songs as s
on  a.id = s.album_id
where a.release_year between 1990 and 2010
group by b.name; 

/*Select the longest duration song of each band in each album*/
select b.name as "Band Name", a.name as "Album Name", s.name as "Song", max(s.length) as "Duration"
from bands as b
join albums as a on b.id = a.band_id
join songs as s on a.id = s.album_id
group by a.id;

    /*Checking*/select name, max(length) from songs where album_id = 1;