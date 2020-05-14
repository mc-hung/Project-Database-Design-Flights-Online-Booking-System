/*Create and Use Database*/
Create Database Database7;
USE Database7;

/*Table Credit_Card_INFO*/
CREATE TABLE dbo.Credit_Card_Info
 (
 Card_Number varchar(25) NOT NULL PRIMARY KEY,
 Name_On_Card varchar(40) NOT NULL,
 Expire_Date Date NOT NULL,
 CVC int NOT NULL,
 Billing_Address varchar(125) NOT NULL,
 Billing_State varchar(40) NOT NULL,
 Billing_City varchar(40) NOT NULL,
 Billing_Zipcode int NOT NULL,
 Billing_Country varchar(40) NOT NULL
 );

/*Table Promotion*/
 CREATE TABLE dbo.Promotion
(
Promo_ID INT IDENTITY NOT NULL Primary Key,
Promotion_Level VARCHAR(10) NOT NULL,
Promotion_Detail VARCHAR(50) NOT NULL
);
/*Fix a data type*/
ALTER TABLE Promotion
ALTER COLUMN Promotion_Level Decimal(3, 2);

/*Table Customers*/
CREATE TABLE dbo.Customers
 (
 CustID varchar(25) NOT NULL PRIMARY KEY ,
 Promo_ID int
	REFERENCES dbo.Promotion(Promo_ID),
 Cust_LastName varchar(40) NOT NULL,
 Cust_MiddleName varchar(40),
 Cust_FirstName varchar(40) NOT NULL,
 Cust_Gender varchar(10) NOT NULL,
 Cust_Address varchar(125) NOT NULL,
 Cust_State varchar(40) NOT NULL,
 Cust_City varchar(40) NOT NULL,
 Cust_Zipcode int NOT NULL,
 Cust_Country varchar(40) NOT NULL,
 Cust_DOB Date NOT NULL,
 Cust_Email nvarchar(255) NOT NULL,
 Cust_PhoneNo varchar(10) NOT NULL
 );
/*Rename CustID to Cust_ID*/

 /*Table Search_History*/
 CREATE TABLE dbo.Search_History
 (
 Search_ID varchar(25) NOT NULL PRIMARY KEY,
 CustID varchar(25) 
		REFERENCES dbo.Customers(CustID),
 Departure_Date Date NOT NULL,
 Flight_Class varchar(20) NOT NULL,
 Depart_Airport varchar(40) NOT NULL,
 Arrival_Airport varchar(40) NOT NULL
 );

 /*Table Customer_Cards*/
 CREATE TABLE dbo.Customer_Cards
(    
	CustID varchar(25) NOT NULL
		REFERENCES dbo.Customers(CustID),
	Card_Number varchar(25) NOT NULL 
		REFERENCES dbo.Credit_Card_Info(Card_Number)
);

/*Table Manager*/
CREATE TABLE dbo.Manager
(Mana_ID int NOT NULL PRIMARY KEY,
 Mana_LastName varchar(50) NOT NULL,
 Mana_MiddleName varchar(50),
 Mana_FirstName varchar(50) NOT NULL,
 Mana_DOB DATE NOT NULL,
 Mana_Gender varchar(10) NOT NULL,
 Mana_PhoneNo Varchar(30) NOT NUll,
 Mana_Email varchar(30) NOT NULL,
 Mana_Address varchar(40) NOt NULL,
 Mana_City varchar(20) NOT Null,
 Mana_State varchar(20) NOT Null,
 Mana_ZipCode int not NULL,
 Mana_Country varchar(20) NOT Null
);

/*Table Employee*/
CREATE TABLE dbo.Employee
 (
 Emp_ID int NOT NULL PRIMARY KEY ,
 Mana_ID int NOT NULL
 REFERENCES dbo.Manager(Mana_ID),
 Emp_LastName varchar(50) NOT NULL,
 Emp_MiddleName varchar(50),
 Emp_FirstName varchar(50) NOT NULL,
 Emp_DOB DATE NOT NULL,
 Emp_Gender varchar(10) NOT NULL,
 Emp_PhoneNo Varchar(30) NOT NUll,
 Emp_Email varchar(30) NOT NULL,
 Emp_Address varchar(40) NOt NULL,
 Emp_City varchar(20) NOT Null,
 Emp_State varchar(20) NOT Null,
 Emp_ZipCode int not NULL,
 Emp_Country varchar(20) NOT Null
 );

 /*Table Passenger*/
 CREATE TABLE dbo.Passenger
 (
 Pass_ID INT IDENTITY NOT NULL PRIMARY KEY,
 Pass_CertificateID VARCHAR(30) NOT NULL,
 Pass_LastName VARCHAR(40) NOT NULL,
 Pass_MiddleName VARCHAR(40),
 Pass_DOB DATE,
 Pass_Gender VARCHAR(6)
 );

 /*Table Airport*/
 CREATE TABLE Airport
(Airport_Code varchar(50) NOT NULL PRIMARY KEY,
 Airport_Name varchar(50) NOT NULL,
 Country varchar(50) NOT NULL,
 City varchar(50) NOT NULL
 );

 /*Table Airline*/
 CREATE TABLE Airline
(Airline_Code varchar(50) NOT NULL PRIMARY KEY,
 Airline_Name varchar(50) NOT NULL,
 Airline_Country varchar(50) NOT NULL
 );

 /*Table Flight*/
 CREATE TABLE Flight
(Flight_Number INT NOT NULL PRIMARY KEY,
 Airport_Code_Dep varchar(50) NOT NULL
	REFERENCES dbo.Airport(Airport_Code),
 Airport_Code_Arr varchar(50) NOT NULL
	REFERENCES dbo.Airport(Airport_Code),									
 Airline_Code varchar(50) NOT NULL
	REFERENCES dbo.Airline(Airline_Code),
 Aircraft_Type varchar(50) NOT NULL,
 Duration varchar(50) NOT NULL,
 Promo_ID int 
	REFERENCES dbo.Promotion(Promo_ID)
);

/*Table Order_INFO*/
CREATE TABLE dbo.Order_INFO
(Order_ID int not null PRIMARY KEY,
Cust_ID varchar(25) 
REFERENCES dbo.Customers(CustID),
Emp_ID int not null
REFERENCES dbo.Employee(Emp_ID),
Order_Date datetime not null,
Total_Cost money not null
);
/*We updated the Total_Cost as a computed column, Totalcost later */

/*Table Tickets_INFO*/
CREATE TABLE dbo.Tickets_INFO
(
Ticket_Number INT NOT NULL PRIMARY KEY,
Airport_Code VARCHAR(50) NOT NULL
	REFERENCES dbo.Airport(Airport_Code),
Airline_Code VARCHAR(50) NOT NULL
	REFERENCES dbo.Airline(Airline_Code),	
Flight_Number INT NOT NULL
	REFERENCES dbo.Flight(Flight_Number),	
Pass_ID INT NOT NULL
	REFERENCES dbo.Passenger(Pass_ID),
OrderID INT NOT NULL
	REFERENCES dbo.Order_INFO(Order_ID),
Ticket_Price MONEY NOT NULL,
Number_Of_Luggage INT NOT NULL,
Flight_Class VARCHAR(20) NOT NULL,
Departure_Date DATE NOT NULL,
Arrival_Date DATE NOT NULL
);

/*/*Insert Values*/*/

INSERT INTO dbo.Promotion
VALUES (1, '0% off');
INSERT INTO dbo.Promotion
VALUES (0.95, '5% off');
INSERT INTO dbo.Promotion
VALUES (0.9, '10% off');
INSERT INTO dbo.Promotion
VALUES (0.85, '15% off');
INSERT INTO dbo.Promotion
VALUES (0.8, '20% off');
INSERT INTO dbo.Promotion
VALUES (0.75, '25% off');
INSERT INTO dbo.Promotion
VALUES (0.7, '30% off');
INSERT INTO dbo.Promotion
VALUES (0.65, '35% off');
INSERT INTO dbo.Promotion
VALUES (0.6, '40% off');
INSERT INTO dbo.Promotion
VALUES (0.65, '45% off');

Select*
From dbo.Promotion;

INSERT INTO dbo.Credit_Card_Info
VALUES ('4783856474182549', 'MARY CHENG', '09/24/2025', 123, '6611 West Lake Pkwy', 'WA', 'Remond', 98052, 'US');
INSERT INTO dbo.Credit_Card_Info
VALUES ('4895920302051855', 'XINYE LI', '10/02/2027', 123, '1440 East Broadway Rd', 'AZ', 'Tempe', 85282, 'US');
INSERT INTO dbo.Credit_Card_Info
VALUES ('5380961346285704', 'DAVID RECHARDS', '08/09/2024', 045, '854 Lake Forest Street', 'CA', 'Chula Vista', 91911, 'US');
INSERT INTO dbo.Credit_Card_Info
VALUES ('2411509876305602', 'JUDY HUNG', '09/19/2021', 450, '1505 Pick Street', 'CO', 'Loveland', 80537, 'US');
INSERT INTO dbo.Credit_Card_Info
VALUES ('4956029499499365', 'MUZUKI KOTERA', '03/24/2020', 663, '3841270 Nishishinozaki Edogawa-ku', 'Tokyo', 'Tokyo', 1330055, 'JPN');
INSERT INTO dbo.Credit_Card_Info
VALUES ('4539994483488173', 'JIAMEI XU', '07/07/2020', 822, 'Yin Cheng Zhong Road No.168', 'Hubei', 'Wuhan', 441000, 'CHN');
INSERT INTO dbo.Credit_Card_Info
VALUES ('5410133395059043', 'REBECCA HARRISON', '04/18/2029', 739, 'TAMAULIPAS NO.30, CONDESA', 'Distrito Federal', ' Cuauhtémoc', 06140, 'MEX');
INSERT INTO dbo.Credit_Card_Info
VALUES ('4532076935310114', 'CLAIRE CAREY', '07/04/2023', 858, '4942 Levy Court', 'MA', 'Gloucester', 01930, 'US');
INSERT INTO dbo.Credit_Card_Info
VALUES ('4556831714987516', 'JEEHI PARK', '10/05/2024', 669, '96-6, Gacheon-dong', 'Daegu', 'Suseong-gu', 0000082, 'KOR');
INSERT INTO dbo.Credit_Card_Info
VALUES ('3408095916588543', 'ADRIAN HAMPHREY', '09/19/2021', 550, '904 Oxford Street', 'FL', 'Miami Beach', 33139, 'US');

SELECT*
FROM dbo.Credit_Card_Info;

INSERT INTO dbo.Airline
VALUES ('AS', 'Alaska Airlines', 'US');
INSERT INTO dbo.Airline
VALUES ('G4', 'Allegiant Air', 'US');
INSERT INTO dbo.Airline
VALUES ('AA', 'American Airlines', 'US');
INSERT INTO dbo.Airline
VALUES ('DL', 'Delta Air Lines', 'US');
INSERT INTO dbo.Airline
VALUES ('RV', 'Air Canada Rouge', 'CAN');
INSERT INTO dbo.Airline
VALUES ('ASA', 'Air Creebec', 'CAN');
INSERT INTO dbo.Airline
VALUES ('MU', 'China Eastern Airlines', 'CHN');
INSERT INTO dbo.Airline
VALUES ('CI', 'China Airlines', 'CHN');
INSERT INTO dbo.Airline
VALUES ('ANA', 'All Nippon Airways', 'JPN');
INSERT INTO dbo.Airline
VALUES ('KE', 'Korean Air', 'KOR');
INSERT INTO dbo.Airline
VALUES ('BA', 'British Airways', 'EN');
INSERT INTO dbo.Airline
VALUES ('G9', 'Air Arabia', 'ABA');
DELETE FROM dbo.Airline
Where Airline_Code = 'ASA';
INSERT INTO dbo.Airport
VALUES ('LAX', 'Los Angeles International Airport', 'US', 'Los Angeles');

SELECT*
FROM dbo.Airline;

INSERT INTO dbo.Airport
VALUES ('LAX', 'Los Angeles International Airport', 'US', 'Los Angeles');
INSERT INTO dbo.Airport
VALUES ('ORD', 'OHare International Airport', 'US', 'Chicago');
INSERT INTO dbo.Airport
VALUES ('SEA', 'Seattle–Tacoma International Airport', 'US', 'Seattle');
INSERT INTO dbo.Airport
VALUES ('PHX', 'Phoenix Sky Harbor International Airport', 'US', 'Phoenix');
INSERT INTO dbo.Airport
VALUES ('SLC', 'Salt Lake City International Airport', 'US', 'Salt Lake City');
INSERT INTO dbo.Airport
VALUES ('MIA', 'Miami International Airport', 'US', 'Miami');
INSERT INTO dbo.Airport
VALUES ('PHL', 'Philadelphia International Airport', 'US', 'Philadelphia');
INSERT INTO dbo.Airport
VALUES ('PEK', 'Beijing Capital International Airport', 'CHN', 'Beijing');
INSERT INTO dbo.Airport
VALUES ('PVG', 'Shanghai Pudong International Airport', 'CHN', 'Shanghai');
INSERT INTO dbo.Airport
VALUES ('CAN', 'Guangzhou Baiyun International Airport', 'CHN', 'Guangzhou');
INSERT INTO dbo.Airport
VALUES ('NRT', 'Narita International Airport', 'JPN', 'Tokyo');
INSERT INTO dbo.Airport
VALUES ('ICN', 'Incheon International Airport', 'KOR', 'Seoul');
INSERT INTO dbo.Airport
VALUES ('DXB', 'Dubai International Airport', 'UAE', 'Dubai');
INSERT INTO dbo.Airport
VALUES ('LHR', 'London Heathrow Airport', 'EN', 'London');

SELECT*
FROM dbo.Airport;

INSERT INTO dbo.Flight
VALUES ('869', 'SEA', 'PHX', 'AA', '32A', '3h43m', '14');
INSERT INTO dbo.Flight
VALUES ('823', 'SEA', 'PHX', 'AA', '32A', '3h43m', '11');
INSERT INTO dbo.Flight
VALUES ('323', 'LAX', 'PVG', 'MU', '717', '10h28m', '15');
INSERT INTO dbo.Flight
VALUES ('1010', 'LHR', 'ICN', 'BA', '737', '12h50m', '13');
INSERT INTO dbo.Flight
VALUES ('989', 'MIA', 'PHL', 'AA', '141', '4h59m', '16');
INSERT INTO dbo.Flight
VALUES ('333', 'SEA', 'PHX', 'AA', '32A', '3h43m', '13');
INSERT INTO dbo.Flight
VALUES ('259', 'NRT', 'LAX', 'ANA', '73G', '9h26m', '12');
INSERT INTO dbo.Flight
VALUES ('694', 'SEA', 'PHX', 'AA', '32A', '3h43m', '11');
INSERT INTO dbo.Flight
VALUES ('520', 'DXB', 'SEA', 'G9', '737', '15h', '17');
INSERT INTO dbo.Flight
VALUES ('636', 'ORD', 'CAN', 'AS', '142', '17h1m', '15');
INSERT INTO dbo.Flight
VALUES ('883', 'LHR', 'SEA', 'G4', '717', '11h', '16');

select*
from dbo.Flight;

INSERT INTO dbo.Manager
	VALUES(1, 'Wang', ' ', 'Sam', '1985/12/14', 'Male', '3920398493', 'sw001@manager.com', '9 Summerhouse Ave', 'Kaukauna', 'WI', '54130', 'US')
INSERT INTO dbo.Manager
	VALUES(2, 'Walker', '', 'Uma', '1983/02/28', 'Female', '3032981493', 'uw023@manager.com', '65 W. Jockey Hollow Dr', 'Madisonville', 'KY', '42431', 'US')
INSERT INTO dbo.Manager
	VALUES(3, 'Cheng', 'Ting', 'Lisa', '1990/01/23', 'Female', '2958809392', 'lc213@manager.com', '954 Shirley St', 'Glasgow', 'KY', '42141', 'US')
INSERT dbo.Manager
	VALUES(4, 'Skye', '', 'Amy', '1986/04/01', 'Female', '7782103284', 'as003@manager.com', '77 Shipley St', 'Fenton', 'MI', '48430', 'US')
INSERT dbo.Manager
	VALUES(5, 'Smith', '', 'Matt', '1983/12/28', 'Male', '4183843293', 'ms034@manager.com', '577 Old Bowman Dr', 'Sheboygan', 'WI', '53081', 'US')
INSERT dbo.Manager
	VALUES(6, 'Park', 'Joon', 'Jim', '1979/12/29', 'Male', '9902839103', 'jp042@manager.com', '118 Courtland St', 'Greensburg', 'PA', '15601', 'US')
INSERT dbo.Manager
	VALUES(7, 'Wring', 'Beth', 'Sarah', '1989/02/09', 'Female', '3493723994', 'sw030@manager.com', '66 Pacific Court', 'Hilliard', 'OH', '43026', 'US')
INSERT dbo.Manager
	VALUES(8, 'Chen', ' ', 'Jason', '1985/09/23', 'Male', '2063391923', 'jc011@manager.com', '120 Charles Dr', 'Bel Air', 'MD', '21014', 'US')
INSERT dbo.Manager
	VALUES(9, 'Hua', 'Jin', 'Peter', '1984/07/07', 'Male', '2043843392', 'ph001@manager.com', '758 Court Ln', 'Chelmsford', 'MA', '18240', 'US')
INSERT dbo.Manager
	VALUES(10, 'Lin', 'Faye', 'Joanna', '1991/02/06', 'Female', '2032061993', 'jl001@manager.com', '61 Middle River St', 'Kaukesha', 'WI', '53186', 'US')

SELECT*
FROM DBO.Manager;

INSERT INTO dbo.Customer_Cards
Values(1, '2411509876305602');
INSERT INTO dbo.Customer_Cards
Values(1, '4532076935310114');
INSERT INTO dbo.Customer_Cards
Values(2, '2411509876305602');
INSERT INTO dbo.Customer_Cards
Values(3, '4895920302051855');
INSERT INTO dbo.Customer_Cards
Values(6, '4783856474182549');
INSERT INTO dbo.Customer_Cards
Values(4, '4556831714987516');
INSERT INTO dbo.Customer_Cards
Values(8, '4956029499499365');
INSERT INTO dbo.Customer_Cards
Values(7, '5410133395059043');
INSERT INTO dbo.Customer_Cards
Values(8, '4783856474182549');
INSERT INTO dbo.Customer_Cards
Values(10, '5410133395059043');

SELECT*
FROM Customer_Cards;

INSERT dbo.Tickets_INFO
VALUES(01,'LAX', 'ANA', '259', '01', '01', '1500','2', 'Economy', '2019/11/15', '2019/11/15')
INSERT dbo.Tickets_INFO
VALUES(02,'PVG', 'MU', '323', '02', '02', '2000','2', 'Business', '2019/06/20', '2019/06/21')
INSERT dbo.Tickets_INFO
VALUES(03,'PHX', 'AA', '333', '03', '03', '2500','2', 'Business', '2018/04/03', '2018/04/04')
INSERT dbo.Tickets_INFO
VALUES(04,'SEA', 'G9', '520', '04', '04', '3000','1', 'Economy', '2018/09/06', '2018/09/06')
INSERT dbo.Tickets_INFO
VALUES(05,'CAN', 'AS', '636', '05', '05', '3500','1', 'Economy', '2017/10/24', '2017/10/24')
INSERT dbo.Tickets_INFO
VALUES(06,'PHX', 'AA', '694', '06', '06', '500','2', 'Economy', '2019/11/08', '2019/11/18')
INSERT dbo.Tickets_INFO
VALUES(07,'PHX', 'AA', '823', '07', '07', '400','1', 'Economy', '2019/11/07', '2019/11/17')
INSERT dbo.Tickets_INFO
VALUES(08,'PHX', 'AA', '869', '08', '08', '600','2', 'Economy', '2019/10/07', '2019/10/17')
INSERT dbo.Tickets_INFO
VALUES(09,'SEA', 'G4', '883', '09', '09', '400','1', 'Economy', '2019/10/08', '2019/10/25')
INSERT dbo.Tickets_INFO
VALUES(10,'PHL', 'G4', '883', '10', '10', '800','2', 'Economy', '2019/11/15', '2019/11/25')
INSERT dbo.Tickets_INFO
VALUES(11,'PHL', 'G4', '883', '1', '1', '5000','2', 'Business', '2019/11/15', '2019/11/30')
INSERT dbo.Tickets_INFO
VALUES(12,'PHL', 'G4', '883', '1', '1', '6000','2', 'Business', '2019/11/15', '2019/11/30')

select*
from dbo.Tickets_INFO;

INSERT dbo.Customers
	VALUES(01,'11','Chambers', '', 'Becky', 'Female', '924 N Piper St', 'Oswego', 'NY', '13126', 'USA', '1992/01/29', 'becky129@gmail.com', '3032229382')
INSERT dbo.Customers
	VALUES(02,'11','Fitzgerald', '', 'Gloria', 'Female', '183 Division Ave', 'North Augusta', 'SC', '29841', 'USA', '1980/09/28', 'GloriaF001@hotmail.com', '2930192834')
INSERT dbo.Customers
	VALUES(03,'11','Harris', '', 'Eileen', 'Female', '8090 Saxton St', 'Glenside', 'PA', '19038', 'USA', '1973/05/09', 'E_H7305@live.ca', '4160093843')
INSERT dbo.Customers
	VALUES(04,'11','Mcgee', 'Jane', 'Jacqueline', 'Female', '9660 West Acacia Ave', 'Boynton Beach', 'FL', '33435', 'USA', '1990/06/04', 'Jmc064@gmail.com', '4302293039')
INSERT dbo.Customers
	VALUES(05,'11','Hicks', '', 'Ann', 'Female', '933 East Wood Rd', 'Painesville', 'OH', '44077', 'USA', '1965/08/23', 'Ann_H65@yahoo.com', '5202938476')
INSERT dbo.Customers
	VALUES(06,'11','Bass', '', 'Myra', 'Male', '50 Marvon Ave', 'Philadelphia', 'PA', '19111', 'USA', '1987/05/04', 'Bass1342@gmail.com', '2038473049')
INSERT dbo.Customers
	VALUES(07,'11','Vasquez', '', 'Hugo', 'Male', '9038 Summit Ave', 'Middleton', 'WI', '53562', 'USA', '1988/06/15', 'HugoV88@gmail.com', '1029384432')
INSERT dbo.Customers
	VALUES(08,'11','Riley', '', 'Trevor', 'Male', '56 Elizabeth Ave', 'Flemington', 'NJ', '08822', 'USA', '1975/06/07', 'tr_12@gmail.com', '2043394832')
INSERT dbo.Customers
	VALUES(09,'11','Anderson', '', 'Shannon', 'Female', '8934 Annadale Rd', 'Baltimore', 'MD', '21206', 'USA', '1969/12/31', 'S_Anderson@hotmail.com', '2068324403')
INSERT dbo.Customers
	VALUES(10,'11','Black', '', 'Shan', 'Male', '169 Pearl Court', 'East Stroudsburg', 'PA', '18301', 'USA', '1991/04/25', 'ShanBlack@yahoo.com', '6504938840')

SELECT*
FROM DBO.Customers; 

INSERT Order_INFO
	VALUES(1, 1, 1, '2019/10/10')
INSERT Order_INFO
	VALUES(2, 1, 2, '2019/10/10')	
INSERT Order_INFO
	VALUES(3, 1, 3, '2019/10/12')	
INSERT Order_INFO
	VALUES(4, 2, 4, '2019/10/12')	
INSERT Order_INFO
	VALUES(5, 3, 5, '2019/10/15')	
INSERT Order_INFO
	VALUES(6, 5, 6, '2019/10/15')	
INSERT Order_INFO
	VALUES(7, 6, 7, '2019/10/16')	
INSERT Order_INFO
	VALUES(8, 7, 8, '2019/10/16')	
INSERT Order_INFO
	VALUES(9, 7, 9, '2019/10/17')	
INSERT Order_INFO
	VALUES(10, 10, 10, '2019/10/20')	
INSERT Order_INFO
	VALUES(11, 1, 1, '2019/10/21')

SELECT*
FROM dbo.Order_INFO; 

INSERT dbo.Employee
	VALUES(1, 1, 'Hung', 'Julie', 'Mei', '1995/01/01', 'Female', '7781231234', 'mh100@customerservice.com', '9681 Brewery Dr', 'Clover', 'SC', '29710', 'USA')
INSERT dbo.Employee
	VALUES(2, 2, 'Xu', '', 'Jia', '1996/02/01', 'Female', '6431235944', 'xu112@customerservice.com', '200 1st St', 'Seattle', 'WA', '98101', 'USA')
INSERT dbo.Employee
	VALUES(3, 3, 'Chaud', '', 'Jay', '1994/05/20', 'Male', '5321543285', 'jc123@customerservice.com', '9010 Lancaster Circle', 'West Haven', 'CT', '06516', 'USA')
INSERT dbo.Employee
	VALUES(4, 4, 'Gong', 'May', 'Tina', '1992/01/23', 'Female', '2341232212', 'tg234@customerservice.com', '63 W. Howard Ave', 'Ames', 'IA', '50010', 'USA')
INSERT dbo.Employee
	VALUES(5, 5, 'Han', '', 'Chen', '1989/03/15', 'Female', '6541284585', 'hc101@customerservice.com', '8160 West Tunnel St', 'Hackensack', 'NJ', '07601', 'USA')
INSERT dbo.Employee
	VALUES(6, 6, 'Ling', '', 'Joan', '1990/11/04', 'Male', '2531249374', 'jl029@customerservice.com', '465 Birchwood St', 'Kennewick', 'WA', '99337', 'USA')
INSERT dbo.Employee
	VALUES(7, 7, 'Lee', 'John', 'Amar', '1992/09/25', 'Male', '7431231742', 'la926@customerservice.com', '7291 Acacia Court', 'Grand Blanc', 'MI', '48439', 'USA')
INSERT dbo.Employee
	VALUES(8, 8, 'Zhu', '', 'Sammy', '1993/12/01', 'Female', '2032427653', 'sz434@customerservice.com', '81 Green Lake Ln', 'Lakeland', 'FL', '33801', 'USA')
INSERT dbo.Employee
	VALUES(9, 9, 'Kim', '', 'Ash', '1993/10/04', 'Male', '7241239475', 'ak832@customerservice.com', '787 Country Rd', 'Winona', 'MN', '55987', 'USA')
INSERT dbo.Employee
	VALUES(10, 10, 'Ragh', 'Jason', 'Swell', '1993/10/04', 'Male', '2061231234', 'sr123@customerservice.com', '88 Walt Whitman St', 'Sterling Heights', 'MI', '48310', 'USA')

SELECT*
FROM DBO.Employee;

INSERT dbo.Search_History
	VALUES(1, '1', '2019/02/23', 'Economy', 'NRT', 'LAX')
INSERT dbo.Search_History
	VALUES(2, '6', '2020/01/01', 'Economy', 'LAX', 'PVG')
INSERT dbo.Search_History
	VALUES(3, '9', '2019/09/13', 'Economy', 'SEA', 'PHX')
INSERT dbo.Search_History
	VALUES(4, '3', '2019/04/29', 'Business', 'SEA', 'PHX')
INSERT dbo.Search_History
	VALUES(5, '5', '2019/12/02', 'Economy', 'LHR', 'SEA')
INSERT dbo.Search_History
	VALUES(6, '8', '2019/11/23', 'Economy', 'ORD', 'CAN')
INSERT dbo.Search_History
	VALUES(7, '1', '2019/10/23', 'Economy', 'LHR', 'ICN')
INSERT dbo.Search_History
	VALUES(8, '9', '2019/08/29', 'Business', 'MIA', 'PHL')
INSERT dbo.Search_History
	VALUES(9, '10', '2019/09/08', 'Economy', 'SEA', 'PHX')
INSERT dbo.Search_History
	VALUES(10, '10', '2020/02/11', 'Business', 'ORD', 'CAN')

SELECT*
FROM dbo.Search_History;

INSERT dbo.Passenger
VALUES('123456789ABC','Kali','','1992/01/14','Female','Xu')
INSERT dbo.Passenger
VALUES('123456767ABC','Zoe','kk','1992/02/14','Male','Zhang')      
INSERT dbo.Passenger
VALUES('123786767ABC','PP','cc','1993/02/14','Male','Zhang')
INSERT dbo.Passenger
VALUES('123345767ABC','Teemo','kk','1995/05/14','Female','Han')
INSERT dbo.Passenger
VALUES('123453367DEF','Zyra','aa','1995/02/28','Male','Chen')
INSERT dbo.Passenger
VALUES('123996767ADF','Hanbing','bb','1994/06/13','Female','Cai')
INSERT dbo.Passenger
VALUES('323466767ABC','Yuyu','kk','1992/02/14','Female','Wang')
INSERT dbo.Passenger
VALUES('323453767ABC','Dian','','1995/07/23','Male','Shan')
INSERT dbo.Passenger
VALUES('423436769ABC','Will','kk','1992/03/15','Male','Smith')
INSERT dbo.Passenger
VALUES('123356367ABC','Mary','cc','1993/08/14','Female','Brown')

SELECT*
FROM DBO.Passenger;

/*Trigger to update the promotion for customers every time after they buy tickets*/
GO
CREATE TRIGGER TR_PromoStatus
ON dbo.Order_INFO
AFTER INSERT, UPDATE
AS
BEGIN
DECLARE @total_money INT;
DECLARE @custid varchar(50);
SET @custid = (SELECT Cust_ID FROM Inserted);
SELECT @total_money = SUM(TotalCost) 
FROM dbo.Order_INFO
WHERE Cust_ID = @custid
GROUP BY Cust_ID
UPDATE Customers
SET Promo_ID = 
CASE
WHEN @total_money BETWEEN 0 AND 10000 THEN 11
WHEN @total_money BETWEEN 10000 AND 50000 THEN 12
WHEN @total_money BETWEEN 50000 AND 100000 THEN 13
WHEN @total_money BETWEEN 100000 AND 150000 THEN 14
ELSE 15
END
WHERE Cust_ID = @custid
END

/*Test*/
INSERT dbo.Tickets_INFO
VALUES(11,'PHL', 'G4', '883', '1', '1', '5000','2', 'Business', '2019/11/15', '2019/11/30')
INSERT dbo.Tickets_INFO
VALUES(12,'PHL', 'G4', '883', '1', '1', '6000','2', 'Business', '2019/11/15', '2019/11/30')
INSERT dbo.Tickets_INFO
VALUES(13,'PHL', 'G4', '883', '2', '11', '5000','2', 'Business', '2019/11/15', '2019/11/30')
INSERT dbo.Tickets_INFO
VALUES(14,'PHL', 'G4', '883', '2', '2', '5000','2', 'Business', '2019/11/15', '2019/11/30')

SELECT*
FROM dbo.Customers;

/*Housekeeping*/
DROP TRIGGER TR_PromoStatus;

/*Table-level CHECK Constraints based on a function*/
/*If a credit card expires, it won't be allowed to enter into database*/
GO
CREATE FUNCTION dbo.creditcardcheck(@date date) 
RETURNS varchar(20)
	AS
    BEGIN
	DECLARE @expire_date date
	SELECT @expire_date = Credit_Card_Info.Expire_Date
	FROM Credit_Card_Info
	RETURN @expire_date
    END;

ALTER TABLE Credit_Card_Info
ADD CONSTRAINT validcard CHECK 
(dbo.creditcardcheck(Credit_Card_Info.Expire_Date)>convert(date, getdate(), 111));

/*Test*/
INSERT INTO Credit_Card_Info
	VALUES('9012347584931234', 'MEICHUN HUNG', '2018-12-31', '123', '123 Pike St', 'WA', 'Seattle', '90012', 'US')
/*Credit card expires, error*/

/*Housekeeping*/
DROP FUNCTION dbo.creditcardcheck;


/*Computed Columns based on a function*/
/*Calculate the total cost of a order based on the ticket price times promotion level*/
GO
CREATE FUNCTION dbo.cost(@OrderID int) 
RETURNS money
AS
    BEGIN	
	DECLARE @money money	
	SELECT @money = ti.Ticket_Price*p.Promotion_Level
	FROM Order_INFO oi
	inner join
	Tickets_INFO ti
	ON ti.OrderID = oi.Order_ID
	inner join 
	Customers c
	ON c.Cust_ID  = oi.Cust_ID
	inner join
	Promotion p
	ON p.Promo_ID = c.Promo_ID
	where oi.Order_ID=@OrderID
	RETURN @money
    END;

ALTER TABLE Order_INFO
ADD TotalCost AS (dbo.cost(Order_ID))

/*Test*/
SELECT*
FROM DBO.Order_INFO;

/*Housekeeping*/
DROP FUNCTION dbo.cost;



/*Column Data Encryption*/
-- Create DMK
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'Database7';

-- Create certificate to protect symmetric key
CREATE CERTIFICATE Certificate7
WITH SUBJECT = 'Database7 Certificate',
EXPIRY_DATE = '2026-10-31';

-- Create symmetric key to encrypt data
CREATE SYMMETRIC KEY SymmetricKey
WITH ALGORITHM = AES_128
ENCRYPTION BY CERTIFICATE Certificate7;

-- Open symmetric key
OPEN SYMMETRIC KEY SymmetricKey
DECRYPTION BY CERTIFICATE Certificate7;

-- Create a demo table
-- Use VARBINARY as the data type for the encrypted column
create table RegisteredUser
(
 UserName VARCHAR(100),
 EncryptedPassword VARBINARY(250)
);

INSERT
INTO RegisteredUser
(
 UserName,
 EncryptedPassword 
)
VALUES
('ZhiCheng' , EncryptByKey(Key_GUID('SymmetricKey'), convert(varbinary, '25678')));

INSERT
INTO RegisteredUser
(
 UserName,
 EncryptedPassword 
)
VALUES
('MeiChun' , EncryptByKey(Key_GUID('SymmetricKey'), convert(varbinary, '12345')));

INSERT
INTO RegisteredUser
(
 UserName,
 EncryptedPassword 
)
VALUES
('XinYe' , EncryptByKey(Key_GUID('SymmetricKey'), convert(varbinary, '98109')));

INSERT
INTO RegisteredUser
(
 UserName,
 EncryptedPassword 
)
VALUES
('Jiamei' , EncryptByKey(Key_GUID('SymmetricKey'), convert(varbinary, '970807')));

SELECT * FROM RegisteredUser

SELECT username, DecryptByKey(EncryptedPassword)
FROM RegisteredUser;

SELECT username, convert(varchar, DecryptByKey(EncryptedPassword))
FROM RegisteredUser;



/*View 1: Generate a passenger's ticket information*/
CREATE VIEW TicketsInformation
AS 
SELECT a.Ticket_Number, a.Airport_Code,b.Airport_Name,a.Airline_Code,d.Airline_Name,a.Flight_Number,c.Aircraft_Type,c.Duration
FROM dbo.Tickets_INFO a
INNER JOIN dbo.Airport b
on a.Airport_Code = b.Airport_Code
INNER JOIN  dbo.Flight c
on a.Flight_Number=c.Flight_Number
INNER JOIN dbo.Airline d 
on a.Airline_Code=d.Airline_Code

SELECT * 
FROM TicketsInformation;

/*View 2: Generate a customer's name and order information*/
CREATE VIEW vwCustomerOrder
AS 
SELECT c.Cust_ID, c.Cust_LastName, c.Cust_FirstName, c.Promo_ID, o.Order_ID, o.Order_Date, o.TotalCost, o.Emp_ID
FROM dbo.Customers AS c
INNER JOIN dbo.Order_INFO AS o 
ON c.Cust_ID = o.Cust_ID

SELECT *
FROM vwCustomerOrder;


