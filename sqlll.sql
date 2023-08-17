create database priya;
use priya;
create table contacts
(
    product_category varchar(255),
    brand varchar(255),
    product_name varchar(255),
    price int
);
select * from contacts;
INSERT INTO contacts VALUES
('Phone', 'Apple', 'iPhone 12 Pro Max', 1300);

INSERT INTO contacts VALUES
('Phone', 'Apple', 'iPhone 12', 1000),
('Phone', 'Samsung', 'Galaxy Z Fold 3', 1800),
('Phone', 'Samsung', 'Galaxy Z Flip 3', 1000),
('Phone', 'Samsung', 'Galaxy Note 20', 1200),
('Phone', 'Samsung', 'Galaxy S21', 1000),
('Phone', 'OnePlus', 'OnePlus Nord', 300),
('Phone', 'OnePlus', 'OnePlus 9', 800);
 select * from contacts;
 select count( brand ) from contacts;
 select max(product_name) from contacts;