CREATE TABLE Students(
    StudentID INT NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(50),
    Age INT,
    Address VARCHAR(255),
    PRIMARY KEY(StudentID)
);

CREATE TABLE Grades(
    StudentID INT,
    Math INT,
    English INT,
    Science INT 
);

INSERT INTO Students (Name, Age, Address)
    VALUES ("홍길동", 30, "인천");
INSERT INTO Students (Name, Age, Address)
    VALUES ("이연결", 60, "서울");
INSERT INTO Students (Name, Age, Address)
    VALUES ("이몽룡", 42, "대전");
INSERT INTO Students (Name, Age, Address)
    VALUES ("성춘향", 27, "경기");

INSERT INTO Grades (StudentID, Math, English, Science)
    VALUES (1, 90, 80, 50);
INSERT INTO Grades (StudentID, Math, English, Science)
    VALUES (2, 69, 76, 65);
INSERT INTO Grades (StudentID, Math, English, Science)
    VALUES (3, 98, 87, 95);
INSERT INTO Grades (StudentID, Math, English, Science)
    VALUES (4, 87, 67, 79);

UPDATE Grades SET Science=97 WHERE StudentID=3;

INSERT INTO Grades (StudentID, Math, English, Science)
    VALUES (3, 99, 89, 92);

UPDATE Grades SET English=91 WHERE StudentID=3 AND English=89;

-- Q. 고객(Customers)의 이름과 국가를 조회
SELECT CustomerName, Country
FROM Customers;

-- Q. 고객(Customers)의 정보 전체 조회
SELECT *
FROM Customers;

-- Q. 고객(Customers)의 국가(Country) 목록 조회 (중복 x)
SELECT DISTINCT Country
FROM Customers;

-- Q. 국가(Country)가 France인 고객(Customers) 조회
SELECT *
FROM Customers
WHERE Country="France";

-- 고객(Customers) 테이블에서
-- Q. 이름(ContactName) 이 ‘Mar’로 시작하는 직원 조회
SELECT *
FROM Customers
WHERE ContactName LIKE "Mar%";

-- Q. 이름(ContactName) 이 ‘et’로 끝나는 직원 조회
SELECT *
FROM Customers
WHERE ContactName LIKE "%et";

--Q. 국가(Country)가 France이고 이름(ContactName)이
-- ‘La’로 시작하는 고객(Customers) 조회
SELECT *
FROM Customers
WHERE Country="France" AND ContactName LIKE "La%";

-- Q. 국가(Country)가 France이거나 이름(ContactName)
-- 이 ‘La’로 시작하는 고객(Customers) 조회
SELECT *
FROM Customers
WHERE Country="France" OR ContactName LIKE "La%";

-- Q. 국가(Country)가 France가 아닌
-- 고객(Customers) 조회
SELECT *
FROM Customers
WHERE NOT Country="France";

-- Q. 국가(Country)가 France 혹은 Spain에 사는
-- 고객(Customers) 조회
SELECT *
FROM Customers 
WHERE Country IN ("France", "Spain");

-- Q. 가격(Price)이 15에서 20사이인 상품(Products) 조회
SELECT *
FROM Products 
WHERE Price BETWEEN 15 AND 20;

--Q. 우편번호(PostalCode)가 NULL인 고객(Customers) 조회
SELECT *
FROM Customers
WHERE PostalCode IS NULL;

UPDATE Customers SET PostalCode=NULL WHERE PostalCode="";

SELECT *
FROM Customers
WHERE PostalCode IS NULL;

--Q. 고객이름(CustomerName) 오름차순 조회
SELECT CustomerName
FROM Customers
ORDER BY CustomerName ASC;

SELECT CustomerName
FROM Customers
WHERE CustomerName LIKE "R%"
ORDER BY CustomerName ASC;

--Q. 상품가격(Price) 내림차순 조회
SELECT Price
FROM Products
ORDER BY Price DESC;

--Q. 10명만 조회
SELECT *
FROM Customers
LIMIT 10;

--Q. 그 다음 10명 조회
SELECT *
FROM Customers
LIMIT 10 OFFSET 10;

--Q. 상품가격(Price)이 30 미만이면 ‘저‘, 30~50이면 ‘중‘,
-- 50 초과는 ‘고’로 조회
SELECT *,
CASE
    WHEN Price < 30 THEN "저"
    WHEN Price < 50 THEN "중"
    ELSE "고"
END 
FROM Products;

SELECT *,
CASE
    WHEN Price < 30 THEN "저"
    WHEN Price BETWEEN 30 AND 50 THEN "중"
    ELSE "고"
END
FROM Products;

--Q. 위 조회한 CASE의 이름을 ‘Level’으로 바꿔주세요
SELECT *,
CASE 
    WHEN Price < 30 THEN "저"
    WHEN Price BETWEEN 30 AND 50 THEN "중"
    ELSE "고"
END AS "Level"
FROM Products;

SELECT *,
CASE 
    WHEN Price < 30 THEN "저"
    WHEN Price BETWEEN 30 AND 50 THEN "중"
    ELSE "고"
END AS "Level"
FROM Products
WHERE Level="저";

--Q. 국가(Country)가 France에 사는
--고객(Customers)수 조회
SELECT COUNT(*)
FROM Customers
WHERE Country="France";

--Q. 전체 상품(Products)의 평균 가격(Price) 계산
SELECT AVG(Price)
FROM Products;

SELECT AVG(Price) AS MeanPrice
FROM Products;

--Q. 주문상품 수량(Quantity) 합계 계산
SELECT SUM(Quantity) AS TotalQuantity
FROM OrderDetails;

SELECT SUM(Quantity) AS TotalQuantity
FROM OrderDetails
WHERE OrderID=10248;

--Q. 가격(Price) 최소값 조회
SELECT MIN(Price)
FROM Products;

--Q. 가격(Price) 최대값 조회
SELECT MAX(Price)
FROM Products;

--Q. 국가(Country)별 고객수 조회 (고객수 기준 오름차순)
SELECT Country, COUNT(*)
FROM Customers
GROUP BY Country 
ORDER BY COUNT(*) ASC;

SELECT Country, COUNT(*) AS CustomerCount
FROM Customers
GROUP BY Country 
ORDER BY CustomerCount ASC;

-- Q. 국가(Country)별, 도시(City)별 고객수 조회
 -- (고객수 기준 내림차순)
SELECT Country, City, COUNT(*) AS Customer
FROM Customers
GROUP BY Country, City
ORDER BY Customer DESC; 

-- Q. 국가(Country)별 고객수를 조회하고 그 중 5명 초과인
-- 국가만 조회 (고객수 기준 내림차순
SELECT Country, COUNT(*) AS Customer 
FROM Customers 
GROUP BY Country 
HAVING Customer > 5
ORDER BY Customer DESC;

-- Q. 영국에 사는 고객 중, 
-- City 가 London 인 고객의 이름과 주소 조회
SELECT CustomerName, Address
FROM (
    SELECT CustomerName, Address, City
    FROM Customers 
    WHERE Country="UK"
)
WHERE City="London";

--주문상세와 전체 Quantity 를 조회
SELECT *, (
    SELECT SUM(Quantity)
    FROM OrderDetails 
    ) AS TotalQuantity
FROM OrderDetails

-- Q. 고객(Customers)의 국가(Country)별 고객수와 백분위 
-- (국가별고객수 / 전체고객수 * 100)을 구하세요
SELECT Country, NumCustomer, (NumCustomer * 100 / TotalCustomer) AS Percentage
FROM (
    SELECT Country, COUNT(*) AS NumCustomer, 
            (SELECT COUNT(*) FROM Customers) AS TotalCustomer 
    FROM Customers 
    GROUP BY Customers.Country 
);

--Q. Tokyo에 위치한 공급자(Supplier)가 
--생산한 상품(Products) 목록 조회
SELECT *
FROM Products 
INNER JOIN Suppliers 
ON Products.SupplierID=Suppliers.SupplierID 
WHERE Suppliers.City="Tokyo";

SELECT Products.*, Suppliers.SupplierName
FROM Products 
INNER JOIN Suppliers 
ON Products.SupplierID=Suppliers.SupplierID 
WHERE Suppliers.City="Tokyo";

--Q. 주문이력이 있는 고객명(CustomerName)과 
-- 주문일(OrderDate)를 조회해주세요
SELECT Customers.CustomerName, Orders.OrderDate
FROM Customers  
INNER JOIN Orders 
ON Customers.CustomerID=Orders.CustomerID;

--Q. 분류(CategoryName)가 Seafood인 
--상품명(ProductName) 조회
SELECT Products.ProductName, Categories.CategoryName
FROM Products 
INNER JOIN Categories 
ON Products.CategoryID=Categories.CategoryID 
WHERE Categories.CategoryName="Seafood";

-- Q. 공급자(Supplier)가 공급한 상품의 공급자 국가(Country), 
--카테고리별로 상품건수와 평균가격 조회
SELECT C.CategoryName, S.Country, 
    COUNT(C.CategoryID) AS NumProduct, AVG(P.Price) AS AvgPrice
FROM Products AS P  
    INNER JOIN Suppliers AS S 
    ON P.SupplierID=S.SupplierID 
    INNER JOIN Categories AS C 
    ON P.CategoryID=C.CategoryID 
GROUP BY S.Country, C.CategoryID;

-- Q. 주문별 주문자명(CustomerName), 직원명(LastName), 
--배송자명(ShipperName), 주문상세갯수
SELECT C.CustomerName, E.LastName, S.ShipperName,
        OD.Quantity 
FROM Orders AS O  
    INNER JOIN Customers AS C  
    ON O.CustomerID=C.CustomerID 
    INNER JOIN Employees AS E  
    ON O.EmployeeID=E.EmployeeID 
    INNER JOIN Shippers AS S  
    ON O.ShipperID=S.ShipperID 
    INNER JOIN OrderDetails AS OD 
    ON O.OrderID=OD.OrderID 
GROUP BY O.OrderID;

-- Q. 판매량(Quantity) 
-- 상위 TOP 3 공급자(supplier) 목록 조회
SELECT S.*, SUM(OD.Quantity) AS SumQuantity 
FROM Products AS P 
     INNER JOIN OrderDetails AS OD 
     ON P.ProductID=OD.ProductID 
     INNER JOIN Suppliers AS S 
     ON P.SupplierID=S.SupplierID
GROUP BY S.SupplierID 
ORDER BY SumQuantity DESC
LIMIT 3;

-- Q. 상품분류(Category)별, 
-- 고객지역별(City) 판매량 많은 순 정렬
SELECT CA.CategoryName, C.City, SUM(OD.Quantity) AS SumQuantity
FROM OrderDetails AS OD 
    INNER JOIN Products AS P 
    ON OD.ProductID=P.ProductID 
    INNER JOIN Categories AS CA  
    ON P.CategoryID=CA.CategoryID 
    INNER JOIN Orders AS O 
    ON OD.OrderID=O.OrderID 
    INNER JOIN Customers AS C 
    ON O.CustomerID=C.CustomerID 
GROUP BY CA.CategoryID, C.City 
ORDER BY SumQuantity DESC;

--Q. 고객국가(Country)가 USA이고, 
--상품별 판매량(Quantity)의 합이 많은순으로 정렬
SELECT P.ProductName, SUM(OD.Quantity) AS SumQuantity
FROM OrderDetails AS OD 
    INNER JOIN Products AS P 
    ON OD.ProductID=P.ProductID 
    INNER JOIN Orders AS O 
    ON OD.OrderID=O.OrderID 
    INNER JOIN Customers AS C 
    ON O.CustomerID=C.CustomerID 
WHERE C.Country="USA"  
GROUP BY P.ProductID
ORDER BY SumQuantity DESC;

ALTER TABLE Grades ADD CONSTRAINT fk_grade_student FOREIGN KEY(StudentID)
        REFERENCES Students(StudentID);


-- Q. Tokyo에 위치한 공급자(Supplier)가 생산한 상품 목록에 대한 VIEW 생성

-- 내 풀이 실패
CREATE VIEW Made_in_Tokyo (Products.*, Suppliers.City)
AS
SELECT Products.*, Suppliers.City
FROM Products  
WHERE Suppliers.City="Tokyo";


-- Q. 분류(CategoryName)가 Seafood인 상품명(ProductName)에 대한 VIEW 생성

-- 내 풀이 실패
CREATE VIEW Product_view(Products.ProductName, Categories.CategoryName)
AS 
SELECT Products.ProductName, Categories.CategoryName
FROM Products 
WHERE Categories.CategoryName="Seafood";

