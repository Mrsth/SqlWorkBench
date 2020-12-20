create database test;
use test;

create table bands(
	id int not null auto_increment,
    name varchar(255) not null,
    primary key(id)
);

create table albums(
	id int not null auto_increment,
    name varchar(255) not null,
    release_year int,
    band_id int not null,
    primary key(id),
    foreign key(band_id) references bands(id)
);

insert into bands (name) values('Nepathya') ,('Karma') ,('Cobweb');
insert into bands (name) values('Metallica');
select * from bands;

insert into albums (name, release_year, band_id) 
	values ("In the end", 2010, 1),("Waiting for the end", 2011, 1),("A place for my head", "2012", 1),
		   ("Back in black", "1998",2),("TNT",2001,2),
		   ("Hail the king", "2015",3),
		   ("Taal ko pani", "2003",4),("Reshem","2004",4),("Bheda ko un","2010",4),
		   ("Kaha hola ghar bar","2007",5),
		   ("Mercedez Benz","1990",6),("Timro Maya","1991",6);
update albums set name = "Faint" where id = 3; 
update albums set release_year = null where id = 4;
update albums set release_year = null where id = 6; 
          
select * from albums;
select * from albums where release_year between 1990 and 1998;
select * from albums where release_year is null;           
delete from albums where band_id = 6; 
delete from albums where id = 3;        

select * from bands join albums on bands.id = albums.band_id; 
select * from albums right join bands on bands.id = albums.band_id;  
select avg(release_year) as "avg" from albums;
select * from albums; 
select band_id, count(band_id) from albums group by band_id;

select b.name as "Band Names", count(a.name) as "Number of Albums" 
from bands as b left join albums as a 
on b.id = a.band_id
group by b.name;

select * from bands;











