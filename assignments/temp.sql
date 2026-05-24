use world;

select * from city;

delete from city where id=2;

CREATE TABLE categories (
   cat_id int not null auto_increment primary key,
   cat_name varchar(255) not null,
   cat_description text
);

CREATE TABLE products (
   prd_id int not null auto_increment primary key,
   prd_name varchar(355) not null,
   cat_id int not null,
   FOREIGN KEY fk_cat(cat_id)
   REFERENCES categories(cat_id)
);
