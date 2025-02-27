#날짜 : 2025/02/27
#이름 : 정진우
#내용 : 8장 트랜잭션

#실습 8-1
START TRANSACTION; -- 작업시작
SELECT * FROM bank_account;
UPDATE bank_account SET 
								a_balance = a_balance - 10000
						  WHERE
						  		a_no = '101-11-1001';

UPDATE bank_account SET 
								a_balance = a_balance + 10000
						  WHERE
						  		a_no = '101-11-1003';
COMMIT; -- 작업 확정						  		
SELECT * FROM bank_account;

#실습 8-2
START TRANSACTION; -- 작업시작
UPDATE bank_account SET 
								a_balance = a_balance - 10000
						  WHERE
						  		a_no = '101-11-1001';

UPDATE bank_account SET 
								a_balance = a_balance + 10000
						  WHERE
						  		a_no = '101-11-1003';
SELECT * FROM bank_account;
ROLLBACK; -- 작업 취소
SELECT * FROM bank_account;

#실습 8-3
SELECT @@AUTOCOMMIT;
SET AUTOCOMMIT = 0;
UPDATE bank_account SET
								a_balance = a_balance - 10000
						  WHERE
						  		a_no = '101-11-1001';
SELECT * FROM bank_account;								  						  		

			  		