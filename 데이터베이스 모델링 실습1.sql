#문제1 
SELECT userName, prodName, cartProdCount
FROM cart AS c
JOIN user AS u
ON c.userId = u.userId
JOIN product AS p
ON c.prodNo = p.prodNo
WHERE c.cartProdCount >= 2;

#문제2
SELECT prodNo, cateName, prodName, prodPrice, sellerManager, sellerPhone
FROM product AS pd
JOIN category AS cg
ON pd.cateNo = cg.cateNo
JOIN seller AS s
ON pd.sellerNo = s.sellerNo;

#문제3
SELECT 
    u.userId, 
    u.userName, 
    u.userHp, 
    u.userPoint, 
    COALESCE(SUM(p.point), 0) AS `적립포인트 총합`
FROM user AS u
LEFT JOIN point AS p ON u.userId = p.userId
GROUP BY u.userId;


#문제4
SELECT o.orderNo, u.userId, u.userName, o.orderTotalPrice, o.orderDate
FROM user AS u
JOIN `order` AS o
ON u.userId = o.userId
JOIN orderitem AS oi
ON o.orderNo = oi.orderNo
WHERE o.orderTotalPrice >= 100000
order BY o.orderTotalPrice DESC, u.userName ASC;

#문제5
SELECT
	a.orderNo,
	ANY_VALUE(c.userId),
	ANY_VALUE(c.userName),
	GROUP_CONCAT(`prodName` SEPARATOR ',') AS `상품명`,
	ANY_VALUE(`orderDate`)
FROM `Order` AS a
JOIN `OrderItem` AS b ON a.orderNo = b.orderNo
JOIN `User` AS c ON a.userId = c.userId
JOIN `Product` AS d ON b.prodNo=d.prodNo
GROUP BY a.`orderNo`;

#문제6
SELECT 
	`prodNo`,
	`prodName`,
	`prodPrice`,
	`prodDiscount`,
	FLOOR(`prodPrice` * (1 - `prodDiscount` / 100)) AS `할인가`
FROM `Product` AS a;

#문제7
SELECT 
	a.prodNo,
	a.prodName,
	a.prodPrice,
	a.prodStock,
	b.sellerManager
FROM `Product` AS a
JOIN `Seller` AS b ON a.sellerNo=b.sellerNo
WHERE b.sellerManager='고소영';

#문제8
SELECT 
	a.sellerNo,
	a.sellerBizName,
	a.sellerManager,
	a.sellerPhone 
FROM `Seller` AS a
LEFT JOIN `Product` AS b ON a.sellerNo = b.sellerNo
WHERE `prodNo` IS NULL;

#문제9
SELECT 
	`orderNo`,
	sum(`할인가` * `itemCount`) as `최종총합`
FROM
(
	SELECT 
		*,
		FLOOR(`itemPrice` * (1 - `itemDiscount` / 100) * `itemCount`) AS `할인가`
	FROM `OrderItem`
) AS a
GROUP BY `orderNo`
HAVING `최종총합` >= 100000
ORDER BY `최종총합` DESC;

#문제10
SELECT 
	`userName`,
	GROUP_CONCAT(`prodName` SEPARATOR ',')
FROM `Order` AS a
JOIN `User` AS b ON a.userId=b.userId
JOIN `OrderItem` AS c ON a.orderNo=c.orderNo
JOIN `Product` AS d ON d.prodNo=c.prodNo
WHERE `userName` = '장보고';