CREATE DATABASE record_company;
USE record_company;

CREATE TABLE bands (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE albums (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  release_year INT,
  band_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (band_id) REFERENCES bands(id)
);

create table songs(
	id int not null auto_increment,
    name varchar(255) not null,
    length float not null,
    album_id int not null,
    primary key(id),
    foreign key(album_id) references albums(id)
);

select name from bands;
select * from albums where release_year is not null order by release_year limit 1; 
select distinct(b.name) as "Band Name" from bands as b left join albums as a on b.id = a.band_id where a.name is not null;
select distinct(b.name) as "Band Name" from bands as b left join albums as a on b.id = a.band_id where a.name is null;

select a.name, a.release_year, sum(s.length) 
from albums as a join songs as s 
on a.id = s.album_id 
group by s.album_id
order by s.length desc
limit 1;

select a.name, a.release_year, sum(s.length) as "Duration" 
from albums as a join songs as s
on a.id = s.album_id
group by a.id order by Duration desc limit 1;

select release_year from albums;
update albums set release_year = 1986 where id = 4;
select release_year from albums;

select b.name as "Band Name", a.name as "Album Name", a.release_year from bands as b 
join albums as a on b.id = a.band_id
group by b.name;


delete from albums where band_id = 8;
select * from albums;
delete from bands where id = 8;
select * from bands;
select * from albums;


select a.name, a.release_year, max(s.length) as "Duration" from albums as a join songs as s 
on a.id = s.album_id
group by a.name;

select bands.name, count(songs.id) from bands
join albums on bands.id = albums.band_id
join songs on albums.id = songs.album_id
group by bands.id;















