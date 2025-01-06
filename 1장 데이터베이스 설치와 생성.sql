#날짜 : 2025/01/06
#이름 : 정진우
#내용 : 1장 데이터베이스 설치와 생성

#실습 1-1
create database `studydb`;
show databases;
drop database `studydb`;

#실습 1-2
create user 'jinwooya55'@'%' identified by '1234';
grant all privileges on studydb.* to 'jinwooya55'@'%';
flush privileges;

#실습 1-3
alter user 'jinwooya55'@'%' identified by '1234';
drop user 'jinwooya55'@'%';
flush privileges;

