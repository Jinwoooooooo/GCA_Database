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