/*Table name:- User, Customer, MasterInvoice, InvoiceDetaile, Product*/
create database InventoryDatabase;
use InventoryDatabase;

create table UserInfo(
	userId int primary key,
	userName nvarchar(50) not null,
	userPassword nvarchar(50) not null,
	userRole nvarchar(20) check(userRole like 'Admin' or userRole like 'Staff')
)

create table UserInfo(
	userId int,
	userName nvarchar(50) not null,
	userPhone nvarchar(12),
	userPassword nvarchar(50) not null,
	userRole nvarchar(20),
	constraint pk_userinfo primary key(userId),
	constraint pk_userinfo_username unique(userName),
	constraint pk_userinfo_phone unique(userPhone),
	constraint pk_userinfo_role check(userRole='Admin' or userRole='Staff')
)

alter table UserInfo drop constraint uk_userinfo_phone;


create table CustomerInfo(
	custId int primary key not null,
	custName nvarchar(50) not null,
	custAddress nvarchar(40) null,
	custPhone nvarchar(12) 
);
alter table customerinfo alter column custPhone  nvarchar(12) not null;
alter table customerinfo add constraint pk_customer primary key(custId);--changing constraint of existing column

create table ProductInfo(
	proId int,
	proName nvarchar(50) not null,
	proCode nvarchar(30) not null,
	category nvarchar(30),
	unitPrice decimal(12,2),
	constraint pk_product primary key(proId),
	constraint uk_product_name unique(proName),
	constraint uk_product_code unique(proCode),
	constraint ck_product_category check(category in('Kitchen', 'Cosmetic', 'Others')),
	constraint ck_product_price check(unitPrice>0)
);

alter table ProductInfo drop constraint ck_product_category;
alter table productinfo add constraint
ck_product_category check(category in('Kitchen', 'Cosmetic', 'Others'))


create table MasterInvoice (
	invoiceId int,
	invoiceDate date,
	invoiceTime time,
	custPhone nvarchar(12) not null,
	totalAmount decimal(18, 2),
	discountAmount decimal(18,2),
	userId int,
	primary key(invoiceId),
	foreign key(userId) references UserInfo(userId)
	--constraint fk_invoice_user foreign key(userId) references UserInfo(userId))
)



--w3school ko sql ko topic haru lab report ma lekhna