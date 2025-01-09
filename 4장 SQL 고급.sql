#날짜 : 2025/01/08
#이름 : 정진우
#내용 : 4장 SQL 고급

#실습 4-1
use studydb;
create table member (
	uid varchar(10) primary key,
    name varchar(10) not null,
    hp char(13) unique not null,
    pos varchar(10) default '사원',
    dep int,
    rdate datetime not null
);
create table department (
	depno int primary key,
    name varchar(10) not null,
    tel char(12) not null
);
create table sales (
	seq int primary key auto_increment,
    uid varchar(10) not null,
    year year not null,
    month tinyint not null,
    sale int
);

select * from member;
select * from department;
select * from sales;


#실습 4-2
insert into member values ('A101','박혁거세','010-1234-1001','부장',101,NOW());
insert into member values ('A102','김유신','010-1234-1002','차장',101,NOW());
insert into member values ('A103','김춘추','010-1234-1003','사원',101,NOW());
insert into member values ('A104','장보고','010-1234-1004','대리',102,NOW());
insert into member values ('A105','강감찬','010-1234-1005','과장',102,NOW());
insert into member values ('A106','이성계','010-1234-1006','차장',103,NOW());
insert into member values ('A107','정철','010-1234-1007','차장',103,NOW());
insert into member values ('A108','이순신','010-1234-1008','부장',104,NOW());
insert into member values ('A109','허균','010-1234-1009','부장',104,NOW());
insert into member values ('A110','정약용','010-1234-1010','사원',105,NOW());
insert into member values ('A111','박지원','010-1234-1011','사원',105,NOW());

insert into department values(101,'영업1부','051-512-1001');
insert into department values(102,'영업2부','051-512-1002');
insert into department values(103,'영업3부','051-512-1003');
insert into department values(104,'영업4부','051-512-1004');
insert into department values(105,'영업5부','051-512-1005');
insert into department values(106,'영업지원부','051-512-1006');
insert into department values(107,'인사부','051-512-1007');

insert into sales set uid = 'A101', year = '2018', month = '1', sale = '98100';
insert into sales set uid = 'A102', year = '2018', month = '1', sale = '136000';
insert into sales set uid = 'A103', year = '2018', month = '1', sale = '80100';
insert into sales set uid = 'A104', year = '2018', month = '1', sale = '78000';
insert into sales set uid = 'A105', year = '2018', month = '1', sale = '93000';
insert into sales set uid = 'A101', year = '2018', month = '2', sale = '23500';
insert into sales set uid = 'A102', year = '2018', month = '2', sale = '126000';
insert into sales set uid = 'A103', year = '2018', month = '2', sale = '18500';
insert into sales set uid = 'A105', year = '2018', month = '2', sale = '19000';
insert into sales set uid = 'A106', year = '2018', month = '2', sale = '53000';
insert into sales set uid = 'A101', year = '2019', month = '1', sale = '24000';
insert into sales set uid = 'A102', year = '2019', month = '1', sale = '109000';
insert into sales set uid = 'A103', year = '2019', month = '1', sale = '101000';
insert into sales set uid = 'A104', year = '2019', month = '1', sale = '53500';
insert into sales set uid = 'A107', year = '2019', month = '1', sale = '24000';
insert into sales set uid = 'A102', year = '2019', month = '2', sale = '160000';
insert into sales set uid = 'A103', year = '2019', month = '2', sale = '101000';
insert into sales set uid = 'A104', year = '2019', month = '2', sale = '43000';
insert into sales set uid = 'A105', year = '2019', month = '2', sale = '24000';
insert into sales set uid = 'A106', year = '2019', month = '2', sale = '109000';
insert into sales set uid = 'A102', year = '2020', month = '1', sale = '201000';
insert into sales set uid = 'A104', year = '2020', month = '1', sale = '63000';
insert into sales set uid = 'A105', year = '2020', month = '1', sale = '74000';
insert into sales set uid = 'A106', year = '2020', month = '1', sale = '122000';
insert into sales set uid = 'A107', year = '2020', month = '1', sale = '111000';
insert into sales set uid = 'A102', year = '2020', month = '2', sale = '120000';
insert into sales set uid = 'A103', year = '2020', month = '2', sale = '93000';
insert into sales set uid = 'A104', year = '2020', month = '2', sale = '84000';
insert into sales set uid = 'A105', year = '2020', month = '2', sale = '180000';
insert into sales set uid = 'A108', year = '2020', month = '2', sale = '76000';

#실습 4-3
SELECT * FROM `Member` WHERE `name`='김유신';
SELECT * FROM `Member` WHERE `pos`='차장' AND dep=101;
SELECT * FROM `Member` WHERE `pos`='차장' OR dep=101;
SELECT * FROM `Member` WHERE `name` != '김춘추';
SELECT * FROM `Member` WHERE `name` <> '김춘추';
SELECT * FROM `Member` WHERE `pos`='사원' OR `pos`='대리';
SELECT * FROM `Member` WHERE `pos` IN('사원', '대리');
SELECT * FROM `Member` WHERE `dep` IN(101, 102, 103);
SELECT * FROM `Member` WHERE `name` LIKE '%신';
SELECT * FROM `Member` WHERE `name` LIKE '김%';
SELECT * FROM `Member` WHERE `name` LIKE '김__';
SELECT * FROM `Member` WHERE `name` LIKE '_성_';
SELECT * FROM `Member` WHERE `name` LIKE '정_';
SELECT * FROM `Sales` WHERE `sale` > 50000;
SELECT * FROM `Sales` WHERE `sale` >= 50000 AND `sale` < 100000 AND `month`=1;
SELECT * FROM `Sales` WHERE `sale` BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `sale` NOT BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `year` IN(2020);
SELECT * FROM `Sales` WHERE `month` IN(1, 2);

#실습 4-4
SELECT * FROM `Sales` ORDER BY `sale`;
SELECT * FROM `Sales` ORDER BY `sale` ASC;
SELECT * FROM `Sales` ORDER BY `sale` DESC;
SELECT * FROM `Member` ORDER BY `name`;
SELECT * FROM `Member` ORDER BY `name` DESC;
SELECT * FROM `Member` ORDER BY `rdate` ASC;
SELECT * FROM `Sales` WHERE `sale` > 50000 ORDER BY `sale` DESC;
SELECT * FROM `Sales` WHERE `sale` > 50000 ORDER BY `year`, `month`, `sale` DESC;

#실습 4-5
SELECT * FROM Sales LIMIT 3;
SELECT * FROM Sales LIMIT 0, 3;
SELECT * FROM Sales LIMIT 1, 2;
SELECT * FROM Sales LIMIT 5, 3;
SELECT * FROM Sales ORDER BY `sale` DESC LIMIT 3, 5;
SELECT * FROM Sales WHERE `sale` < 50000 ORDER BY `sale` DESC LIMIT 3;
SELECT * FROM Sales WHERE `sale` > 50000 ORDER BY `year` DESC, `month`, `sale` DESC LIMIT 5;

#실습 4-6
select sum(sale) as 합계 from sales;
select avg(sale) as 평균  from sales;
select max(sale) as 최대값 from sales;
select min(sale) as 최소값 from sales;
select ceiling(1.2);
select ceiling(1.8);
select floor(1.2);
select floor(1.8);
select round(1.2);
select round(1.8);
select rand(); #0 ~ 1 사이의 실수
select ceiling(rand() * 10); #1 ~ 10 사이의 정수
select count(sale) as 갯수 from sales;
select count(*) as 갯수 from sales;

select left('HelloWorld', 5); #문자열 0부터 5까지 문자열
select right('HelloWorld', 5); #문자열 5부터 -1까지 문자열
select substring('HelloWorld', 6, 5);
select concat('Hello', 'World'); #문자열 결합
select concat(uid, name, hp) from member where uid = 'A108';

select curdate();
select curtime();
select now();
insert into member values('A112', '유관순', '010-1234-1012', '대리', 107, now());

#실습 4-7 2018년 1월 매출의 총합을 구하시오.
select sum(sale) as '2018년 1월 매출의 총합' from sales where year = 2018 and month = 1;

#실습 4-8 2019년 2월에 5만원 이상 매출에 대한 총합과 평균을 구하시오.
select sum(sale) as '2019년 2월에 5만원 이상 매출 총합' from sales where year = 2019 and month = 2 and sale >= 50000;
select avg(sale) as '2019년 2월에 5만원 이상 매출 평균' from sales where year = 2019 and month = 2 and sale >= 50000;

#실습 4-9 2020년 전체 매출 가운데 최저, 최고, 매출을 구하시오.
select min(sale) as '2020년 전체 최저 매출' from sales where year = 2020;
select max(sale) as '2020년 전체 최고 매출' from sales where year = 2020;

#실습 4-10
use studydb;
SET @@sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
select * from sales group by uid;
select * from sales group by year;
select * from sales group by uid, year;
select uid, count(*) as '건수' from sales group by uid;
select uid, sum(sale) as '합계' from sales group by uid;
select uid, avg(sale) as '평균' from sales group by uid;

select uid, year, sum(sale) as '합계' from sales group by uid, year;
select uid, year, sum(sale) as '합계' from sales group by uid, year order by year asc, 합계 desc;
select uid, year, sum(sale) as '합계' from sales where sale >= 50000 group by uid, year order by 합계 desc;

#실습 4-11
select uid, sum(sale) as '합계' 
from sales group by uid 
having 합계 >= 200000;

select uid, year, sum(sale) as '합계' 
from sales
where sale >= 100000 
group by uid, year 
having 합계 >= 200000 
order by 합계 desc;

#실습 4-12
create table sales2 like sales;
insert into sales2 select * from sales;
update sales2 set year = year + 3;

select * from sales union select * from sales2;
select * from sales where sale >= 100000
union
select * from sales2 where sale >= 100000;

select uid, year, sale from sales
union
select uid, year, sale from sales2;

select uid, year, sum(sale) as '합계'
from sales
group by uid, year
union
select uid, year, sum(sale) as '합계'
from sales2
group by uid, year
order by year asc, 합계 desc;

#실습 4-13
select * from sales inner join member on sales.uid = member.uid;
select * from member inner join department on member.dep = department.depNo;

select * from sales as a join member as b on a.uid = b.uid;
select * from member as a join department as b on a.dep = b.depNo;

select * from sales as a, member as b where a.uid = b.uid;
select * from member as a, department as b where a.dep = b.depNo;

select a.seq, a.uid, sale, name, pos from sales as a
join member as b on a.uid = b.uid;

select a.seq, a.uid, sale, name, pos from sales as a
join member as b using(uid);

select a.seq, a.uid, sale, name, pos from sales as a
join member as b on a.uid = b.uid
where sale >= 100000;

select a.seq, a.uid, b.name, b.pos, year, sum(sale) as 합계
from sales as a
join member as b on a.uid = b.uid
group by a.uid, a.year
having 합계 >= 100000
order by a.year asc, 합계 desc;

select * from sales as a
join member as b on a.uid = b.uid
join department as c on b.dep = c.depNo;

select a.seq, a.uid, a.sale, b.name, b.pos, c.name
from sales as a
join member as b on a.uid = b.uid
join department as c on b.dep = c.depNo;

select a.seq, a.uid, a.sale, b.name, b.pos, c.name
from sales as a
join member as b on a.uid = b.uid
join department as c on b.dep = c.depNo
where sale > 100000
order by sale desc;


#실습 4-14
select * 
from sales as a
left join member as b
on a.uid = b.uid;

select * 
from sales as a
right join member as b
on a.uid = b.uid;

select a.seq, a.uid, sale, name, pos
from sales as a
right join member as b 
using(uid);


#실습 4-15. 모든 직원의 아이디, 이름, 직급, 부서명을 조회하시오.
select uid, a.name, pos, b.name 
from member as a, department as b 
where a.dep = b.depNo;

#실습 4-16 '김유신' 직원의 2019년도 매출의 합을 조회하시오.
select name, sum(sale) as '2019년도 매출' 
from sales as a 
join member as b
on a.uid = b.uid
where name = '김유신' and year = 2019;

#실습 4-17 2019년 50,000이상 매출에 대해 직원별 매출의 합이 100,000원 이상인
#직원이름, 부서명, 직급, 년도, 매출 합을 조회하시오. 단, 매출 합이 큰 순서부터 정렬
select 
	b.name,
    c.name,
    pos,
    year,
    sum(sale) as 매출합
from sales as a
join member as b on a.uid = b.uid
join department as c on b.dep = c.depNo
where year = 2019 and sale >= 50000
group by a.uid
having 매출합 >= 100000
order by 매출합 desc;
