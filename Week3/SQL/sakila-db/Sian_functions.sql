#select account_id, frequency from account
#where district_id=5;

select A1,A2,A3 
from district 
where A1=50;

select tr.trans_id as transaction,k_symbol, 
tr.account_id as acc,
tr.type as 'credit-debit', operation as mode,
tr.amount
from trans as tr
where k_symbol = ' ';

#limit
select * from trans t
order by t.trans_id
limit 30;

#top 10 districts, ordered by number of inhabitants
select d.A2,d.A3,d.A4 as popln
from district d
order by A4 desc
limit 10;

select distinct d.A1 from district d; #select unique

#unique account id's from the transaction table
select count(distinct account_id) from trans;
# and count them - using  count()

#loan balance, loan balance in euros
#order of big to small
select loan_id,amount-payments as loan_bal,
(amount-payments)*0.039 as balinEUR
from loan
order by loan_bal desc
limit 100;

# where balance in EUR > 15000
# and status is B 
select * from loan
where status in ('B','D') and not duration = 12;


select 'Hello World';
select 2+5;

select * from bank;
# Get a list of all the district names in the bank database. alter
# we are looking for the names of places, not just the IDs. 
#It would be great to see the results under the heading district_name. (Hint: Use an alias.). You should have 77 rows.

select distinct c.type from card c;

select d.A2 as district_name, d.A3 as region from district d
order by A2 asc
limit 30;

#Select districts and salaries (from the district table) 
#where salary is greater than 10000. 
#Return columns as district_name and average_salary.
select d.A2 as district_name, d.A11 as average_salary from district d
where A11 > 10000;

#Calculate the urban population for all districts. 
#Hint: You are looking for the number of inhabitants and the % of urban inhabitants in each district. 
#Return columns as district_name and urban_population.
select d.A2 as district_name, 
d.A4 as urban_inhab, 
d.A10 as urban_perc, 
round(A4 * (A10/100),1) as urban_pop 
from district d
where A10 < 50;

# AVG laon amount
select ceil(AVG(amount)) from loan;
#
select lower(d.A2) as district_name, upper(d.A3) as region from district d;

# accountdates - dates ae stored as numbers
# convert number into date
#

select *, convert(a.date,datetime) as dateopened from account a;

select date_format("2017-06-15", "%D %M %Y");

select *, date_format(convert(substring_index(issued,' ',1),date),"%D %M %Y") as date from card;

select min(issued) from card;

select * from card
where issued between 950101 and 971231;

# date between
select floor(datediff(curdate(),19830505)/365);

# add 6 months
select adddate("19890414", interval 6 month);

select * from bank.order where k_symbol is not null;
select count(*) from bank.order where k_symbol = ' ';

select count(*) from trans where amount is null;


# case statement -replace columns in loand table with business defn.
select * ,
case 
when status = 'A' then 'good-repaid'
when status = 'B' then 'default'
when status = 'C' then 'on track'
else 'in debt'
end
as statusdesc
from loan
order by statusdesc, amount desc;

# searching for stuff in strings - LIKE % _ $ ^ | (wilddcards)
select * from district where A3 LIKE 'pra%';
select * from district where A3 regexp 'pra|south';
select * from district where A2 regexp '^p';
