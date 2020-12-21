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

