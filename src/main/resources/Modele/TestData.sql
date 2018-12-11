CREATE TABLE CUSTOMER (
	CUSTOMER_ID INTEGER NOT NULL,
	DISCOUNT_CODE CHAR(1) NOT NULL,
	ZIP VARCHAR(10) NOT NULL,
	NAME VARCHAR(30),
	ADDRESSLINE1 VARCHAR(30),
	ADDRESSLINE2 VARCHAR(30),
	CITY VARCHAR(25),
	STATE CHAR(2),
	PHONE CHAR(12),
	FAX CHAR(12),
	EMAIL VARCHAR(40),
	CREDIT_LIMIT INTEGER,
	PRIMARY KEY (CUSTOMER_ID)
);

 CREATE TABLE DISCOUNT_CODE (
	DISCOUNT_CODE CHAR(1) NOT NULL,
	RATE DECIMAL(4,2),
	PRIMARY KEY (DISCOUNT_CODE)
);

CREATE TABLE MANUFACTURER (
	MANUFACTURER_ID INTEGER NOT NULL,
	NAME VARCHAR(30),
	ADDRESSLINE1 VARCHAR(30),
	ADDRESSLINE2 VARCHAR(30),
	CITY VARCHAR(25),
	STATEM CHAR(2),
	ZIP CHAR(10),
	PHONE VARCHAR(12),
	FAX VARCHAR(12),
	EMAIL VARCHAR(40),
	REP VARCHAR(30),
	PRIMARY KEY (MANUFACTURER_ID)
);

 CREATE TABLE MICRO_MARKET (
	ZIP_CODE VARCHAR(10) NOT NULL,
	RADIUS DOUBLE,
	AREA_LENGTH DOUBLE,
	AREA_WIDTH DOUBLE,
	PRIMARY KEY (ZIP_CODE)
);

 CREATE TABLE PRODUCT (
	PRODUCT_ID INTEGER NOT NULL,
	MANUFACTURER_ID INTEGER NOT NULL,
	PRODUCT_CODE CHAR(2) NOT NULL,
	PURCHASE_COST DECIMAL(12,2),
	QUANTITY_ON_HAND INTEGER,
	MARKUP DECIMAL(4,2),
	AVAILABLE VARCHAR(5),
	DESCRIPTION VARCHAR(50),
	PRIMARY KEY (PRODUCT_ID)
);

 CREATE TABLE PRODUCT_CODE (
	PROD_CODE CHAR(2) NOT NULL,
	DISCOUNT_CODE CHAR(1) NOT NULL,
	DESCRIPTION VARCHAR(10),
	PRIMARY KEY (PROD_CODE)
);

 CREATE TABLE PURCHASE_ORDER (
	ORDER_NUM INTEGER NOT NULL,
	CUSTOMER_ID INTEGER NOT NULL,
	PRODUCT_ID INTEGER NOT NULL,
	QUANTITY SMALLINT,
	SHIPPING_COST DECIMAL(12,2),
	SALES_DATE DATE,
	SHIPPING_DATE DATE,
	FREIGHT_COMPANY VARCHAR(30),
	PRIMARY KEY (ORDER_NUM)
);

 ALTER TABLE CUSTOMER
	ADD FOREIGN KEY (DISCOUNT_CODE) 
	REFERENCES DISCOUNT_CODE (DISCOUNT_CODE);

 ALTER TABLE CUSTOMER
	ADD FOREIGN KEY (ZIP) 
	REFERENCES MICRO_MARKET (ZIP_CODE);

 ALTER TABLE PRODUCT
	ADD FOREIGN KEY (MANUFACTURER_ID) 
	REFERENCES MANUFACTURER (MANUFACTURER_ID);

 ALTER TABLE PRODUCT
	ADD FOREIGN KEY (PRODUCT_CODE) 
	REFERENCES PRODUCT_CODE (PROD_CODE);

 ALTER TABLE PURCHASE_ORDER
	ADD FOREIGN KEY (CUSTOMER_ID) 
	REFERENCES CUSTOMER (CUSTOMER_ID);

 ALTER TABLE PURCHASE_ORDER
	ADD FOREIGN KEY (PRODUCT_ID) 
	REFERENCES PRODUCT (PRODUCT_ID);

 INSERT INTO DISCOUNT_CODE(DISCOUNT_CODE, RATE) 
	VALUES ('N',15.00);
INSERT INTO DISCOUNT_CODE(DISCOUNT_CODE, RATE) 
	VALUES ('P',8.00);

 INSERT INTO MICRO_MARKET(ZIP_CODE, RADIUS, AREA_LENGTH, AREA_WIDTH) 
	VALUES ('76321',255.59,689.856,478.479);
INSERT INTO MICRO_MARKET(ZIP_CODE, RADIUS, AREA_LENGTH, AREA_WIDTH) 
	VALUES ('95100',157.86,385.821,147.538);

 INSERT INTO CUSTOMER(CUSTOMER_ID, DISCOUNT_CODE, ZIP, NAME, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, PHONE, FAX, EMAIL, CREDIT_LIMIT) 
	VALUES (10,'N',95100,'Apple','1. Apple Park Way','Apple Park','Cupertino','CA','305-555-0001','305-555-0011','apple@example.com',500);
INSERT INTO CUSTOMER(CUSTOMER_ID, DISCOUNT_CODE, ZIP, NAME, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, PHONE, FAX, EMAIL, CREDIT_LIMIT) 
	VALUES (20,'P',76321,'Electronic Arts','36. Park Avenue','Building D','Redwood City','CA','305-555-0002','305-555-0012','EA@example.com',100);
INSERT INTO CUSTOMER(CUSTOMER_ID, DISCOUNT_CODE, ZIP, NAME, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, PHONE, FAX, EMAIL, CREDIT_LIMIT) 
	VALUES (30,'N',76321,'IBM','69. Hathaway Drive','Suite 58','Armonk','NY','305-555-0003','305-555-0013','IDM@example.com',900);

INSERT INTO MANUFACTURER(MANUFACTURER_ID, NAME, ADDRESSLINE1, ADDRESSLINE2, CITY, STATEM, ZIP, PHONE, FAX, EMAIL, REP)
	VALUES (666,'Lennox International Inc.','36. Beach Road','NONE','Richardson','TX',48963,'306-555-0001','306-555-0011','lennox@example.com','Todd Bluedorn');
INSERT INTO MANUFACTURER(MANUFACTURER_ID, NAME, ADDRESSLINE1, ADDRESSLINE2, CITY, STATEM, ZIP, PHONE, FAX, EMAIL, REP)
	VALUES (999,'Skyworks Solutions Inc.','46. Sylvan Alley','Flor 22','Woburn','MA',52159,'306-555-0002','306-555-0012','skyworks@example.com','Bob Smith');

INSERT INTO PRODUCT_CODE(PROD_CODE, DISCOUNT_CODE, DESCRIPTION)
        VALUES ('SW','N','Software');
INSERT INTO PRODUCT_CODE(PROD_CODE, DISCOUNT_CODE, DESCRIPTION)
        VALUES ('CB','P','Cables');

INSERT INTO PRODUCT(PRODUCT_ID, MANUFACTURER_ID, PRODUCT_CODE, PURCHASE_COST, QUANTITY_ON_HAND, MARKUP, AVAILABLE, DESCRIPTION)
        VALUES (1,666,'SW',175,800,25.00,TRUE,'Accounting Application');
INSERT INTO PRODUCT(PRODUCT_ID, MANUFACTURER_ID, PRODUCT_CODE, PURCHASE_COST, QUANTITY_ON_HAND, MARKUP, AVAILABLE, DESCRIPTION)
        VALUES (2,999,'CB',13600,10,36.15,TRUE,'Sound Card');

INSERT INTO PURCHASE_ORDER(ORDER_NUM, CUSTOMER_ID, PRODUCT_ID, QUANTITY, SHIPPING_COST, SALES_DATE, SHIPPING_DATE, FREIGHT_COMPANY)
        VALUES (22112018,10,1,1,263.50,'2018-11-22','2018-11-22','Colissimo');
INSERT INTO PURCHASE_ORDER(ORDER_NUM, CUSTOMER_ID, PRODUCT_ID, QUANTITY, SHIPPING_COST, SALES_DATE, SHIPPING_DATE, FREIGHT_COMPANY)
        VALUES (15092018,30,2,5,1500.00,'2018-09-15','2018-09-15','LaPoste');
