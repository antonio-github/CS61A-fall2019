.read data.sql

-- QUESTIONS --



-------------------------------------------------------------------------
------------------------ Give Interest- ---------------------------------
-------------------------------------------------------------------------

update accounts set amount = 1.02*amount;


create table give_interest_result as select * from accounts; -- just for tests

-------------------------------------------------------------------------
------------------------ Split Accounts ---------------------------------
-------------------------------------------------------------------------

create table two_accounts as
	select name || "'s Savings account" as acc_name, 0.5*amount as acc_amount
		from accounts union
	select name || "'s Checking account", 0.5*amount from accounts;

-- To just insert data into ACCOUNTS (not what is asked):
-- insert into accounts select acc_name, acc_amount from two_accounts;
-- To change ACCOUNTS table with TWO_ACCOUNTS data:
delete from accounts;
insert into accounts select acc_name, acc_amount from two_accounts;


create table split_account_results as select * from accounts; -- just for tests

-------------------------------------------------------------------------
-------------------------------- Whoops ---------------------------------
-------------------------------------------------------------------------

drop table accounts;


CREATE TABLE average_prices AS
  SELECT category as category, avg(MSRP) as average_price
	from products group by category;

CREATE TABLE lowest_prices AS
  SELECT store as store, item as item, price as p from inventory
	group by item having p = min(p);

CREATE TABLE shopping_list(item, store);

CREATE TABLE shopping_list_item AS
  SELECT name as name from products group by category having min(MSRP/rating);

CREATE TABLE shopping_list_store AS
	select store as store, item as item
		from lowest_prices, shopping_list_item where name = item;

insert into shopping_list select name, store
	from shopping_list_item as item, shopping_list_store as store
	where item = name;

CREATE TABLE total_bandwidth AS
  SELECT sum(s.Mbs) from shopping_list as l, stores as s
	where s.store = l.store;
