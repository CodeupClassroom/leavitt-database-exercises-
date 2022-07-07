/*
SUBQUERIES RETURNING A COLUMN

Find customer ids and total charges for all <customers who have an internet service type of 3.>

*/

-- select * from customer_subscriptions;

select customer_id from customer_subscriptions where internet_service_type_id = 3; 

select customer_id, total_charges
from customer_payments
where customer_id IN ('0023-UYUPN', '0030-FNXPP');

select customer_id, total_charges
from customer_payments
where customer_id IN (select customer_id from customer_subscriptions where internet_service_type_id = 3);


/*
SUBQUERIES RETURNING A SCALAR

Find customer ids, monthly charges and total charges for all <customers whose total charges are greater than the average.>
*/

select avg(total_charges) from customer_payments;

select customer_id, monthly_charges, total_charges
from customer_payments
where total_charges > 2279.73;


select customer_id, monthly_charges, total_charges
from customer_payments
where total_charges > (select avg(total_charges) from customer_payments);

/*
SUBQUERIES RETURNING A TABLE

Find customer_id, average charges, internet service type for all customers. 
*/
 -- inner query returns a table
select pay.customer_id, avg(pay.monthly_charges) as average_charges
from customer_payments pay
group by customer_id
;

-- outer query
select sub.customer_id, sub.internet_service_type_id, ist.internet_service_type
from customer_subscriptions sub
join internet_service_types ist on sub.internet_service_type_id = ist.internet_service_type_id;

/*
select internet_service_type_id, internet_service_type
from internet_service_types;
*/

select pay.customer_id, ist.internet_service_type,
			pay.average_charges
			from (select customer_id, avg(monthly_charges) as average_charges
					from customer_payments
					group by customer_id
					) pay
			join customer_subscriptions sub ON pay.customer_id = sub.customer_id
			join internet_service_types ist on sub.internet_service_type_id = ist.internet_service_type_id;


select pay.customer_id, ist.internet_service_type,
			pay.average_charges
			from (select customer_id, avg(monthly_charges) as average_charges
					from customer_payments
					group by customer_id
					) pay
			join (select customer_id, internet_service_type_id from customer_subscriptions) sub 
						ON pay.customer_id = sub.customer_id
			join (select internet_service_type_id, internet_service_type from internet_service_types) ist 
						on sub.internet_service_type_id = ist.internet_service_type_id;
