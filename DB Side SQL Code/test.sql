----test file
----customer interface
--a
--list products order by the highest amount
execute brow_product(1, 'Computer books');

--list products order by name
execute brow_product(2, 'Computer books');

--b
----search by text
execute Search_Product('notebook','DELL');

----search by text with only one keyword, and ignore uppercase or not
execute Search_Product(' ','Dell');

--c
--put product for auction
execute Put_Auction('Mac Pro', 'Mac Pro 8Gmemory', 'user2', 1200, 'Laptops', 10);

--d
--bid on product
execute bidproduct(0,10,'user0');
execute bidproduct(7,60,'user3');

--e
execute update_status (2,'sell');
execute update_status (6,'sell');

--f
execute Suggestion('user2');

----administrator interface
--a
execute Check_Customer('admin','abcd','admin_name','1234 abcd ave','abcd@pitt.edu');
execute Check_Customer('user1','abcd','user1_name','1234 abcd ave','abcd@pitt.edu');
execute Check_Customer('user5','pwd','user5','1234 abcd ave','abcd@pitt.edu');

--b
execute DateUpdate (to_date('12-Aug-2013 00:06:00', 'dd-mon-yyyy hh24:mi:ss'));

--c
execute count_all;
execute count_specified('user1');

--d
execute topk_leafcate(3, 2);
execute topk_rootcate(3,2);
execute active_bidders(2, 3);
execute active_buyers(2, 3);

----additional functional requirements
--1
select login, Check_loginpwd(login, 'root') from administrator;
select login, Check_loginpwd(login, 'pwd') from customer;
select login, Check_loginpwd(login, 'abcd') from customer;

--2
execute DateUpdate (to_date('12-Aug-2017 00:06:00', 'dd-mon-yyyy hh24:mi:ss'));