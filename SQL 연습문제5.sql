#실습 5-1
CREATE DATABASE `BookStore`;
CREATE USER 'bookstore'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `BookStore`.* TO 'bookstore'@'%';
FLUSH PRIVILEGES;

#실습 5-2
use bookstore;

create table customer(
	custId int primary key auto_increment,
    name varchar(10) not null,
    address varchar(20) default null,
    phone varchar(13) default null
);

create table book(
	bookId int primary key,
    bookName varchar(20) not null,
    publisher varchar(20) not null,
    price int default null
);

create table `order`(
	orderId int primary key auto_increment,
    custId int not null,
    bookId int not null,
    salePrice int not null,
    orderDate date not null
);

#실습 5-3
insert into customer set name = '박지성', address = '영국 맨체스타', phone = '000-5000-0001';
insert into customer set name = '김연아', address = '대한민국 서울', phone = '000-6000-0001';
insert into customer set name = '장미란', address = '대한민국 강원도', phone = '000-7000-0001';
insert into customer set name = '추신수', address = '미국 클리블랜드', phone = '000-8000-0001';
insert into customer set name = '박세리', address = '대한민국 대전';

insert into book values(1, '축구의 역사', '굿스포츠', 7000);
insert into book values(2, '축구아는 여자', '나무수', 13000);
insert into book values(3, '축구의 이해', '대한미디어', 22000);
insert into book values(4, '골프 바이블', '대한미디어', 35000);
insert into book values(5, '피겨 교본', '굿스포츠', 8000);
insert into book values(6, '역도 단계별기술', '굿스포츠', 6000);
insert into book values(7, '야구의 추억', '이상미디어', 20000);
insert into book values(8, '야구를 부탁해', '이상미디어', 13000);
insert into book values(9, '올림픽 이야기', '삼성당', 7500);
insert into book values(10, 'Olympic Champions', 'Pearson', 13000);

insert into `order` set custId = 1, bookId = 1, saleprice = 6000, orderdate = '2014-07-01';
insert into `order` set custId = 1, bookId = 3, saleprice = 21000, orderdate = '2014-07-03';
insert into `order` set custId = 2, bookId = 5, saleprice = 8000, orderdate = '2014-07-03';
insert into `order` set custId = 3, bookId = 6, saleprice = 6000, orderdate = '2014-07-04';
insert into `order` set custId = 4, bookId = 7, saleprice = 20000, orderdate = '2014-07-05';
insert into `order` set custId = 1, bookId = 2, saleprice = 12000, orderdate = '2014-07-07';
insert into `order` set custId = 4, bookId = 8, saleprice = 13000, orderdate = '2014-07-07';
insert into `order` set custId = 3, bookId = 10, saleprice = 12000, orderdate = '2014-07-08';
insert into `order` set custId = 2, bookId = 10, saleprice = 7000, orderdate = '2014-07-09';
insert into `order` set custId = 3, bookId = 8, saleprice = 13000, orderdate = '2014-07-10';

#실습 5-4
select custId, name, address from customer;

#실습 5-5
select bookname, price from book;

#실습 5-6
select price, bookname from book;

#실습 5-7
select * from book;

#실습 5-8
select publisher from book;

#실습 5-9
select distinct publisher from book;

#실습 5-10
select * from book where price >= 20000;

#실습 5-11
select * from book where price < 20000;

#실습 5-12
select * from book where price >= 10000 and price <= 20000;

#실습 5-13
select bookId, bookname, price from book where price >= 15000 and price <= 30000;

#실습 5-14
select * from book where bookId = 2 or bookId = 3 or bookId = 5;
select * from book where bookId in (2, 3, 5);

#실습 5-15
select * from book where bookId % 2 = 0;
select * from book where mod(bookId, 2) = 0;

#실습 5-16
select * from customer where name like '박%';

#실습 5-17
select * from customer where address like '대한민국%';

#실습 5-18
select * from customer where phone is not null;

#실습 5-19
select * from book where publisher = '굿스포츠' or publisher = '대한미디어';
select * from book where publisher in ('굿스포츠', '대한미디어');

#실습 5-20
select publisher from book where bookname = '축구의 역사';

#실습 5-21
select publisher from book where bookname like '%축구%';

#실습 5-22
select * from book where bookname like '_구%';

#실습 5-23
select * from book where bookname like '%축구%' and price >= 20000;

#실습 5-24
select * from book order by bookname;

#실습 5-25
select * from book order by price, bookname asc;

#실습 5-26
select * from book order by price desc, publisher asc;

#실습 5-27
select * from book order by price desc limit 3;

#실습 5-28
select * from book order by price asc limit 3;

#실습 5-29
select sum(saleprice) as `총판매액` from `order`;

#실습 5-30
select 
	sum(saleprice) as `총판매액`,
    avg(saleprice) as `평균값`,
    min(saleprice) as `최저가`,
    max(saleprice) as `최고가`
from `order`;

#실습 5-31
select count(orderId) as `판매건수` from `order`;

#실습 5-32
update book set bookname = '농구' where bookname = '야구';
select 
	bookId,
    replace(bookName, '야구', '농구') as `bookName`,
    publisher,
    price
from book;

#실습 5-33
select custId, count(o.custId) as '수량'
from `order` o
join book b
on o.bookId = b.bookId
where o.saleprice >= 8000
group by o.custId
having 수량 = 2;

#실습 5-34
select * from customer c
join `order` o
on c.custId = o.custId;

#실습 5-35
select * from customer c
join `order` o
on c.custId = o.custId
order by c.custId;

#실습 5-36
select c.name, o.saleprice 
from customer c
join `order` o
on c.custId = o.custId;

#실습 5-37
select c.name, sum(o.saleprice) as '총판매액'
from customer c
join `order` o
on c.custId = o.custId
group by c.name
order by c.name;

#실습 5-38
select name, bookname
from customer c
join `order` o
on c.custId = o.custId
join book b
on o.bookId = b.bookId;

#실습 5-39
select name, bookname
from customer c
join `order` o
on c.custId = o.custId
join book b
on o.bookId = b.bookId
where b.price = 20000;

#실습 5-40
select name, saleprice
from customer c
left join `order` as b on c.custId = b.custId;

#실습 5-41
select c.name, sum(o.saleprice) as `총매출`
from customer c
join `order` o
on c.custId = o.custId
join book b
on o.bookId = b.bookId
where c.name = '김연아';

#실습 5-42
select bookname
from book
where price
order by price
desc limit 1;

select bookName from book where price = (select max(price) from book);

#실습 5-43
select * from customer as c
left join `order` as b on c.custId = b.custId
where `orderId` is null;

#실습 5-44
insert into book set bookId = 11, bookName = '스포츠의학', publisher = '한솔의학서적';
    
#실습 5-45
update customer set address = '대한민국 부산' where custId = 5;

#실습 5-46
delete from customer where custId = 5;

select * from customer; 


