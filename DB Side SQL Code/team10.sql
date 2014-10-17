--this the sql statments written by team 10
--team member: Xin Huang & Zhenzhen Yang

----drop all the tables
drop table Customer cascade constraints;
drop table Administrator cascade constraints;
drop table Product cascade constraints;
drop table Bidlog cascade constraints;
drop table Category cascade constraints;
drop table BelongsTo cascade constraints;
drop table OurDate cascade constraints;

----create tables
create table Customer 
(
	login varchar2(10),
	password varchar2(10),
	name varchar2(20),
	address varchar2(30),
	email varchar2(20),
	constraint pk_customer primary key (login) initially deferred deferrable
 );

create table Administrator 
(
	login varchar2(10),
	password varchar2(10),
	name varchar2(20),
	address varchar2(30),
	email varchar2(20),
	constraint pk_administrator primary key (login) initially deferred deferrable
);

create table Product
(
	auction_id int,
	name varchar2(20),
	description varchar2(30),
	seller varchar2(10),
	start_date date,
	min_price int,
	number_of_days int,
	status varchar2(15) not null,
	buyer varchar2(10),
	sell_date date,
	amount int,
	constraint pk_product primary key (auction_id) initially deferred deferrable,
	constraint fk_product_seller foreign key (seller) references Customer(login) initially deferred deferrable,
	constraint fk_product_buyer foreign key (buyer) references Customer(login) initially deferred deferrable
);

create table Bidlog
(
	bidsn int,
	auction_id int,
	bidder varchar2(10),
	bid_time date,
	amount int,
	constraint pk_bidlog primary key (bidsn) initially deferred deferrable,
	constraint fk_bidlog_auctionid foreign key (auction_id) references Product(auction_id) initially deferred deferrable,
	constraint fk_bidlog_bidder foreign key (bidder) references Customer(login) initially deferred deferrable
);

create table Category
(
	name varchar2(20),
	parent_category varchar2(20),
	constraint pk_category primary key (name) initially deferred deferrable,
	constraint fk_category foreign key (parent_category) references Category(name) initially deferred deferrable
);

create table BelongsTo
(
	auction_id int,
	category varchar2(20),
	constraint pk_belongsto primary key (auction_id, category) initially deferred deferrable,
	constraint fk_belongsto_auctionid foreign key (auction_id) references Product(auction_id) initially deferred deferrable,
	constraint fk_belongsto_category foreign key (category) references Category(name) initially deferred deferrable
);

create table OurDate
(
	c_date date
);



----insert data
insert into Administrator values('admin', 'root', 'administrator', '6810 SENSQ', 'admin@1555.com');

insert into Customer values('user0', 'pwd', 'user0', '6810 SENSQ', 'user0@1555.com');
insert into Customer values('user1', 'pwd', 'user1', '6811 SENSQ', 'user1@1555.com');
insert into Customer values('user2', 'pwd', 'user2', '6812 SENSQ', 'user2@1555.com');
insert into Customer values('user3', 'pwd', 'user3', '6813 SENSQ', 'user3@1555.com');
insert into Customer values('user4', 'pwd', 'user4', '6814 SENSQ', 'user4@1555.com');

insert into Product(auction_id, name, description, seller, start_date, min_price, number_of_days, status, buyer, sell_date, amount) 
	values(0, 'Database', 'SQL ER-design', 'user0', to_date('04-dec-2012/00:00:00','dd-mon-yyyy/HH24:MI:SS'), 50, 2, 'sold', 'user2', to_date('06-dec-2012/00:00:00','dd-mon-yyyy/HH24:MI:SS'),  53);
insert into Product(auction_id, name, description, seller, start_date, min_price, number_of_days, status, buyer, sell_date, amount) 
	values(1, '17 inch monitor', '17 inch monitor', 'user0',to_date('06-dec-2012/00:00:00', 'dd-mon-yyyy/HH24:MI;SS'), 100, 2, 'sold', 'user4', to_date('08-dec-2012/00:00:00', 'dd-mon-yyyy/HH24:MI;SS'), 110);
insert into Product(auction_id, name, description, seller, start_date, min_price, number_of_days, status) 
	values(2, 'DELL INSPIRON 1100', 'DELL INSPIRON notebook', 'user0', to_date('07-dec-2012/00:00:00', 'dd-mon-yyyy/HH24:MI;SS'), 500, 7, 'underauction');
insert into Product(auction_id, name, description, seller, start_date, min_price, number_of_days, status, buyer, sell_date, amount) 
	values(3, 'Return of the King', 'fantasy', 'user1', to_date('07-dec-2012/00:00:00', 'dd-mon-yyyy/HH24:MI;SS'), 40, 2, 'sold', 'user2', to_date('09-dec-2012/00:00:00', 'dd-mon-yyyy/HH24:MI;SS'), 40);
insert into Product(auction_id, name, description, seller, start_date, min_price, number_of_days, status, buyer, sell_date, amount) 
	values(4, 'The Sorcerer Stone', 'Harry Porter series', 'user1', to_date('08-dec-2012/00:00:00', 'dd-mon-yyyy/HH24:MI;SS'), 40, 2, 'sold', 'user3', to_date('10-dec-2012/00:00:00', 'dd-mon-yyyy/HH24:MI;SS'), 40);
insert into Product(auction_id, name, description, seller, start_date, min_price, number_of_days, status) 
	values(5, 'DELL INSPIRON 1100', 'DELL INSPIRON notebook', 'user1',to_date('09-dec-2012/00:00:00', 'dd-mon-yyyy/HH24:MI;SS'), 200, 1, 'withdrawn');
insert into Product(auction_id, name, description, seller, start_date, min_price, number_of_days, status, amount) 
	values(6, 'Advanced Database', 'SQL Transaction index', 'user1', to_date('10-dec-2012/00:00:00', 'dd-mon-yyyy/HH24:MI;SS'), 50, 2, 'underauction', 55);
insert into Product(auction_id, name, description, seller, start_date, min_price, number_of_days, status, amount) 
	values(7, 'Database Management', 'SQL Introduction Book', 'user1', to_date('10-dec-2012/00:00:00', 'dd-mon-yyyy/HH24:MI;SS'), 50, 30, 'underauction', 55);

insert into Bidlog values(0, 0, 'user2', to_date('04-dec-2012/08:00:00', 'dd-mon-yyyy/HH24:MI:SS'), 50);
insert into Bidlog values(1, 0, 'user3', to_date('04-dec-2012/09:00:00', 'dd-mon-yyyy/HH24:MI:SS'), 53);
insert into Bidlog values(2, 0, 'user2', to_date('05-dec-2012/08:00:00', 'dd-mon-yyyy/HH24:MI:SS'), 60);
insert into Bidlog values(3, 1, 'user4', to_date('06-dec-2012/08:00:00', 'dd-mon-yyyy/HH24:MI:SS'), 100);
insert into Bidlog values(4, 1, 'user2', to_date('07-dec-2012/08:00:00', 'dd-mon-yyyy/HH24:MI:SS'), 110);
insert into Bidlog values(5, 1, 'user4', to_date('07-dec-2012/09:00:00', 'dd-mon-yyyy/HH24:MI:SS'), 120);
insert into Bidlog values(6, 3, 'user2', to_date('07-dec-2012/08:00:00', 'dd-mon-yyyy/HH24:MI:SS'), 40);
insert into Bidlog values(7, 4, 'user3', to_date('09-dec-2012/08:00:00', 'dd-mon-yyyy/HH24:MI:SS'), 40);
insert into Bidlog values(8, 6, 'user2', to_date('07-dec-2012/08:00:00', 'dd-mon-yyyy/HH24:MI:SS'), 55);
insert into Bidlog values(9, 7, 'user4', to_date('11-dec-2012/08:00:00', 'dd-mon-yyyy/HH24:MI:SS'), 55);

insert into Category(name) values('Books');
insert into Category(name, parent_category) values('Textbooks', 'Books');
insert into Category(name, parent_category) values('Fiction books', 'Books');
insert into Category(name, parent_category) values('Magazines', 'Books');
insert into Category(name, parent_category) values('Computer Science', 'Textbooks');
insert into Category(name, parent_category) values('Math', 'Textbooks');
insert into Category(name, parent_category) values('Philosophy', 'Textbooks');
insert into Category(name) values('Computer Related');
insert into Category(name, parent_category) values('Desktop PCs', 'Computer Related');
insert into Category(name, parent_category) values('Laptops', 'Computer Related');
insert into Category(name, parent_category) values('Monitors', 'Computer Related');
insert into Category(name, parent_category) values('Computer books', 'Computer Related');

insert into BelongsTo values(0, 'Computer Science');
insert into BelongsTo values(0, 'Computer books');
insert into BelongsTo values(1, 'Monitors');
insert into BelongsTo values(2, 'Laptops');
insert into BelongsTo values(3, 'Fiction books');
insert into BelongsTo values(4, 'Fiction books');
insert into BelongsTo values(5, 'Laptops');
insert into BelongsTo values(6, 'Computer Science');
insert into BelongsTo values(6, 'Computer books');
insert into BelongsTo values(7, 'Computer books');

insert into OurDate values (to_date('11-dec-2012/00:00:00', 'dd-mon-yyyy/HH24:MI:SS'));


----alter date type
alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss';

----enable dbms_output
set serveroutput on;

----customer interface
----a browsing products
----a1 List_RootCategory
create or replace procedure List_RootCategory as 
	cursor c1 is
		select name
		from category
		where parent_category is null;

	c1_rec c1%rowtype;
	
begin
	dbms_output.put_line('Category:');
for c1_rec in c1 loop
	dbms_output.put_line(c1_rec.name);
end loop;

end;
/

----a2 Has_Leaf
create or replace function Has_Leaf (catelog in category.name%type) 
	return number as

	result number;
	cate_num number;

begin
	select count(*) into cate_num
	from category
	where parent_category = catelog;

	if(cate_num = 0) then result := 0;
	else result := 1;
	end if;

	return(result);

end;
/

----a3 List_SubCategory
create or replace procedure List_SubCategory (catein in category.parent_category%type) as 
	cursor c1 is
		select name
		from category
		where parent_category = catein ;

	c1_rec c1%rowtype;


begin
	dbms_output.put_line('Category:');
for c1_rec in c1 loop
	dbms_output.put_line(c1_rec.name);
end loop;

end;
/

----a4 List_SortMethod
create or replace procedure List_SortMethod as 

begin
	dbms_output.put_line('For displaying by the highest bid amount, press 1');
	dbms_output.put_line('For displaying alphabetically by product name, press 2');
end;
/

----a5 Brow_Product 
create or replace procedure Brow_Product 
	(sorttype in int, catein in category.name%type) as 
	type cur_type is ref cursor;

	invalid_sort_error exception;
	c1 cur_type;
	product_rec Product%rowtype;

begin
	if sorttype=1 then
		open c1 for select auction_id, name, description, seller, start_date, min_price, number_of_days, status, buyer, sell_date, amount
					from (select p.*, b.category from product p, belongsto b where p.auction_id=b.auction_id)
					where category=catein and status='underauction'
					order by amount desc;
	elsif sorttype=2 then
		open c1 for select auction_id, name, description, seller, start_date, min_price, number_of_days, status, buyer, sell_date, amount
					from (select p.*, b.category from product p, belongsto b where p.auction_id=b.auction_id)
					where category=catein and status='underauction'
					order by name asc;
	else
		raise invalid_sort_error;
	end if;

loop
	if sorttype=1 then
		fetch c1 into product_rec;
		exit when c1%notfound;
		dbms_output.put_line(product_rec.amount || ' ' || product_rec.auction_id || ' ' || product_rec.name || ' ' || product_rec.description || ' ' || product_rec.seller || ' ' || product_rec.start_date || ' ' || product_rec.min_price || ' ' || product_rec.number_of_days);
	elsif sorttype=2 then
		fetch c1 into product_rec;
		exit when c1%notfound;
		dbms_output.put_line(product_rec.name || ' ' || product_rec.auction_id || ' ' || product_rec.amount || ' ' || product_rec.description || ' ' || product_rec.seller || ' ' || product_rec.start_date || ' ' || product_rec.min_price || ' ' || product_rec.number_of_days);
	end if;
end loop;
close c1;

exception
	when invalid_sort_error then
		dbms_output.put_line('not a valid sort type.');
end;
/
----execute brow_product(1, 'Computer books');
----execute brow_product(2, 'Computer books');

----b Search Product by Text
create or replace procedure Search_Product (keyword1 in varchar2, keyword2 in varchar2) as
  cursor c1 is
    SELECT *
    FROM product
    WHERE regexp_like(description, keyword1, 'i') and regexp_like(description, keyword2, 'i');

	product_rec product%rowtype;

BEGIN
	if not c1%isopen then 
		open c1;
	end if;

	FETCH c1 INTO product_rec;
	while c1%found loop
   		DBMS_OUTPUT.PUT_LINE(product_rec.auction_id || ' ' || product_rec.name || ' ' || product_rec.description || ' ' || product_rec.seller || ' ' || product_rec.start_date || ' ' || product_rec.min_price || ' ' || product_rec.number_of_days || ' ' || product_rec.sell_date || ' ' || product_rec.amount); 
   		fetch c1 into product_rec; 
	end loop;
	close c1;

	DBMS_OUTPUT.PUT_LINE('All the products are shown above.');

end;
/
----execute Search_Product('notebook','DELL');
----execute Search_Product(' ','Dell');

----c Put Product for Auction
create or replace procedure Put_Auction
	(name in product.name%type, description in product.description%type, seller in product.seller%type, min_price in product.min_price%type, category in belongsto.category%type, number_of_days in product.number_of_days%type) 
	as

	maxnumber int;
	currentdate date;
	not_leafcategory exception;

begin
	if(Has_Leaf(category)=0) then
	select max(rownum) into maxnumber from product;

	select c_date into currentdate from ourdate;

	insert into product(auction_id, name, description, seller, start_date, min_price, number_of_days, status)
		values(maxnumber, name, description, seller, currentdate, min_price, number_of_days, 'underauction');

	insert into belongsto(auction_id, category)
		values(maxnumber, category);

	else
		raise not_leafcategory;

	end if;

exception
	when not_leafcategory then
		dbms_output.put_line('please enter the category to the smallest one.');

end;
/
----execute Put_Auction('Mac Pro', 'Mac Pro 8Gmemory', 'user2', 1200, 'Laptops', 10);


--d): bidding on products
--procdure: insert new auction into Bidlog
--notice: this procedure only can insert auction_id and amount inot Bidlog
--port for user_id
create or replace procedure bidproduct(product_id in Bidlog.auction_id%type, bid_amount in Bidlog.amount%type, 
	                                  bidder_name in Bidlog.bidder%type) as
current_amount product.amount%type;
current_bidsn Bidlog.bidsn%type;
previous_bidsn Bidlog.bidsn%type;
bid_time bidlog.bid_time%type;
auction_fail exception;
begin
	select c_date into bid_time
	from ourdate
	where rownum = 1;

	select amount into current_amount
	from product
	where product.auction_id = product_id;

	select count(bidsn) into previous_bidsn
	from Bidlog;
	current_bidsn := previous_bidsn;

	if (current_amount < bid_amount) then 
		insert into Bidlog (bidsn, auction_id, bidder, bid_time, amount) values (current_bidsn, product_id, bidder_name, bid_time, bid_amount);
	elsif (current_amount is null) then
		insert into Bidlog (bidsn, auction_id, bidder, bid_time, amount) values (current_bidsn, product_id, bidder_name, bid_time, bid_amount);
	else 
		raise auction_fail;
	end if;
	
	exception 
		when auction_fail then --amount is less than current_amount
		dbms_output.put_line ('Biding amount should be larger than current amount.');
end;
/

----execute bidproduct(6,60,'user0');

--trigger: tri_bidTimeUpdate
create or replace trigger tri_bidTimeUpdate
after insert on Bidlog
for each row
begin 
	update ourdate
	set c_date = to_date(to_char(c_date, 'dd-mon-yyyy hh24:mi') || ':' || (to_char(c_date, 'ss')+5),'dd-mon-yyyy hh24:mi:ss')
	where rownum = 1;
end;
/


--trigger： tri_updateHighBid
create or replace trigger tri_bidHighUpdate
after insert on Bidlog
for each row
begin
	update product 
	set amount = :new.amount
	where auction_id = :new.auction_id;
end;
/
--Resolve concurrency confilcts
--remains undone

--e): Selling products
--Select the second highest bid amount for Bidlog and display
--for seller: input the desicion: sell or withdrawn

--functon: display the second highest bid price for the seller
create or replace function display_price (product_id in Bidlog.auction_id%type)
	return Bidlog.amount%type as bid_price Bidlog.amount%type;
	numb integer;
begin
	select count(auction_id) into numb
	from Bidlog
	where auction_id = product_id;

	if (numb = 1) then 
		select amount into bid_price
		from(
			select amount 
			from Bidlog 
			where auction_id = product_id
			order by amount desc
		)
		where rownum = 1;
		dbms_output.put_line(bid_price);
	elsif (numb >1) then
		select amount into bid_price
		from(
			select amount 
			from Bidlog 
			where auction_id = product_id
			order by amount desc
		)
		where rownum = 2;
		dbms_output.put_line(bid_price);
	else 
		bid_price := 0;
		dbms_output.put_line('No one has ever bidded on this product.');
	end if;
	return (bid_price);
end;
/

--procedure: ender the selecton of the seller and update the table product
create or replace procedure update_status (product_id in Bidlog.auction_id%type, desicion in product.status%type) as
price_record int;
begin
	price_record := display_price(product_id);
	if (desicion = 'sell') then	--can we compare the two sting type varibales direstly?
		if (price_record = 0) then
			dbms_output.put_line('Fool.');
		else
			update product
			set amount = display_price(product_id), status = 'sold'
			where auction_id = product_id;
		end if;
	elsif (desicion = 'withdraw') then 
		update product
		set amount = null, status = 'withdrawn'
		where auction_id = product_id;
	end if;
end;
/

----execute update_status (2,'sell');

--f) : Suggestion
--fuction: bidding_friend;
--find the bidding_friend; user_id is 'login';
--use cursor to display all the outcome;
create or replace procedure Suggestion (user_id in Customer.login%type) as
--define a record type
type cursor_type is record
(
	popluarity int,
	auction_id int,
	product_name product.name%type
);
type cur_type is ref cursor;
pointer cur_type;
outcome_rev cursor_type;
begin 
	open pointer for 
	select popluarity, bid_id, product.name
	from (
		  select count(auction_id) as popluarity, auction_id as bid_id
		  from Bidlog 
		  where bidder in (select bidder as bidding_friend
		  				from Bidlog
		  				where auction_id in (select auction_id 
		  									 from Bidlog
		  									 where bidder = user_id))
		  group by auction_id
		  order by popluarity desc), product
	where bid_id = auction_id;
	
	loop
		fetch pointer into outcome_rev;
		exit when pointer%notfound;
		dbms_output.put_line(outcome_rev.popluarity||' '||outcome_rev.auction_id||' '||outcome_rev.product_name);
	end loop;
	close pointer;
end;
/
----execute Suggestion('user2');


----administrator interface
----a) new customer registration
----a1 Is an administrator or nor
create or replace function Is_Admin (admin_in in administrator.login%type) 
	return boolean as

	isadmin boolean;
	existadmin number;

begin
	select count(*) into existadmin
	from administrator
	where admin_in in (select login
						from administrator);

	if(existadmin = 0) then isadmin := false;
	else isadmin := true;
	end if;

	return(isadmin);

end;
/

----a2 Is an already existed customer or nor
create or replace function Is_Customer (customer_in in customer.login%type) 
	return boolean as

	iscustomer boolean;
	existcustomer number;

begin
	select count(*) into existcustomer
	from customer
	where customer_in in (select login
						from customer);

	if(existcustomer = 0) then iscustomer := false;
	else iscustomer := true;
	end if;

	return(iscustomer);

end;
/

----a3 Check new customer
create or replace procedure Check_Customer (new_customer in Customer.login%type, new_pwd in Customer.password%type, new_name in Customer.name%type, new_address in Customer.address%type, new_email in Customer.email%type) as
	
begin

	if(Is_Admin(new_customer)=true) then
		dbms_output.put_line('Already exist.');
	elsif(Is_Customer(new_customer)=true) then
		dbms_output.put_line('Already exist.');
	else 
		insert into customer
			values(new_customer, new_pwd, new_name, new_address, new_email);
	end if;

end;
/

----execute Check_Customer('admin','abcd','admin_name','1234 abcd ave','abcd@pitt.edu');
----execute Check_Customer('user1','abcd','user1_name','1234 abcd ave','abcd@pitt.edu');
----execute Check_Customer('user5','pwd','user5','1234 abcd ave','abcd@pitt.edu');

--b): Update system date
create or replace procedure DateUpdate (Currentdate in date) as
begin 
	Update ourdate
	set c_date = Currentdate
	where rownum = 1;
end;
/
----execute DateUpdate (to_date('12-Aug-2013 00:06:00', 'dd-mon-yyyy hh24:mi:ss'));


--c): Product statistics
--function: count date from all users
create or replace procedure count_all as
cursor pointer is 
	select * from product;
product_rec pointer%rowtype;
state varchar2(15);
bid_amount product_rec.amount%type;
bidder_name Bidlog.bidder%type;
product int;
begin 

	for product_rec in pointer loop
		state := product_rec.status;
		product := product_rec.auction_id;
		bid_amount := product_rec.amount;

		if ((state = 'underauction') and (bid_amount is not null)) then 
			select bidder into bidder_name
			from Bidlog
			where auction_id = product and amount = bid_amount;
			dbms_output.put_line(product_rec.status||' '||product_rec.name||' '||product_rec.amount||' '||bidder_name);

		elsif ((state = 'underauction') and (bid_amount is null)) then 
			dbms_output.put_line(product_rec.status||' '||product_rec.name);

		elsif (state = 'sold') then 
			dbms_output.put_line(product_rec.status||' '||product_rec.name||' '||product_rec.amount||' '||product_rec.buyer);

		elsif ((state = 'withdrawn') or (state = 'close')) then
			dbms_output.put_line(product_rec.status||' '||product_rec.name);

		else
			null;
		end if;
	end loop;
end;
/

--function: count data for specific user
create or replace procedure count_specified (user in product.seller%type) as
cursor pointer is 
	select * from product where seller = user;
product_rec pointer%rowtype;
state varchar2(15);
bid_amount product_rec.amount%type;
bidder_name Bidlog.bidder%type;
product int;
begin 
	for product_rec in pointer loop
		state := product_rec.status;
		product := product_rec.auction_id;
		bid_amount := product_rec.amount;

		if ((state = 'underauction') and (bid_amount is not null)) then 
			select bidder into bidder_name
			from Bidlog
			where auction_id = product and amount = bid_amount;

			dbms_output.put_line(product_rec.status||' '||product_rec.amount||' '||bidder_name);
		elsif (state = 'sold') then 
			dbms_output.put_line(product_rec.status||' '||product_rec.amount||' '||product_rec.buyer);
		else
			null;
		end if;
	end loop;
end;
/

----d statistics
----1)product_count
create or replace function product_count (x_month in int, c_cate in belongsto.category%type)
	return int as

	sold_total int :=0;
	monthnum int;

	cursor c1 is
		select p.auction_id, p.start_date, b.category
		from product p, belongsto b
		where p.status='sold' and p.auction_id=b.auction_id and b.category=c_cate;		
	c1_rec c1%rowtype;

begin
	open c1;

	loop
	fetch c1 into c1_rec;
	exit when c1%notfound;
	select months_between(c_date, c1_rec.start_date) into monthnum
	from ourdate
	where rownum=1;
	if(monthnum <= x_month) then
		sold_total := sold_total+1;
	end if;
	end loop;

	close c1;

	return(sold_total);
end;
/

----select name, product_count(2, name) from category;

--2) Bid_Count
create or replace function Bid_Count (x_month in int, user in Bidlog.bidder%type)
	return int as 
	total int := 0;
cursor c1 is 
	select auction_id, bidder, bid_time
	from Bidlog
	where bidder = user;
c1_rec c1%rowtype;
monthnum int;
begin
	open c1;
	loop
	fetch c1 into c1_rec;
	exit when c1%notfound;
	select months_between(c_date, c1_rec.bid_time) into monthnum
	from ourdate
	where rownum = 1;
	if(monthnum < x_month) then 
		total := total + 1;
	end if;
	end loop;

	return(total);
end;
/

--3) Buying_Amount
create or replace function Buying_Amount (x_month in int, user in product.buyer%type)
	return int as 
total int := 0;
cursor c1 is 
	select buyer, sell_date, amount
	from product
	where buyer = user;
c1_rec c1%rowtype;
monthnum int;
begin 
	open c1;
	loop
	fetch c1 into c1_rec;
	exit when c1%notfound;
	select months_between(c_date, c1_rec.sell_date) into monthnum
	from ourdate
	where rownum = 1;

	if (monthnum <= x_month ) then
		total := total + c1_rec.amount;
	end if;
	end loop;
	return(total);
end;
/


----d1 top k highest in leaf category
create or replace procedure topk_leafcate (top_k in int, x_month in int) as

	sold_num int;
	last_num int :=0;
	top_count int :=0;

	cursor c2 is
		select name, sold_num
		from (select name, product_count(x_month, name) as sold_num
			from category
			where name in (select name from category where has_leaf(name)=0)
			order by product_count(x_month, name) desc);

	c2_rec c2%rowtype;

begin
	select sold_num into last_num
	from (select name, product_count(x_month, name) as sold_num
		from category
		where name in (select name from category where has_leaf(name)=0)
		order by product_count(x_month, name) desc)
	where rownum=1;

	open c2;

	loop
	fetch c2 into c2_rec;
	exit when c2%notfound;
	
	if((last_num=c2_rec.sold_num) and (top_count <= top_k)) then
		dbms_output.put_line(c2_rec.name || ' ' ||c2_rec.sold_num);
	elsif((last_num<>c2_rec.sold_num) and (top_count <= top_k)) then
		dbms_output.put_line(c2_rec.name || ' ' ||c2_rec.sold_num);
		top_count := top_count+1;
		last_num := c2_rec.sold_num;
	end if;

	end loop;

	close c2;

end;
/

----execute topk_leafcate(3, 2);
----execute topk_leafcate(20, 2);

----d2 top k highest in root category
----find root category
create or replace function Find_Root (catelog in category.name%type) 
	return category.name%type as

	root_cate category.name%type;
	current_cate category.name%type;

begin
	root_cate := catelog;
	current_cate := catelog;
	while (root_cate is not null) loop
		current_cate := root_cate;		
		select parent_category into root_cate
		from category
		where name=current_cate;
	end loop;

	return(current_cate);
end;
/

----select name, Find_Root(name) from category where name='Computer Science';

----top k highest in root category
create or replace procedure topk_rootcate (top_k in int, x_month in int) as

	sold_num int;
	last_num int :=0;
	top_count int :=0;
	total_sum int :=0;

	cursor c2 is
		select root_name, sum(sold_num) as total_sum
		from (select name, product_count(x_month, name) as sold_num, Find_Root(name) as root_name 
			from category)
		group by root_name
		order by total_sum desc;

	c2_rec c2%rowtype;

begin
	select total_sum into last_num
	from (select root_name, sum(sold_num) as total_sum
			from (select name, product_count(x_month, name) as sold_num, Find_Root(name) as root_name 
				from category)
			group by root_name
			order by total_sum desc)
	where rownum=1;


	open c2;

	loop
	fetch c2 into c2_rec;
	exit when c2%notfound;
	
	if((last_num=c2_rec.total_sum) and (top_count <= top_k)) then
		dbms_output.put_line(c2_rec.root_name || ' ' ||c2_rec.total_sum);
	elsif((last_num<>c2_rec.total_sum) and (top_count <= top_k)) then
		dbms_output.put_line(c2_rec.root_name || ' ' ||c2_rec.total_sum);
		top_count := top_count+1;
		last_num := c2_rec.total_sum;
	end if;

	end loop;

	close c2;

end;
/

----execute topk_rootcate(3,2);

--d3 the top k most active bidders(highest count of bids placed)
create or replace procedure active_bidders (x_month in int, k in int) as
cursor c1 is 
	select bidder, Bid_Count(x_month,bidder) as Num_Bid
	from Bidlog
	where rownum <= k
	order by Num_Bid desc;
c1_rec c1%rowtype;
begin
	open c1;
	loop
	fetch c1 into c1_rec;
	exit when c1%notfound;
	dbms_output.put_line(c1_rec.bidder||' '||c1_rec.Num_Bid);
	end loop;
	close c1;
end;
/


--d4 the top k most active buyers (highest total dollar amount spent)
create or replace procedure active_buyers (x_month in int, k in int) as 
cursor c1 is 
	select buyer, Buying_Amount(x_month,buyer) as Sum_Amount
	from product
	where rownum <= k and buyer is not null
	order by Sum_Amount desc;
c1_rec c1%rowtype;
begin
	open c1;
	loop
	fetch c1 into c1_rec;
	exit when c1%notfound;
	dbms_output.put_line(c1_rec.buyer||' '||c1_rec.Sum_Amount);
	end loop;
	close c1;
end;
/

----3 additional functional requirements
----a Check login and password
create or replace function Check_loginpwd (login_name in customer.login%type, pwd in customer.password%type)
	return int as

	result int := 0;
	customer_pwd varchar2(10);
	admin_pwd varchar2(10);

begin
	if(Is_Customer(login_name)=true) then
		select password into customer_pwd
		from customer
		where login=login_name;
		if(customer_pwd=pwd) then
			result := 1;
		end if;
	elsif(Is_Admin(login_name)=true) then
		select password into admin_pwd
		from administrator
		where login=login_name;
		if(admin_pwd=pwd) then
			result := 2;
		end if;
	else 
		result := 0;
	end if;
	return(result);
end;
/

----select login, Check_loginpwd(login, 'root') from administrator;
----select login, Check_loginpwd(login, 'pwd') from customer;
----select login, Check_loginpwd(login, 'abcd') from customer;

----b trigger CloseAuctions
create or replace trigger CloseAuctions
after update of c_date on ourdate
for each row 
declare
--pragma autonomous_transaction;
monthnum number;
state product.status%type;
begin
	select status into state
	from product;
	if(state = 'underauction') then
		select months_between(:old.c_date, p.start_date) into monthnum
		from ourdate, product p
		where rownum = 1;

		update product
		set status='close'
		where monthnum >= (number_of_days/31);
	end if;
end;
/

----execute DateUpdate (to_date('12-Aug-2017 00:06:00', 'dd-mon-yyyy hh24:mi:ss'));














