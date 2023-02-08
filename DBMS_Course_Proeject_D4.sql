create table customer (
c_id number constraint pk_cid primary key,
c_hno number constraint nn_c_hno not null,
c_street varchar2(20) constraint nn_street not null,
c_city varchar2(20) constraint nn_city not null,
c_pin_code number constraint nn_pin_code not null,
c_fname varchar2(20) constraint nn_fname not null,
c_mname varchar2(20) constraint nn_mname not null,
c_lname varchar2(20) constraint nn_lname not null,
c_mob_no varchar2(20) constraint uni_mob_no unique);

create table delivery_employee(
d_id number constraint pk_did primary key,
d_mob_no varchar2(20) constraint uni_dmob_no unique,
d_start number constraint nn_start not null,
d_end number constraint nn_end not null,
d_salary float constraint nn_salary not null,
d_ratings number constraint nn_ratings not null,
d_fname varchar2(20) constraint nn_dfname not null,
d_mname varchar2(20) constraint nn_dmname not null,
d_lname varchar2(20) constraint nn_dlname not null);

create table menu(
dish_id number constraint pk_dishid primary key,
dish_name varchar2(20) constraint nn_dishname not null,
dish_cuisine varchar2(30) constraint nn_dishcuisine not null,
dish_price float constraint nn_dishprice not null,
dish_start number constraint nn_dishstart not null,
dish_end number constraint nn_dishend not null);

create table restaurant(
r_id number constraint pk_rid primary key,
r_specialty varchar2(20) constraint nn_rspecialty not null,
r_mob_no varchar2(20) constraint nn_rmob_no not null,
r_start number constraint nn_rstart not null,
r_end number constraint nn_rend not null,
r_name varchar2(20) constraint nn_rname not null,
r_ratings number constraint nn_rratings not null,
r_street varchar2(20) constraint nn_rstreet not null,
r_city varchar2(20) constraint nn_rcity not null,
r_pin_code number constraint nn_rpin_code not null);

create table orders(
order_id number constraint pk_orderid primary key,
order_quantity number constraint nn_orderquantity not null,
order_time number constraint nn_ordertime not null,
order_date date constraint nn_orderdate not null,
f_status varchar2(20) ,
f_date date constraint nn_orderfdate not null,
c_id number references customer(c_id),
r_id number references restaurant(r_id),
d_id number references delivery_employee(d_id),
dish_id number references menu(dish_id));

create table deals(
deal_code number constraint pk_validid primary key,
discount float constraint nn_validdiscount not null,
valid_day varchar2(20) constraint nn_valid_day not null,
valid_pay_method varchar2(20) );


create table served_by(
r_id number references restaurant(r_id),
d_id number references menu(dish_id));

create table offers(
r_id number references restaurant (r_id),
d_code number references deals (deal_code));

commit;
insert into customer values(1120,21,'laxminagar','banahatti',587311,'daya','v','hatti',9189357645);
insert into customer values(1121,31,'vidyanagar','hubli',580031,'arun','k','naik',6753876875);
insert into customer values(1122,41,'unkal road','hubli',580031,'vanu','m','j',7890478939);
insert into customer values(1123,51,'keb road','tama khadi',587312,'relal','h','h',7893567865);
insert into customer values(1124,61,'temple road','mudhol',587335,'abhi','m','kudachi',6738978983);
insert into customer values(1125,71,'abmp road','bijapur',587385,'kiran','p','n',6748976578);
insert into customer values(1126,81,'keshav road','bagalkot',587392,'anjali','m','f',6784569890);
insert into customer values(1127,91,'ambedkar circle','rabakavi',587314,'bhargavi','r','mali',5467893456);
insert into customer values(128,101,'gandhi nagar','rampur',587315,'vinuta','k','katti',4678907890);
insert into customer values(1129,121,'laxmi nagar','banahatti',587311,'deepti','m','d',7654321234);
insert into customer values(1130,131,'vidya nagar','hubli',580031,'asha','k','gowda',5896321478);


insert into delivery_employee values(421,1234567892,10,9,10000,1,'manju','r','khot');
insert into delivery_employee values(422,2345678901,11,10,20000,2,'shasidar','m','s');
insert into delivery_employee values(423,3456789012,12,11,30000,3,'km','m','r');
insert into delivery_employee values(424,1234567893,13,12,40000,4,'prakash','b','hegde');
insert into delivery_employee values(425,0876543211,14,13,50000,5,'aruna','m','naik');
insert into delivery_employee values(426,7418529637,15,14,50000,6,'vimala','k','patil');
insert into delivery_employee values(427,7453951755,16,15,10000,7,'nameta','s','patil');
insert into delivery_employee values(428,7865585541,17,16,20000,8,'shaila','s','k');
insert into delivery_employee values(429,8526528555,18,17,40000,9,'pradeep','m','k');
insert into delivery_employee values(430,7851954528,19,18,90000,1,'vishal','s','k');

insert into menu values(111,'idli','south indian',40,1,2);
insert into menu values(112,'jeera rice ','north indian',110,2,3);
insert into menu values(113,'ni thali','north indian',340,3,4);
insert into menu values(114,'si thali','south indian',240,4,5);
insert into menu values(115,'fried rice','chinese',130,5,6);
insert into menu values(116,'puri','south indian',60,2,3);
insert into menu values(117,'idli','south indian',40,1,3);
insert into menu values(118,'egg biryani','north indian',70,8,9);
insert into menu values(119,'chicken thali','north indian',220,9,10);
insert into menu values(120,'puri','south indian',60,1,2);
insert into menu values(121,'idli','south indian',40,1,3);

insert into restaurant values(1001,'idli',7495196382,8,10,'vaibhav',2,'laxmi','jamakandi',587312);
insert into restaurant values(1002,'jeera rice',1478529631,9,9,'panjurli',3,'shirur park','hubli',5800321);
insert into restaurant values(1003,'puri',7896415252,10,8,'kamat',4,'kmr road','belgaum',5800312);
insert into restaurant values(1004,'pav bhaji',9876543211,10,10,'vijay',3,'vidya nagar','banahatti',5800311);
insert into restaurant values(1005,'gobi',7896541239,9,6,'president',5,'hdmc road','melanti',587311);
insert into restaurant values(1006,'puri',9874587896,8,5,'naveen',4,'unkal road','hubli',5800311);
insert into restaurant values(1007,'idli',7495196789,11,10,'ice cube',3,'hosur road','hubli',5800311);
insert into restaurant values(1008,'jeera rice',749519324,8,11,'densions',4,'hosur road','hubli',5800311);
insert into restaurant values(1009,'fried rice',7495196542,9,8,'ocean pearl',5,'sultan road','dharawad',5800312);
insert into restaurant values(1010,'idli',7495196373,8,9,'revanth',3,'sultan road','dharawad',5800312);

insert into orders values(731,1,11,'1-jan-21','good','10-may-21',1120,1001,421,111);
insert into orders values(732,2,12,'2-feb-21','bad','11-aug-21',1121,1002,422,112);
insert into orders values(733,1,1,'3-may-21','avg','12-dec-21',1122,1003,423,113);
insert into orders values(734,1,2,'4-july-21','bad','13-oct-21',1123,1004,421,114);
insert into orders values(735,2,3,'5-mar-21','good','14-oct-21',1124,1005,422,116);
insert into orders values(736,3,4,'6-jun-21','avg','15-may-21',1125,1006,428,114);
insert into orders values(737,4,5,'7-sep-21','good','16-dec-21',1126,1007,427,112);
insert into orders values(738,5,6,'8-july-21','avg','17-sep-21',1127,1008,424,115);
insert into orders values(740,2,1,'10-mar-21','good','18-oct-21',1129,1010,426,118);


insert into deals values(661,50,'10-sep-20','cod');
insert into deals values(662,20,'11-oct-20','online');
insert into deals values(663,50,'12-sep-20','both');
insert into deals values(664,40,'12-dec-20','online');
insert into deals values(665,70,'13-dec-20','cod');
insert into deals values(666,80,'14-sep-20','cod');
insert into deals values(667,60,'15-oct-20','both');
insert into deals values(668,70,'16-dec-20','cod');
insert into deals values(669,50,'16-aug-20','online');
insert into deals values(670,60,'16-sep-20','cod');

insert into served_by values(1001,111); 
insert into served_by values(1002,112); 
insert into served_by values(1003,113); 
insert into served_by values(1004,114); 
insert into served_by values(1005,115); 
insert into served_by values(1001,116); 
insert into served_by values(1002,117); 
insert into served_by values(1003,118); 
insert into served_by values(1004,119); 
insert into served_by values(1002,120); 
 
 
insert into offers values(1001,661);
insert into offers values(1002,662);
insert into offers values(1003,663);
insert into offers values(1004,664);
insert into offers values(1005,661);
insert into offers values(1006,665);
insert into offers values(1007,666);
insert into offers values(1008,664);
insert into offers values(1002,663);
insert into offers values(1001,662);
insert into offers values(1006,665);

select * from customer;
select * from delivery_employee;
select * from menu;
select * from restaurant;
select * from orders;
select * from deals;
select * from served_by;
select * from offers;

/* QUERIES */
/* 1)NAME THE CUSTOMERS DETAILS WHO HAVE ORDERD THE FOOD BY THE DELIVERY EMPLOYEE HAVING RATINGS GREATER THAN 5 */
SELECT  C_FNAME,C_MNAME,C_LNAME
FROM CUSTOMER C,DELIVERY_EMPLOYEE DE,ORDERS O
WHERE O.D_ID=DE.D_ID AND O.C_ID=C.C_ID
AND DE.D_RATINGS>5;

/* 2)NAME THE RESTAURANT NAME THAT HAD GOT THE  ORDERS OF THE SOUTH INDIAN ITEMS */

SELECT R.R_NAME
FROM RESTAURANT R,ORDERS O,MENU M
WHERE O.R_ID=R.R_ID AND O.DISH_ID=M.DISH_ID
AND M.DISH_CUISINE='south indian';

/* 3)DISPLAY THE NUMBER OF RESTAURANTS AND THEIR NAME  THAT HAS AN OFFER AND PROVIDES DISCOUNT AMT GREATER THAN 40 */

SELECT COUNT(*),R_NAME
FROM RESTAURANT R,OFFERS O,DEALS D
WHERE R.R_ID=O.R_ID AND O.D_CODE=D.DEAL_CODE
 AND D.DISCOUNT>40
GROUP BY R_NAME;

/* 4)NAME THE CUSTOMERS DETAILS WHO HAVE ORDERD THE FOOD BY THE DELIVERY EMPLOYEE HAVING SALARY GREATER THAN THE AVG SALARY */
SELECT  C_FNAME,C_MNAME,C_LNAME
FROM CUSTOMER C,DELIVERY_EMPLOYEE DE,ORDERS O
WHERE O.D_ID=DE.D_ID AND O.C_ID=C.C_ID
AND DE.D_SALARY>(SELECT AVG(D_SALARY) FROM  DELIVERY_EMPLOYEE);

/* 5)RETRIVE THE DEAL CODE AND THEIR RESPECTIVE RESTAURANT NAME WHO HAVE OFFERS IN THE MONTH OF SEPTEMBER */
SELECT D.DEAL_CODE,R.R_NAME
FROM RESTAURANT R,DEALS D,OFFERS O
WHERE R.R_ID=O.R_ID AND O.D_CODE=D.DEAL_CODE
AND D.VALID_DAY LIKE '___sep___'
GROUP BY DEAL_CODE,R_NAME;

/*6)RETRIVE THE CUSTOMERS DETAILS AND ORDERID WHO HAVE ORDERED THE FOOD FROM RESTAURANT HAVING 
RESTAURANT RATINGS GREATER THAN THE AVG RATINGS AND FOOD STATUS IS GOOD*/
SELECT C_FNAME,C_LNAME,ORDER_ID
FROM ORDERS O,CUSTOMER C,RESTAURANT R
WHERE C.C_ID=O.C_ID AND O.R_ID=R.R_ID
AND O.F_STATUS='good' AND
R.R_RATINGS>(SELECT AVG(R_RATINGS) FROM RESTAURANT);

/*7)RETRIVE  THE NO OF ORDERS AND THE RESTAURANT NAME AND EMPLOYEE NAME DELIVERED BY THE
EMPLOYEE FROM THE DIFFERENT RESTAURANT*/
SELECT COUNT(*),D_FNAME,D_LNAME,R_NAME
FROM ORDERS O,DELIVERY_EMPLOYEE DE,RESTAURANT R
WHERE DE.D_ID=O.D_ID AND R.R_ID=O.R_ID
GROUP BY D_FNAME,D_LNAME,R_NAME;

/*8)RETRIVE THE CUSTOMER ID,R ID ,R_NAME WHO HAVE ORDERED THE FOOD FROM RESTAURANT 
PRESENT IN HUBLI,DHARWAD*/
SELECT C.C_ID,R.R_ID,R.R_NAME
FROM CUSTOMER C,RESTAURANT R,ORDERS O
WHERE C.C_ID=O.C_ID AND R.R_ID=O.R_ID
AND R.R_CITY IN('hubli','dharwad')
GROUP BY C.C_ID,R.R_ID,R.R_NAME;

/*9)NAME THE DID AND ORDERID OF THE CUSTOMER WHO HAVE ORDERED THE FOOD 
FROM EMPLOYEE BEFORE 2 */
SELECT DE.D_ID,O.ORDER_ID
FROM CUSTOMER C,ORDERS O,DELIVERY_EMPLOYEE DE
WHERE O.D_ID=DE.D_ID AND C.C_ID=O.C_ID
AND O.ORDER_TIME<2;

/* 10)RETRIVE THE R_ID AND DEAL CODE OF RESTAURANT WHO HAVE OFFERS IF THE PAYMENT IS BY ONLINE */
SELECT R.R_ID,D.DEAL_CODE
FROM DEALS D,OFFERS O,RESTAURANT R
WHERE R.R_ID=O.R_ID AND O.D_CODE=D.DEAL_CODE
AND D.VALID_PAY_METHOD='online';