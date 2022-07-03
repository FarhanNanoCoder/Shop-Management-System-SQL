-- DROPPING TABLES
DROP TABLE RECORD;

DROP TABLE PAYMENT;

DROP TABLE INVENTORY;

DROP TABLE SHOP;

DROP TABLE PRODUCT;

DROP TABLE CATEGORY;

DROP TABLE EMPLOYE;

DROP TABLE CUSTOMER;




-- CREATING TABLES 
CREATE TABLE CATEGORY
(
    ID INT NOT NULL,
    TITLE VARCHAR(30) NOT NULL,
    NOTE VARCHAR(100),
    PRIMARY KEY(ID)
);

CREATE TABLE EMPLOYE
(
    ID INT NOT NULL,
    E_ROLE NUMBER(1, 0) NOT NULL,
    F_NAME VARCHAR(30) NOT NULL,
    L_NAME VARCHAR(30) NOT NULL,
    SALARY NUMBER(8),
    CONTACT VARCHAR(15),
    PRIMARY KEY(ID)
);

CREATE TABLE CUSTOMER
(
    ID INT NOT NULL,
    F_NAME VARCHAR(30) NOT NULL,
    L_NAME VARCHAR(30) NOT NULL,
    CONTACT VARCHAR(15),
    COUNTRY VARCHAR(15),
    CITY VARCHAR(15),
    PRIMARY KEY(ID)
);

CREATE TABLE SHOP
(
    ID INT NOT NULL,
    M_ID INT NOT NULL ,
    BRANCH VARCHAR(30) NOT NULL,
    CONTACT VARCHAR(15),
    PRIMARY KEY(ID),
    FOREIGN KEY (M_ID) REFERENCES EMPLOYE (ID) ON DELETE CASCADE
);

CREATE TABLE PRODUCT
(
    ID INT NOT NULl,
    C_ID INT NOT NULL,
    TITLE VARCHAR(30) NOT NULL,
    PRICE NUMBER(10, 2) NOT NULL,
    COLOR VARCHAR(20),
    NOTE VARCHAR(100),
    PRIMARY KEY(ID),
    FOREIGN KEY (C_ID) REFERENCES CATEGORY (ID) ON DELETE CASCADE
);

CREATE TABLE INVENTORY(
    S_ID INT NOT NULL,
    P_ID INT NOT NULL,
    QUANTITY NUMBER(10, 0) NOT NULL,
    FOREIGN KEY (S_ID) REFERENCES SHOP(ID) ON DELETE CASCADE,
    FOREIGN KEY (P_ID) REFERENCES PRODUCT(ID) ON DELETE CASCADE
);

CREATE TABLE PAYMENT(
    ID INT NOT NULL,
    S_ID INT NOT NULL,
    C_ID INT NOT NULL,
    P_DATE VARCHAR(10),
    TOTAL NUMBER(12, 2),
    PRIMARY KEY(ID),
    FOREIGN KEY (S_ID) REFERENCES SHOP(ID) ON DELETE CASCADE,
    FOREIGN KEY (C_ID) REFERENCES CUSTOMER(ID) ON DELETE CASCADE
);

CREATE TABLE RECORD(
    PRO_ID INT NOT NULL,
    PAY_ID INT NOT NULL,
    QUANTITY NUMBER(5, 0) NOT NULL,
    AMOUNT NUMBER(10, 2),
    FOREIGN KEY (PAY_ID) REFERENCES PAYMENT(ID) ON DELETE CASCADE,
    FOREIGN KEY (PRO_ID) REFERENCES PRODUCT(ID) ON DELETE CASCADE
);

DESCRIBE CATEGORY;
DESCRIBE EMPLOYE;
DESCRIBE CUSTOMER;
DESCRIBE SHOP;
DESCRIBE PRODUCT;
DESCRIBE PAYMENT;
DESCRIBE RECORD;
DESCRIBE INVENTORY;

-- -- INSERTING DATA
INSERT INTO CATEGORY (ID,TITLE,NOTE)
VALUES (0,'TECH','Technological accessories are included in this category.');
INSERT INTO CATEGORY (ID,TITLE,NOTE)
VALUES (1,'FOOD','Food products are included in this category.');
INSERT INTO CATEGORY (ID,TITLE,NOTE)
VALUES (2,'COSMETIC','Food products are included in this category.');
INSERT INTO CATEGORY (ID,TITLE,NOTE)
VALUES (3,'ACCESSORIES','Accessories are included in this category.');
INSERT INTO CATEGORY (ID,TITLE,NOTE)
VALUES (4,'CLOTHING','Clothings are included in this category.');



INSERT INTO EMPLOYE (ID,E_ROLE,F_NAME,L_NAME,CONTACT,SALARY)
VALUES (0,0,'Albert','Rishi','01911100000',6000);
INSERT INTO EMPLOYE (ID,E_ROLE,F_NAME,L_NAME,CONTACT,SALARY)
VALUES (1,0,'Albert','Sam','01911100001'.5500);
INSERT INTO EMPLOYE (ID,E_ROLE,F_NAME,L_NAME,CONTACT,SALARY)
VALUES (2,0,'Vishal','Roy','01911100002',7000);
INSERT INTO EMPLOYE (ID,E_ROLE,F_NAME,L_NAME,CONTACT,SALARY)
VALUES (3,0,'Uday','Roy','01911100003',6000);
INSERT INTO EMPLOYE(ID,E_ROLE,F_NAME,L_NAME,CONTACT,SALARY)
VALUES(4,0,'Tom','Holland','01911100004',10000);
INSERT INTO EMPLOYE(ID,E_ROLE,F_NAME,L_NAME,CONTACT,SALARY)
VALUES (5,0,'Tom','Holland','01911100005',12000);
INSERT INTO EMPLOYE(ID,E_ROLE,F_NAME,L_NAME,CONTACT,SALARY)
VALUES (6,0,'Tom','Holland','01911100006',9000);
INSERT INTO EMPLOYE(ID,E_ROLE,F_NAME,L_NAME,CONTACT,SALARY)
VALUES (7,0,'Wanda','Vision','01911100007',11000);
INSERT INTO EMPLOYE(ID,E_ROLE,F_NAME,L_NAME,CONTACT,SALARY)
VALUES(8,0,'Jenny','Stash','01911100008',10500);
INSERT INTO EMPLOYE(ID,E_ROLE,F_NAME,L_NAME,CONTACT,SALARY)
VALUES(9,1,'Robert','Hiddelson','01911100010',25000);
INSERT INTO EMPLOYE(ID,E_ROLE,F_NAME,L_NAME,CONTACT,SALARY)
VALUES(10,1,'Alex','Sans','01911100011',23000);
INSERT INTO EMPLOYE(ID,E_ROLE,F_NAME,L_NAME,CONTACT,SALARY)
VALUES(11,1,'Tony','Stark','01911100011',30000);


INSERT INTO CUSTOMER(ID,F_NAME,L_NAME,CONTACT,COUNTRY,CITY)
VALUES(0,'Bishal','roy','01911122220','India','Delhi');
INSERT INTO CUSTOMER(ID,F_NAME,L_NAME,CONTACT,COUNTRY,CITY)
VALUES(1,'Ranvir','Kapoor','01911122221','India','Mumbai');
INSERT INTO CUSTOMER(ID,F_NAME,L_NAME,CONTACT,COUNTRY,CITY)
VALUES(2,'Jami','Lul','01911122222','Bangladesh','Dhaka');
INSERT INTO CUSTOMER(ID,F_NAME,L_NAME,CONTACT,COUNTRY,CITY)
VALUES(3,'Mishu','Baidya','01911122223','Bangladesh','Khulna');
INSERT INTO CUSTOMER(ID,F_NAME,L_NAME,CONTACT,COUNTRY,CITY)
VALUES(4,'Finch','Russel','01911122224','US','Newyork');
INSERT INTO CUSTOMER(ID,F_NAME,L_NAME,CONTACT,COUNTRY,CITY)
VALUES(5,'Violet','Markey','01911122225','US','Chinatown');



INSERT INTO SHOP(ID,M_ID,BRANCH,CONTACT)
VALUES(0,9,'US','9989');
INSERT INTO SHOP(ID,M_ID,BRANCH,CONTACT)
VALUES(1,10,'BD','6689');
INSERT INTO SHOP(ID,M_ID,BRANCH,CONTACT)
VALUES(2,11,'IND','3389');


INSERT INTO PRODUCT(ID,C_ID,TITLE,PRICE,COLOR,NOTE)
VALUES(0,0,'Xiomi M3 Headphone',700,'BLACK','A bluetooth speaker');
INSERT INTO PRODUCT(ID,C_ID,TITLE,PRICE,COLOR,NOTE)
VALUES(1,0,'Rappo keyboard',1000,'BLACK','A bluetooth keyboard');
INSERT INTO PRODUCT(ID,C_ID,TITLE,PRICE,COLOR,NOTE)
VALUES(2,0,'HP Monitor',17000,'BLACK','24 inch monitor');
INSERT INTO PRODUCT(ID,C_ID,TITLE,PRICE,COLOR,NOTE)
VALUES(3,0,'DELL Monitor',17000,'BLACK','24 inch monitor');
INSERT INTO PRODUCT(ID,C_ID,TITLE,PRICE,COLOR,NOTE)
VALUES(4,1,'Kellox Oats',300,'','');
INSERT INTO PRODUCT(ID,C_ID,TITLE,PRICE,COLOR,NOTE)
VALUES(5,1,'Coke',40,'','');
INSERT INTO PRODUCT(ID,C_ID,TITLE,PRICE,COLOR,NOTE)
VALUES(6,1,'Juice',60,'','');
INSERT INTO PRODUCT(ID,C_ID,TITLE,PRICE,COLOR,NOTE)
VALUES(7,1,'Rice',45,'','');
INSERT INTO PRODUCT(ID,C_ID,TITLE,PRICE,COLOR,NOTE)
VALUES(8,1,'Butter',45,'','');
INSERT INTO PRODUCT(ID,C_ID,TITLE,PRICE,COLOR,NOTE)
VALUES(9,3,'Basket',150,'','');
INSERT INTO PRODUCT(ID,C_ID,TITLE,PRICE,COLOR,NOTE)
VALUES(10,3,'Chair',800,'','');
INSERT INTO PRODUCT(ID,C_ID,TITLE,PRICE,COLOR,NOTE)
VALUES(11,3,'Table',1400,'','');
INSERT INTO PRODUCT(ID,C_ID,TITLE,PRICE,COLOR,NOTE)
VALUES(12,3,'Box',200,'','');
INSERT INTO PRODUCT(ID,C_ID,TITLE,PRICE,COLOR,NOTE)
VALUES(13,4,'Shirt',2000,'RED','');
INSERT INTO PRODUCT(ID,C_ID,TITLE,PRICE,COLOR,NOTE)
VALUES(14,4,'Jeans',1500,'NAVY','');
INSERT INTO PRODUCT(ID,C_ID,TITLE,PRICE,COLOR,NOTE)
VALUES(15,4,'Polo shirt',800,'BLACK','');


INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(0,0,20);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(0,1,25);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(0,2,30);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(0,3,30);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(0,4,15);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(0,5,20);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(0,6,40);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(0,7,32);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(0,8,14);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(0,9,25);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(0,10,36);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(0,11,44);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(0,12,15);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(0,13,23);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(0,14,5);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(0,15,10);

INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(1,0,22);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(1,1,25);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(1,2,30);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(1,3,30);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(1,4,15);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(1,5,20);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(1,6,40);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(1,7,32);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(1,8,14);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(1,9,25);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(1,10,36);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(1,11,44);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(1,12,15);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(1,13,23);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(2,14,5);


INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(2,0,20);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(2,1,25);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(2,2,30);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(2,3,30);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(2,4,15);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(2,5,20);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(2,6,40);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(2,7,32);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(2,8,14);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(2,9,25);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(2,10,36);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(2,11,44);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(2,12,15);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(2,13,23);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(2,14,5);
INSERT INTO INVENTORY(S_ID,P_ID,QUANTITY)
VALUES(1,15,10);


INSERT INTO PAYMENT(ID,S_ID,C_ID)
VALUES (0,0,4);
INSERT INTO PAYMENT(ID,S_ID,C_ID)
VALUES (1,0,5);
INSERT INTO PAYMENT(ID,S_ID,C_ID)
VALUES (2,0,4);
INSERT INTO PAYMENT(ID,S_ID,C_ID)
VALUES (3,0,4);

INSERT INTO PAYMENT(ID,S_ID,C_ID)
VALUES (5,1,3);
INSERT INTO PAYMENT(ID,S_ID,C_ID)
VALUES (6,1,2);
INSERT INTO PAYMENT(ID,S_ID,C_ID)
VALUES (7,1,3);

INSERT INTO PAYMENT (ID,S_ID,C_ID)
VALUES (8,2,3);
INSERT INTO PAYMENT (ID,S_ID,C_ID)
VALUES (9,2,2);
INSERT INTO PAYMENT (ID,S_ID,C_ID)
VALUES (10,2,3);

 
-- -- FOR SHOP 0
INSERT INTO RECORD (PRO_ID,PAY_ID,QUANTITY)
VALUES (0,0,2);
INSERT INTO RECORD (PRO_ID,PAY_ID,QUANTITY)
VALUES (1,0,1);
INSERT INTO RECORD (PRO_ID,PAY_ID,QUANTITY)
VALUES (2,0,3);

INSERT INTO RECORD(PRO_ID,PAY_ID,QUANTITY)
VALUES (6,1,3);

INSERT INTO RECORD(PRO_ID,PAY_ID,QUANTITY)
VALUES (4,2,1);
INSERT INTO RECORD(PRO_ID,PAY_ID,QUANTITY)
VALUES (6,2,2);

INSERT INTO RECORD(PRO_ID,PAY_ID,QUANTITY)
VALUES (7,3,1);

-- -- FOR SHOP 1
INSERT INTO RECORD(PRO_ID,PAY_ID,QUANTITY)
VALUES (8,5,1);
INSERT INTO RECORD(PRO_ID,PAY_ID,QUANTITY)
VALUES (1,5,1);
INSERT INTO RECORD(PRO_ID,PAY_ID,QUANTITY)
VALUES (2,5,2);

INSERT INTO RECORD(PRO_ID,PAY_ID,QUANTITY)
VALUES (6,6,1);

INSERT INTO RECORD(PRO_ID,PAY_ID,QUANTITY)
VALUES (4,7,3);
INSERT INTO RECORD(PRO_ID,PAY_ID,QUANTITY)
VALUES (6,7,2);

-- -- FOR SHOP 2
INSERT INTO RECORD(PRO_ID,PAY_ID,QUANTITY)
VALUES (10,5,1);
INSERT INTO RECORD(PRO_ID,PAY_ID,QUANTITY)
VALUES (14,5,1);
INSERT INTO RECORD(PRO_ID,PAY_ID,QUANTITY)
VALUES (13,5,2);

INSERT INTO RECORD(PRO_ID,PAY_ID,QUANTITY)
VALUES (11,6,1);

INSERT INTO RECORD(PRO_ID,PAY_ID,QUANTITY)
VALUES (9,7,3);
INSERT INTO RECORD(PRO_ID,PAY_ID,QUANTITY)
VALUES (4,7,2);


SELECT * FROM CATEGORY;
SELECT * FROM EMPLOYE;
SELECT * FROM CUSTOMER;
SELECT * FROM SHOP;
SELECT * FROM PRODUCT;
SELECT * FROM INVENTORY;
SELECT * FROM PAYMENT;
SELECT * FROM RECORD;


ALTER TABLE PAYMENT MODIFY P_DATE NUMBER(15);
SELECT * FROM PAYMENT;


SELECT * FROM CUSTOMER 
WHERE F_NAME  = 'Jami';

UPDATE CUSTOMER SET L_NAME = 'Haque'
WHERE F_NAME  = 'Jami';

SELECT * FROM CUSTOMER 
WHERE F_NAME  = 'Jami';

SELECT F_NAME,SALARY FROM EMPLOYE ORDER BY SALARY DESC;

SELECT F_NAME,SALARY FROM EMPLOYE WHERE SALARY>=8000 AND SALARY<=20000;