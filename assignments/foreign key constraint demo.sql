use world;


CREATE TABLE categories (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cat_name varchar(255) not null,
    cat_description text
);

CREATE TABLE products 
(
	 prd_id int not null auto_increment primary key,
     prd_name varchar(355) not null,
	 cat_id int not null,
	 FOREIGN KEY fk_cat(cat_id)
	 REFERENCES categories(id)
);

ALTER TABLE categories AUTO_INCREMENT = 100;

INSERT INTO categories VALUES( 15, 'Electronics', 'Electronics' );

INSERT INTO categories( cat_name, cat_description ) VALUES('Furniture', 'Home furniture' );

SELECT * from categories;

INSERT INTO products VALUES ( 1, 'Sansung TV', 15 );

INSERT INTO products VALUES ( 2, 'Royal Oak Sofa', 101 );

SELECT * from products;

SET TRANSACTION READ WRITE;

INSERT INTO products VALUES ( 6, 'Radio', 15 );
INSERT INTO products VALUES ( 7, 'Galaxy Note', 15 );
DELETE FROM products WHERE prd_id=3;

COMMIT;

