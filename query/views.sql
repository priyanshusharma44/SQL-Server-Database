--views in sql
--create view MyFirstView as Select getdate() as CurDate --creating views
select name from sys.views;

select curdate from MyFirstView;

select * from MasterInvoice;

create view PrintView as select InvoiceId, Invoicedate, custPhone, totalAmount-discountAmount as NetAmount, userName from MasterInvoice inner join UserInfo on MasterInvoice.UserId=UserInfo.UserId;
select * from PrintView;

drop view myFirstView;

alter view PrintView as select InvoiceId, Invoicedate,custName, MasterInvoice.custPhone, totalAmount-discountAmount as NetAmount, userName from MasterInvoice inner join UserInfo on MasterInvoice.UserId=UserInfo.UserId inner join CustomerInfo on MasterInvoice.custPhone=CustomerInfo.custPhone;


select InvoiceId, Invoicedate,custName, MasterInvoice.custPhone as [Customer Phone]/*can allow space in attributes*/, totalAmount-discountAmount as NetAmount,(select userName from UserInfo where UserInfo.userId=MasterInvoice.userId/*Inner query for userInfo and MasterInvoice*/) userName from MasterInvoice inner join CustomerInfo on MasterInvoice.custPhone=CustomerInfo.custPhone;

select * from (select custName, custPhone from CustomerInfo) as MyCustomer;