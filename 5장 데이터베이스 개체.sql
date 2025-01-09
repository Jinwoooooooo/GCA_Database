#날짜 : 2025/01/09
#이름 : 정진우
#내용 : 5장 데이터베이스 개체

#실습 5-1
show index from user1;
show index from user2;
show index from user3;

#실습 5-2
create index idx_user1_uid on user1 (uid);
analyze table user1;

#실습 5-3
drop index idx_user1_uid on user1;

#실습 5-4
create view vw_user1 as (select name, hp, age from user1);
create view vw_user4_age_under30 as (select * from user4 where age < 30);
create view vw_member_with_sales as (
	select
		a.uid as 직원아이디,
        b.name as 직원이름,
        b.pos as 직급,
        c.name as 부서명,
        a.year as 매출년도,
        a.month as 월,
        a.sale as 매출액
	from sales as a
    join member as b on a.uid = b.uid
    join department as c on b.dep = c.depNo
);

#실습 5-5
select * from vw_user1;
select * from vw_user4_age_under30;
select * from vw_member_with_sales;

#실습 5-6
drop view vw_user1;
drop view vw_user4_age_under30;
drop view vw_member_with_sales;

#실습 5-7
DELIMITER $$
	create procedure proc_test1()
    begin
		select * from member;
        select * from department;
	end $$
DELIMITER ;

call proc_test1();

#실습 5-8
DELIMITER $$
	create procedure proc_test2(in _userName varchar(10))
    begin
		select * from member where name = _userName;
	end $$
DELIMITER ;

call proc_test2('김유신');

DELIMITER $$
	create procedure proc_test3(in _pos varchar(10), in _dep tinyint)
    begin
		select * from member where pos = _pos and dep = _dep;
	end $$
DELIMITER ;

call proc_test3('차장', 101);

DELIMITER $$
	create procedure proc_test4(in _pos varchar(10), out _count int)
    begin
		select count(*) into _count from member where pos = _pos;
	end $$
DELIMITER ;

call proc_test4('대리', @_count);
select concat('_count : ', @_count);

#실습 5-9

DELIMITER $$
	create procedure proc_test5(in _name varchar(10))
    begin
		declare userId varchar(10);
        select uid into userId from member where name = _name;
        select * from sales where uid = userId;
	end $$
DELIMITER ;

call proc_test5('김유신');

DELIMITER $$
	create procedure proc_test6()
    begin
		declare num1 int;
        declare num2 int;
        
        set num1 = 1;
        set num2 = 2;
        
        if(num1 > num2) then
			select 'num1이 num2보다 크다.' as '결과1';
		else
			select 'num1이 num2보다 작다.' as '결과2';
		end if;
	end $$
DELIMITER ;

call proc_test6();

DELIMITER $$
	create procedure proc_test7()
    begin
		declare sum int;
        declare num int;
        
        set sum = 0;
        set num = 1;
        
        while (num <= 10) do
			set sum = sum + num;
            set num = num + 1;
		end while;
        
        select sum as '1부터 10까지 합계';
	end $$
DELIMITER ;

call proc_test7();

