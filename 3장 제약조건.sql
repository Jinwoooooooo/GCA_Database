#날짜 : 2025/01/07
#이름 : 정진우
#내용 : 3장 테이블 제약조건

#실습 3-1
use studydb;

create table user2 (
	uid varchar(10) primary key,
    name varchar(10),
    bitrh char(10),
    addr varchar(50)
);

#실습 3-2
insert into user2 values ('A101','김유신','1990-02-03','김해');
insert into user2 values ('A102','김춘추','1991-02-03','경주');
insert into user2 values ('A103','장보고','1992-02-03','완도');
select * from user2;

#실습 3-3
create table user3 (
	uid varchar(10) primary key,
    name varchar(10),
    bitrh char(10),
    hp char(13) unique,
    addr varchar(50)
);

insert into user3 values ('A101','김유신','1968-05-09','010-1234-1001','경남 김해시');
insert into user3 values ('A102','김춘추','1972-11-23','010-1234-1002','경남 경주시');
insert into user3 values ('A103','장보고','1978-03-01','010-1234-1003','전남 완도군');
insert into user3 values ('A104','강감찬','1979-08-16', null, '서울시 관악구');
insert into user3 values ('A105','이순신','1981-05-23', null, '부산시 진구');
select * from user3;

#실습 3-4
create table parent (
	pid varchar(10) primary key,
    name varchar(10),
    birth char(10),
    addr varchar(100)
);

insert into parent values ('P101','김유신','1968-05-09','경남 김해시');
insert into parent values ('P102','김춘추','1972-11-23','경남 경주시');
insert into parent values ('P103','장보고','1978-03-01','전남 완도시');
insert into parent values ('P104','강감찬','1978-08-16','서울시 관악구');
insert into parent values ('P105','이순신','1981-05-23','부산시 진구');


create table child (
	cid varchar(10) primary key,
    name varchar(10),
    hp char(13) unique,
    parent varchar(10),
    foreign key (parent) references parent (pid) 
);

insert into child values ('C101','김철수','010-1234-1001','P101');
insert into child values ('C102','김영희','010-1234-1002','P101');
insert into child values ('C103','강철수','010-1234-1003','P103');
insert into child values ('C104','이철수','010-1234-1004','P105');

select * from parent;
select * from child;

#실습 3-5
CREATE TABLE user4 (
	uid VARCHAR(10) PRIMARY KEY,
	name VARCHAR(10) NOT NULL,
	gender CHAR(1),
	age INT DEFAULT 1,
	hp CHAR(13) UNIQUE,
	addr VARCHAR(20)
);

insert into user4 values ('A101','김유신','M', 21, '010-1234-1001','김해');
insert into user4 values ('A102','김춘추','M', 20, '010-1234-1002','경주');
insert into user4 values ('A103','장보고','M', 31, '010-1234-1003','완도');
insert into user4 set
					uid = 'A104',
                    name = '신사임당',
                    gender = 'F',
                    addr = '강릉';
                    
select * from user4;

CREATE TABLE User5(
	seq INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(10) NOT NULL,
	gender CHAR(1) CHECK (gender IN ('M', 'F')),
	age INT DEFAULT 1 CHECK (age > 0 AND age < 100),
	addr VARCHAR(20)
);

#실습 3-6
insert into user5 set
					name = '김유신',
                    gender = 'M',
                    age = 25,
                    addr = '김해';
insert into user5 set
					name = '김춘추',
                    gender = 'M',
                    age = 24,
                    addr = '경주';
insert into user5 set
					name = '장보고',
                    gender = 'M',
                    age = 35,
                    addr = '완도';
insert into user5 set
					name = '허난설현',
                    gender = 'F',
                    age = 21,
                    addr = '광주';
insert into user5 set
					name = '신사임당',
                    gender = 'F',
                    age = 25,
                    addr = '강릉';

select * from user5;