CREATE DATABASE study CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;  

CREATE USER JUNHWA@localhost IDENTIFIED BY "wnsghk164*";

GRANT ALL PRIVILEGES ON study.* TO JUNHWA@localhost; 

SHOW GRANTS FOR JUNHWA@localhost;

SELECT GRANTEE, PRIVILEGE_TYPE, IS_GRANTABLE FROM INFORMATION_SCHEMA.USER_PRIVILEGES;

CREATE TABLE Person(
    PersonID int,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(255)
);

CREATE TABLE Person(
    PersonID int NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(255),
    PRIMARY KEY(PersonID)
);

INSERT INTO Person(FirstName, LastName, Address, City) 
        VALUES ("JUNHWA", "JEONG", "KOREA", "SEOUL");

ALTER TABLE Person ADD Email VARCHAR(255);


실습1
테이블명: Students
StudentID - 학번 (빈값 허용안함, 자동증가)
Name - 이름
Age - 나이
Address - 주소

CREATE TABLE Students(
    StudentID int NOT NULL AUTO_INCREMENT,
    Name VARCHAR(255),
    Age VARCHAR(255),
    Address VARCHAR(255),
    PRIMARY KEY(StudentID)
); 

# 강사님 풀이

CREATE TABLE Students (
    StudentID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(32),
    Age INT,
    Address VARCHAR(255),
    PRIMARY KEY(StudentID)
);

실습2
테이블명: Grades
StudentID - 학번
Math - 수학점수
English - 영어점수
Science - 과학점수

CREATE TABLE Grades(
    StudentID int,
    Math VARCHAR(255),
    English VARCHAR(255),
    Science VARCHAR(255)
);

# 강사님 풀이

CREATE TABLE Grades (
    StudentID INT,
    Math INT,
    English INT,
    Science INT
);

INSERT INTO Students (Name, Age, Address) 
    VALUES ("정준화", 27, "서울");

UPDATE Students SET Age=25 WHERE StudentID=1;

DELETE FROM Students WHERE Age=25; 

실습
Q. 각 테이블에 데이터를 입력해주세요.
   테이블명: Students
   Name: 홍길동, Age: 30, Address: 인천
   Name: 이연걸, Age: 60, Address: 서울
   Name: 이몽룡, Age: 42, Address: 대전
   Name: 성춘향, Age: 27, Address: 경기

   테이블명: Grades
   StudentID: 홍길동의 StudentID(숫자), Math: 90, English: 80, Science: 50
   StudentID: 이연걸의 StudentID(숫자), Math: 69, English: 76, Science: 65
   StudentID: 이몽룡의 StudentID(숫자), Math: 98, English: 87, Science: 97
   StudentID: 성춘향의 StudentID(숫자), Math: 87, English: 67, Science: 79

-- Students
INSERT INTO Students (Name, Age, Address)
    VALUES ("홍길동", 30, "인천");
INSERT INTO Students (Name, Age, Address)
    VALUES ("이연결", 60, "서울");
INSERT INTO Students (Name, Age, Address)
    VALUES ("이몽룡", 42, "대전");
INSERT INTO Students (Name, Age, Address)
    VALUES ("성춘향", 27, "경기");    

-- Grades
INSERT INTO Grades (StudentID, Math, English, Science)
    VALUES (1, 90, 80, 50);
INSERT INTO Grades (StudentID, Math, English, Science)
    VALUES (2, 69, 76, 65);
INSERT INTO Grades (StudentID, Math, English, Science)
    VALUES (3, 98, 87, 95);
INSERT INTO Grades (StudentID, Math, English, Science)
    VALUES (4, 87, 67, 79);

UPDATE Grades SET Science = 97 WHERE StudentID=3; 

INSERT INTO Grades (StudentID, Math, English, Science)
    VALUES (3, 99, 89, 92);

UPDATE Grades SET English = 91 WHERE StudentID=3 AND English=89; 


-- SELECT 실습

-- Q. 고객(Customer) 의 이름과 국가를 조회
SELECT CustomerName, Country FROM Customers;

-- Q. 고객(Customer) 의 정보 전체 조회
SELECT * FROM Customers;

-- Q. 고객(Customer) 의 국가(Country) 목록 조회 (중복 x)
SELECT DISTINCT Country FROM Customers;

-- Q. 국가(Country) 가 France 인 고객(Customer) 조회
SELECT *
FROM Customers
WHERE Country="France";

-- 고객(Customers) 테이블에서
-- Q. 이름(ContactName) 이 ‘Mar’로 시작하는 직원 조회

SELECT *
FROM Customers
WHERE ContactName LIKE "Mar%"; 

-- 고객(Customers) 테이블에서
-- Q. 이름(ContactName) 이 ‘et’로 끝나는 직원 조회

SELECT *
FROM Customers
WHERE ContactName LIKE "%et"; 

-- Q. 국가(Country)가 France이고 이름(ContactName)이
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
-- 처음과 끝 값 모두 포함


-- Q. 우편번호(PostalCode)가 NULL인 고객(Customers) 조회

SELECT *
FROM Customers
WHERE PostalCode IS NULL;

-- 문제에서 NULL 값이 아니라 "" 으로 채워넣어서 안 나옴.

UPDATE Customers SET PostalCode=NULL WHERE PostalCode="";
-- NULL 값을 ""(공백) 으로 바꿔줌.

SELECT *
FROM Customers
WHERE PostalCode IS NULL;
-- 다시 해주면 ""(공백) 값이 NULL 값으로 바뀐 것들이 나옴.


-- Q. 우편번호(PostalCode)가 NULL이 아닌 고객 (Customers) 조회

SELECT *
FROM Customers
WHERE PostalCode IS NOT NULL; 


-- Q. 고객이름(CustomerName) 오름차순 조회

SELECT CustomerName
FROM Customers
ORDER BY CustomerName ASC;

SELECT CustomerName
FROM Customers
WHERE CustomerName LIKE "R%"
ORDER BY CustomerName ASC;
-- WHERE 조건문 쓸려면 순서가 ORDER BY 앞에 무조건 와야 됨.


-- Q. 상품가격(Price) 내림차순 조회

SELECT Price
FROM Products
ORDER BY Price DESC;


-- Q. 10명만 조회

SELECT *
FROM Customers
LIMIT 10;

-- Q. 그 다음 10명 조회

SELECT *
FROM Customers
LIMIT 10 OFFSET 10;


-- Q. 상품가격(Price)이 30 미만이면 ‘저‘, 30~50이면 ‘중‘,
--     50 초과는 ‘고’로 조회

SELECT Price,
CASE 
    WHEN Price < 30 THEN "저"
    WHEN Price BETWEEN 30 AND 50 THEN "중"
    ELSE "고"
END
FROM Products;


-- Q. 위 조회한 CASE의 이름을 ‘Level’으로 바꿔주세요

SELECT Price,
CASE
    WHEN Price < 30 THEN "저"
    WHEN Price BETWEEN 30 AND 50 THEN "중"
    ELSE "고"
END AS "Level"
FROM Products;


SELECT Price,
CASE
    WHEN Price < 30 THEN "저"
    WHEN Price BETWEEN 30 AND 50 THEN "중"
    ELSE "고"
END AS "Level"
FROM Products
WHERE Level="저";


-- Q. 국가(Country)가 France에 사는
-- 고객(Customers)수 조회

SELECT COUNT(*)
FROM Customers
WHERE Country='France';


SELECT COUNT(*) AS FranceCustomers
FROM Customers
WHERE Country='France';


-- Q. 전체 상품(Products)의 평균 가격(Price) 계산

SELECT AVG(Price) 
FROM Products;


SELECT AVG(Price) AS MeanPrice
FROM Products;


-- Q. 주문상품 수량(Quantity) 합계 계산

SELECT SUM(Quantity) AS TotalQuantity
FROM OrderDetails;


SELECT SUM(Quantity) AS TotalQuantity
FROM OrderDetails
WHERE OrderID=10248;


--  Q. 가격(Price) 최소값 조회

SELECT MIN(Price)
FROM Products;

-- Q. 가격(Price) 최대값 조회

SELECT MAX(Price)
FROM Products;


-- Q. 국가(Country)별 고객수 조회 (고객수 기준 오름차순)

SELECT Country, COUNT(*) 
FROM Customers
GROUP BY Country
ORDER BY COUNT(*) ASC;


SELECT Country, COUNT(*) AS Customer 
FROM Customers
GROUP BY Country
ORDER BY Customer ASC;


-- Q. 국가(Country)별, 도시(City)별 고객수 조회 (고객수 기준 내림차순)

SELECT Country, City, COUNT(*) AS Customer
FROM Customers
GROUP BY Country, City
ORDER BY Customer DESC;


-- Q. 국가(Country)별 고객수를 조회하고 그 중 5명 초과인
-- 국가만 조회 (고객수 기준 내림차순)

SELECT Country, COUNT(*) AS Customer
FROM Customers
GROUP BY Country
HAVING Customer > 5
ORDER BY Customer DESC;


-- Q. 영국에 사는 고객 중, City 가 London 인 고객의 이름과 주소 조회

SELECT CustomerName, Address
FROM(
    SELECT CustomerName, Address, City
    FROM Customers
    WHERE Country="UK"
)
WHERE City="London";


-- Q. 주문상세와 전체 Quantity 를 조회

SELECT *, (
    SELECT SUM(Quantity)
    FROM OrderDetails
) AS TotalQuantity
FROM OrderDetails; 


-- 실습

-- Q. 직원(Employees)중 이름(LastName)이 ‘King’인 직원의 이름과 
-- 생일(BirthDate)과 노트(Notes)를 조회해주세요.

SELECT LastName, BirthDate, Notes
FROM Employees
WHERE LastName="King";


-- Q. 상품(Products)중 상품명(ProductName)이 ‘C’로 시작하고 가격(Price)이
--  20보다 큰 상품의 상품명과 가격을 가격이 비싼순으로 조회해주세요.

SELECT ProductName, Price
FROM Products
WHERE ProductName LIKE "C%" AND Price > 20
ORDER BY Price DESC;

-- 서브 쿼리 쓴 강사님 풀이
SELECT ProductName, Price
FROM ( 
    SELECT ProductName, Price
    FROM Products
    WHERE ProductName LIKE "C%"
) 
WHERE Price > 20
ORDER BY Price DESC;

-- Q. 상품(Products)의 카테고리아이디(CategoryID) 별로 상품가격의 합,
--  가장 비싼 상품 가격, 가장 저렴한 상품 가격을 구하세요.

SELECT SUM(Price), MAX(Price), MIN(Price)
FROM Products 
GROUP BY CategoryID;

SELECT SUM(Price) AS SumPrice, MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice
FROM Products 
GROUP BY CategoryID;



-- Q. 상품(Products)의 카테고리아이디(CategoryID) 별로 상품개수와 
--  상품개수가 10개가 넘을경우 많음 아니면 적음이 표시되어있는 
--  칼럼을 하나 추가하고 상품수가 많은 순서대로 조회해주세요

-- 실패 풀이
SELECT CategoryID, COUNT(*)
FROM Products 
GROUP BY CategoryID
ORDER BY COUNT(*) DESC
SELECT CategoryID, COUNT(*),
CASE
    WHEN COUNT(*) >= 10 THEN "많음"
    ELSE "적음"
END AS "Product_Quantity"
FROM Products;

-- 실패 풀이
SELECT CategoryID, COUNT(*)
FROM Products 
GROUP BY CategoryID
CASE
    WHEN COUNT(*) THEN "많음"
    ELSE "적음"
END 
FROM Products;

-- 내 최종 풀이 
SELECT CategoryID, COUNT(*) AS ProductCount,
    CASE
        WHEN COUNT(*) > 10 THEN "많음"
        ELSE "적음"
    END AS "10개 기준"
FROM Products 
GROUP BY CategoryID
ORDER BY ProductCount DESC;

-- 서브 쿼리 이용한 풀이 
SELECT CategoryID, NumProduct,
CASE
    WHEN NumProduct > 10 THEN "많음"
    ELSE "적음"
END AS 'Level'
FROM (
    SELECT CategoryID, COUNT(*) AS NumProduct
    FROM Products 
    GROUP BY CategoryID
)
ORDER BY NumProduct DESC;  


-- Q. 고객(Customers)의 국가(Country)별 고객수와
--   백분위 (국가별고객수 / 전체고객수 * 100)을 구하세요

-- 내 풀이 실패
SELECT Country, COUNT(*), COUNT(*)/COUNT(*) * 100
FROM Customers
GROUP BY Country;

-- 내 풀이 실패
SELECT Country, COUNT(*) AS CustomerCount, 
    (COUNT(*) / (SELECT COUNT(*) FROM Customers) * 100) AS Percentage
FROM Customers
GROUP BY Country; 

-- 강사님 풀이 
SELECT Country, NumCustomer, TotalCustomer, NumCustomer*100/TotalCustomer AS Percentile
FROM (
    SELECT Country, COUNT(*) AS NumCustomer, (SELECT COUNT(*) FROM Customers) AS TotalCustomer
    FROM Customers
    GROUP BY Country 
);
-- NumCustomer -> INT
-- TotalCustomer -> INT


-- 2023-07-11 

-- cmd에서 실행함.

--Students, Grades
-- INNER JOIN
SELECT *
FROM Students
INNER JOIN Grades 
ON Students.StudentID = Grades.StudentID; 

--성적이 없는 학생을 넣어봄.
INSERT INTO Students(Name, Age, Address) VALUES ("JASON", 36, "서울");

--LEFT JOIN
SELECT *
FROM Students
LEFT JOIN Grades 
ON Students.StudentID = Grades.StudentID; 

--RIGHT JOIN
SELECT *
FROM Students
RIGHT JOIN Grades 
ON Students.StudentID = Grades.StudentID; 

-- OUTER JOIN
SELECT *
FROM Students
LEFT OUTER JOIN Grades 
ON Students.StudentID = Grades.StudentID; 

SELECT *
FROM Students
RIGHT OUTER JOIN Grades 
ON Students.StudentID = Grades.StudentID; 
-- MySQL 에선 FULL OUTER JOIN이 없어서 안 됨.

-- 학생 테이블에 없는 값을 성적테이블에 넣음.
INSERT INTO Grades(StudentID, Math, English, Science) VALUES (8, 86, 43, 72);

--실습 
-- https://www.w3schools.com/sql/trysql.asp?filename=trysql_asc 에서 함.
-- Q. 주문이력이 있는 고객명(CustomerName)과 주문일(OrderDate)를 조회해주세요

-- 1. 원하는 데이터가 어디에 있는지 확인
-- Orders, Customers

-- 2. 어떤 테이블을 기준으로 가져올지
-- INNER JOIN -> 테이블 자유롭게, LEFT JOIN, RIGHT JOIN -> 가져올 데이터 기준으로

-- 3. SQL 작성
SELECT Customers.CustomerName, Orders.OrderDate  
FROM Orders 
INNER JOIN Customers 
ON Orders.CustomerID=Customers.CustomerID; 

-- UNIQUE?
-- 안 됨.
SELECT DISTINCT Customers.CustomerName, Orders.OrderDate, Orders.OrderDate
FROM Orders 
INNER JOIN Customers 
ON Orders.CustomerID=Customers.CustomerID; 

--UNIQUE
SELECT Customers.CustomerID, Customers.CusotmerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID=Customers.CustomerID
GROUP BY Customers.CustomerID;

SELECT Customers.CustomerID, Customers.CustomerName, 
                    Orders.OrderDate
FROM Orders
FULL OUTER JOIN Customers
ON Orders.CustomerID=Customers.CustomerID
GROUP BY Customers.CustomerID;

-- 실습
-- Q. Tokyo에 위치한 공급자(Supplier)가 생산한 상품(Products) 목록 조회

SELECT Suppliers.City, Products.ProductName 
FROM Suppliers 
INNER JOIN Products
ON Suppliers.SupplierID=Products.SupplierID
WHERE Suppliers.City="Tokyo";

-- 강사님 풀이
-- Tokyo에 위치한 공급자 vs 공급자가 생산한 상품 목록 : 후자를 먼저 구하고 전자

-- 1. 공급자가 생산한 상품 목록
SELECT *
FROM Products 
LEFT JOIN Suppliers
ON Products.SupplierID=Suppliers.SupplierID;

-- 2. Tokyo 에 위치한 공급자 
SELECT *
FROM Products
LEFT JOIN Suppliers 
ON Products.SupplierID=Suppliers.SupplierID
WHERE Suppliers.City="Tokyo";

-- 상품 목록 조회
SELECT Products.*, Suppliers.SupplierName
FROM Products
LEFT JOIN Suppliers 
ON Products.SupplierID=Suppliers.SupplierID
WHERE Suppliers.City="Tokyo";


-- Q. 분류(CategoryName)가 Seafood인 상품명(ProductName) 조회

SELECT Categories.CategoryName, Products.ProductName
FROM Categories 
INNER JOIN Products 
ON Categories.CategoryID=Products.CategoryID
WHERE Categories.CategoryName="Seafood";  

-- 강사님 풀이 
-- 여기선 column 명이 동일하지 않아서 테이블.column명 안 하고 column 명만 해도 되는거
SELECT ProductName, CategoryName
FROM Products
INNER JOIN Categories
ON Products.CategoryID = Categories.CategoryID
WHERE CategoryName="Seafood";


-- Q. 공급자(Supplier)가 공급한 상품의 공급자 국가(Country), 카테고리별로 상품건수와 평균가격 조회

SELECT COUNT(*) AS NumProduct, AVG(Price)
FROM Products  
INNER JOIN Suppliers
ON Products.SupplierID=Suppliers.SupplierID
GROUP BY Suppliers.Country
INNER JOIN Categories  
ON Products.CategoryID=Categories.CategoryID
GROUP BY Categories.CategoryID;

-- 강사님 풀이 1
-- Multi Table Join
SELECT S.Country, C.CategoryName, COUNT(*) AS NumProduct, 
                                    AVG(P.Price) AS AvgPrice
FROM Products AS P
INNER JOIN Suppliers AS S
ON P.SupplierID = S.SupplierID
INNER JOIN Categories AS C
ON P.CategoryID = C.CategoryID
GROUP BY S.Country, C.CategoryID;

-- 강사님 풀이 2
-- JOIN 방법 
SELECT S.Country, C.CategoryName, COUNT(*) AS NumProduct, 
                                    AVG(P.Price) AS AvgPrice
FROM Products AS P, Suppliers AS S, Categories AS C
WHERE P.SupplierID=S.SupplierID AND P.CategoryID=C.CategoryID
GROUP BY S.Country, C.CategoryID;


-- Q. 주문별 주문자명(CustomerName), 직원명(LastName), 배송자명(ShipperName), 주문상세갯수

-- 내 풀이 
-- Customers.CustomerName, Employees.LastName, Shippers.ShipperName, OrderDetails.Quantity
SELECT Orders.OrderID, CustomerName, LastName, ShipperName, Quantity
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID=Customers.CustomerID
INNER JOIN Employees
ON Orders.EmployeeID=Employees.EmployeeID
INNER JOIN Shippers
ON Orders.ShipperID=Shippers.ShipperID
INNER JOIN OrderDetails   
ON Orders.OrderID=OrderDetails.OrderID
GROUP BY Orders.OrderID;

-- 강사님 풀이 1
SELECT O.OrderID, C.CustomerName, E.LastName, S.ShipperName, COUNT(OD.OrderDetailID)
FROM Orders as O
INNER JOIN Customers AS C
ON O.CustomerID=C.CustomerID
INNER JOIN Employees as E
ON O.EmployeeID=E.EmployeeID
INNER JOIN Shippers AS S
ON O.ShipperID=S.ShipperID
RIGHT JOIN OrderDetails AS OD
ON OD.OrderID=O.OrderID
GROUP BY O.OrderID;

-- 강사님 풀이 2
-- subQuery
SELECT OD.OrderDetailID, OI.OrderID, OI.CustomerName, OI.LastName, OI.ShipperName
FROM OrderDetails AS OD
LEFT JOIN (
    SELECT O.OrderID, C.CustomerName, E.LastName, S.ShipperName
    FROM Orders as O
    INNER JOIN Customers AS C
    ON O.CustomerID=C.CustomerID
    INNER JOIN Employees as E
    ON O.EmployeeID=E.EmployeeID
    INNER JOIN Shippers AS S
    ON O.ShipperID=S.ShipperID
) AS OI -- OrderInfo
ON OD.OrderID=OI.OrderID;



-- Q. 판매량(Quantity) 상위 TOP 3 공급자(supplier) 목록 조회

-- 내 풀이
-- 안 됨.
SELECT Products.ProductID, OrderDetails.Quantity, Supplier.SupplierName
FROM Products 
INNER JOIN  Suppliers 
ON Products.SupplierID=Suppliers.SupplierID LIMIT 3
INNER JOIN  OrderDetails 
ON Products.ProductID=OrderDetails.ProductID LIMIT 3;

-- 강사님 풀이 
SELECT S.*, SUM(Quantity) AS SumQuantity
FROM OrderDetails AS OD
    INNER JOIN Products AS P
    ON OD.ProductID=P.ProductID
    INNER JOIN Suppliers AS S
    ON P.SupplierID=S.SupplierID
GROUP BY S.SupplierID
ORDER BY SumQuantity DESC
LIMIT 3;


-- Q. 상품분류(Category)별, 고객지역별(City) 판매량 많은 순 정렬

-- 강사님 풀이
SELECT CA.CategoryName, C.City, SUM(OD.Quantity) AS SumQuantity
FROM OrderDetails AS OD
    INNER JOIN Orders AS O
    ON O.OrderID=OD.OrderID
    INNER JOIN Customers AS C
    ON O.CustomerID = C.CustomerID
    INNER JOIN Products AS P
    ON OD.ProductID=P.ProductID
    INNER JOIN Categories AS CA
    ON P.CategoryID=CA.CategoryID
GROUP BY CA.CategoryID, C.City
ORDER BY SumQuantity DESC;



-- Q. 고객국가(Country)가 USA이고, 상품별 판매량(Quantity)의 합이 많은순으로 정렬

SELECT P.ProductName, C.Country, SUM(OD.Quantity) AS Sum_Quantity 
FROM OrderDetails AS OD 
    INNER JOIN Products AS P 
    ON OD.ProductID=P.ProductID
    INNER JOIN Orders AS O 
    ON OD.OrderID = O.OrderID 
    INNER JOIN Customers AS C 
    ON O.CustomerID=C.CustomerID
WHERE C.COUNTRY="USA"
GROUP BY OD.ProductID
ORDER BY Sum_Quantity DESC;

-- 강사님 풀이
SELECT P.ProductName, SUM(OD.Quantity) AS SumQuantity
FROM OrderDetails AS OD
    INNER JOIN Orders AS O
    ON OD.OrderID = O.OrderID
    INNER JOIN Customers AS C
    ON O.CustomerID=C.CustomerID
    INNER JOIN Products as P
    ON OD.ProductID=P.ProductID
WHERE C.Country="USA"
GROUP BY P.ProductID
ORDER BY SumQuantity DESC;



-- CMD :  MYSQL -u JUNHWA -p   ,   여기는 CMD로 함.

ALTER TABLE Grades ADD CONSTRAINT fk_grade_student FOREIGN KEY(StudentID)
        REFERENCES Students(StudentID);

-- 밑에 이건 안 됨.  ->   Grades 테이블에 GradeID 가 없어서 안 됨.
-- ALTER TABLE Students ADD CONSTRAINT fk_student_grade FOREIGN KEY() 
--     REFERENCES Grades.GradeID 

ALTER TABLE Grades MODIFY COLUMN StudentID INT NOT NULL;



CREATE TABLE Grades (
    GradeID INT NOT NULL AUTO_INCREMENT,
    StudentID INT,
    Math INT,
    English INT,
    Science INT,
    PRIMARY KEY (GradeID)
);


INSERT INTO Grades (StudentID, Math, English, Science)
    VALUES (1, 90, 80, 50);
INSERT INTO Grades (StudentID, Math, English, Science)
    VALUES (2, 69, 76, 65);
INSERT INTO Grades (StudentID, Math, English, Science)
    VALUES (3, 98, 87, 95);
INSERT INTO Grades (StudentID, Math, English, Science)
    VALUES (4, 87, 67, 79);

DROP TABLE Users;

CREATE TABLE Users (
    ID INT NOT NULL AUTO_INCREMENT,
    UserName VARCHAR(32) UNIQUE,
    Password VARCHAR(64),
    PRIMARY KEY(ID)
);


CREATE INDEX idx_UserName ON Users(UserName);

INSERT INTO Users(UserName, Password) VALUES ("JunHwa", "1234");



-- Q. Tokyo에 위치한 공급자(Supplier)가 생산한 상품 목록에 대한 VIEW 생성

-- 내 풀이 실패
CREATE VIEW Made_in_Tokyo (Products.*, Suppliers.City)
AS
SELECT Products.*, Suppliers.City
FROM Products  
WHERE Suppliers.City="Tokyo";

-- 강사님 풀이
CREATE VIEW Tokyo_Product(ProductID, ProductName, SupplierName, Unit, Price)
AS 
SELECT ProductID, ProductName, SupplierName, Unit, Price
FROM Products AS P 
    INNER JOIN Suppliers AS S  
    ON P.SupplierID=S.SupplierID 
WHERE S.City="Tokyo"; 


-- Q. 분류(CategoryName)가 Seafood인 상품명(ProductName)에 대한 VIEW 생성

-- 내 풀이 실패
CREATE VIEW Product_view(Products.ProductName, Categories.CategoryName)
AS 
SELECT Products.ProductName, Categories.CategoryName
FROM Products 
WHERE Categories.CategoryName="Seafood";

-- 강사님 풀이
CREATE VIEW Seafood_Product(ProductName)
AS 
SELECT P.ProductName 
FROM Products AS P 
    INNER JOIN Categories AS C
    ON P.CategoryID=C.CategoryID 
WHERE C.CategoryName="Seafood"; 

