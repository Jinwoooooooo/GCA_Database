#문제1. 모든 학생의 학생번호, 이름, 휴대폰, 학과번호, 학과명을 조회하시오. 
SELECT stdNo, stdName, stdHp, s.depNo, depName
FROM student AS s
JOIN department AS d
ON s.depNo = d.depNo; 

#문제2. 모든 교수의 교수번호, 이름, 휴대폰, 학과번호, 학과명을 조회하시오. 
SELECT proNo, proName, proHp, p.depNo, depName
FROM professor AS p
JOIN department AS d
ON p.depNo = d.depNo;

#문제3. 모든 강좌의 강좌번호, 강좌명, 담당교수명, 휴대폰을 조회하시오. 
SELECT lecNo, lecName, proName, proHp
FROM lecture AS l
JOIN professor AS p
ON l.proNo = p.proNo;

#문제4. 모든 강좌의 강좌번호, 강좌명, 담당교수 번호, 담당교수명, 휴대폰, 학과번호, 학과명을 조회하시오. 
SELECT lecNo, lecName, l.proNo, proName, proHp, d.depNo, depName
FROM lecture AS l
JOIN professor AS p
ON l.proNo = p.proNo
JOIN department AS d
ON p.depNo = d.depNo;

#문제5. 모든 수강 내역에서 학생번호, 학생명, 강좌번호, 강좌명, 교수번호, 교수명을 조회하시오. 
SELECT r.stdNo, stdName, r.lecNo, lecName, r.proNo, proName
FROM register AS r
JOIN student AS s
ON r.stdNo = s.stdNo
JOIN lecture AS l
ON r.lecNo = l.lecNo
JOIN professor AS p
ON r.proNo = p.proNo;

#문제6. 수강 테이블에 출석점수, 중간고사점수, 기말고사 점수를 임의로 입력하시오.(1~100 사이)
UPDATE register
SET regAttenScore = FLOOR(RAND() * 100) + 1, 
    regMidScore = FLOOR(RAND() * 100) + 1, 
    regFinalScore = FLOOR(RAND() * 100) + 1;

#문제7. 수강 테이블에 출석점수, 중간고사점수, 기말고사 점수를 모두 더한 평균을 구해 총점에 입력하시오. 
UPDATE register
SET regTotal = (regAttenScore + regMidScore + regFinalScore) / 3;

#문제8. 수강 테이블에 총점을 기준으로 A ~ F 등급을 입력하시오.
UPDATE register
SET regGrade = CASE
    WHEN regTotal >= 70 THEN 'A'
    WHEN regTotal >= 60 THEN 'B'
    WHEN regTotal >= 50 THEN 'C'
    WHEN regTotal >= 40 THEN 'D'
    ELSE 'F'
END;

#문제9. 수강 테이블에서 총점이 가장 큰 점수를 조회하시오. 
SELECT regTotal
FROM register
ORDER BY regTotal DESC
LIMIT 1;

#문제10. 수강 테이블에서 정우성 학생의 총점의 평균을 조회하시오.
SELECT AVG(regTotal)
FROM register AS r
JOIN student AS s
ON r.stdNo = s.stdNo
WHERE stdName = '정우성'
GROUP BY s.stdNo;