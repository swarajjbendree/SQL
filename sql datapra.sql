SELECT * FROM phoness.product;
drop table product;
CREATE TABLE product
(
    product_category varchar(255),
    brand varchar(255),
    product_name varchar(255),
    price int
);
INSERT INTO product VALUES
('Phone', 'Apple', 'iPhone 12 Pro Max', 1300),
INSERT INTO product VALUES
('Phone', 'Apple', 'iPhone 12 Pro', 1100),
INSERT INTO product VALUES
('Phone', 'Apple', 'iPhone 12', 1000)
,
('Phone', 'Samsung', 'Galaxy Z Fold 3', 1800);
('Phone', 'Samsung', 'Galaxy Z Flip 3', 1000),
('Phone', 'Samsung', 'Galaxy Note 20', 1200),
('Phone', 'Samsung', 'Galaxy S21', 1000),
('Phone', 'OnePlus', 'OnePlus Nord', 300),
('Phone', 'OnePlus', 'OnePlus 9', 800),
('Phone', 'Google', 'Pixel 5', 600),
('Laptop', 'Apple', 'MacBook Pro 13', 2000),
('Laptop', 'Apple', 'MacBook Air', 1200),
('Laptop', 'Microsoft', 'Surface Laptop 4', 2100),
('Laptop', 'Dell', 'XPS 13', 2000),
('Laptop', 'Dell', 'XPS 15', 2300),
('Laptop', 'Dell', 'XPS 17', 2500),
('Earphone', 'Apple', 'AirPods Pro', 280),
('Earphone', 'Samsung', 'Galaxy Buds Pro', 220),
('Earphone', 'Samsung', 'Galaxy Buds Live', 170),
('Earphone', 'Sony', 'WF-1000XM4', 250),
('Headphone', 'Sony', 'WH-1000XM4', 400),
('Headphone', 'Apple', 'AirPods Max', 550),
('Headphone', 'Microsoft', 'Surface Headphones 2', 250),
('Smartwatch', 'Apple', 'Apple Watch Series 6', 1000),
('Smartwatch', 'Apple', 'Apple Watch SE', 400),
('Smartwatch', 'Samsung', 'Galaxy Watch 4', 600),
('Smartwatch', 'OnePlus', 'OnePlus Watch', 220);

INSERT INTO product VALUES

('Phone', 'Apple', 'iPhone 12', 1000),
('Phone', 'Samsung', 'Galaxy Z Fold 3', 1800),
('Phone', 'Samsung', 'Galaxy Z Flip 3', 1000),
('Phone', 'Samsung', 'Galaxy Note 20', 1200),
('Phone', 'Samsung', 'Galaxy S21', 1000),
('Phone', 'OnePlus', 'OnePlus Nord', 300),
('Phone', 'OnePlus', 'OnePlus 9', 800),
('Phone', 'Google', 'Pixel 5', 600),
('Laptop', 'Apple', 'MacBook Pro 13', 2000),
('Laptop', 'Apple', 'MacBook Air', 1200),
('Laptop', 'Microsoft', 'Surface Laptop 4', 2100),
('Laptop', 'Dell', 'XPS 13', 2000),
('Laptop', 'Dell', 'XPS 15', 2300),
('Laptop', 'Dell', 'XPS 17', 2500),
('Earphone', 'Apple', 'AirPods Pro', 280),
('Earphone', 'Samsung', 'Galaxy Buds Pro', 220),
('Earphone', 'Samsung', 'Galaxy Buds Live', 170),
('Earphone', 'Sony', 'WF-1000XM4', 250),
('Headphone', 'Sony', 'WH-1000XM4', 400),
('Headphone', 'Apple', 'AirPods Max', 550),
('Headphone', 'Microsoft', 'Surface Headphones 2', 250),
('Smartwatch', 'Apple', 'Apple Watch Series 6', 1000),
('Smartwatch', 'Apple', 'Apple Watch SE', 400),
('Smartwatch', 'Samsung', 'Galaxy Watch 4', 600),
('Smartwatch', 'OnePlus', 'OnePlus Watch', 220);
COMMIT;
select * from product;
use phoness.product;

-- 7) Write query to display the most expensive product under each category (corresponding to each record);

select*,
dense_rank() over( partition by product_category order by price desc) as rankingg
from product;

select*
from(select*,
dense_rank() over( partition by product_category order by price desc) as rankingg
from product
)t
where rankingg <2;

-- FIRST_value, LAST_VALUE, NTH_VALUE

select * ,
first_value(product_name) over ( partition by product_category order by price desc) as fristvalues
from product;

select * from product;

-- 8) Write query to display the most & least expensive product 
-- under each category

select * ,
first_value(product_name) over ( partition by product_category order by price desc) as fristvalues,
last_value(product_name) over ( partition by product_category order by price desc) as lasttvalues
from product;

select *,
 first_value(product_name)
        over(partition by product_category order by price desc) as most_exp_prod
, last_value(product_name)
        over(partition by product_category order by price desc
             range between unbounded preceding and current row) as least_exp_prod
, last_value(product_name)
        over(partition by product_category order by price desc
             range between unbounded preceding and unbounded following) as least_exp_prod_correct
, first_value(product_name)
        over(partition by product_category order by price
            range between unbounded preceding and unbounded following) as least_exp_prod_asc
, first_value(product_name)
        over(partition by product_category order by price   ) as least_exp_prod_asc
from product;


select *,
first_value(product_name)
        over(partition by product_category order by price desc) as most_exp_prod;
select *,
first_value(product_name)over(partition by product_category order by price desc),

first_value(product_name)
        over(partition by product_category order by price desc
             range between unbounded preceding and unbounded following) as least_exp_prod_correct,
 
 last_value(product_name)
        over(partition by product_category order by price desc
             range between unbounded preceding and current row) as least_exp_prod,

last_value(product_name)
        over(partition by product_category order by price desc
             range between unbounded preceding and unbounded following) as least_exp_prod_correct
from product;


-- 9) Write query to display the Second most expensive product under each category.

select *
, first_value(product_name)
        over(partition by product_category order by price desc) as most_exp_prod
, last_value(product_name)
        over(partition by product_category order by price desc
            range between unbounded preceding and unbounded following) as least_exp_prod
, nth_value(product_name, 2)
        over (partition by product_category order by price desc
             range between unbounded preceding and unbounded following) as second_most_exp_prod
from product;


