create database WebMarketDB;


create table product(	
	p_id varchar(10) not null,
    p_name  varchar(30),
    p_unitPrice integer,
   p_description text,
   p_category varchar(20),
    p_manufacturer varchar(20),
   p_unitsInStock long,
   p_condition varchar(20),
  p_filename varchar(20),
    primary key (p_id)

)default charset=utf8;

drop table product;

select * from product;

insert into product values('P1234', 'iPhone 6s', 800000, '1334x750 Renina Hd display, 8-megapixel iSight Camera', 'Smart Phone', 'Apple', 1000, 'new', 'P1234.jpg');
insert into product values('P1235', 'Lg Pc gram', 1500000, '3.3-inch, IPS LED display, 5generation Intel Core Processors', 'NoteBook', 'Lg', 1000, 'new', 'P1235.jpg');
insert into product values('P1236', 'Galaxy Tab 5', 900000, '3.3-inch 212.8*125*6*6.*mm, Super AMOLED display, Octa-core processor', 'Tablet', 'Samsung', 1000, 'new', 'P1236.jpg');


set sql_safe_updates=0;



