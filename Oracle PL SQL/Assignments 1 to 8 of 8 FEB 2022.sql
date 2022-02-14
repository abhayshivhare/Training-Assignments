-JOINS
 -----------------------------------------------

SELECT 
    c.customer_id,c.name,o.order_date,o.status
FROM
    customers c
JOIN
    orders o
ON
    c.customer_id=o.customer_id
ORDER BY
    order_date;
    
 -----

SELECT 
    p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
FROM
    products p
JOIN
    order_items o
ON
    p.product_id=o.product_id
JOIN
    inventories i
ON
    p.product_id=i.product_id
ORDER BY
    p.product_id;
    
 -----------------------------------------------#
--RIGHT JOIN
 -----------------------------------------------#

SELECT 
    c.customer_id,c.name,o.order_date,o.status
FROM
    customers c
RIGHT JOIN
    orders o
ON
    c.customer_id=o.customer_id
ORDER BY
    order_date;

-----------


SELECT 
    p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
FROM
    products p
RIGHT JOIN
    order_items o
ON
    p.product_id=o.product_id
RIGHT JOIN
    inventories i
ON
    p.product_id=i.product_id
ORDER BY
    p.product_id;
    
 -----------------------------------------------#
--LEFT JOIN
 -----------------------------------------------#

SELECT 
    c.customer_id,c.name,o.order_date,o.status
FROM
    customers c
LEFT JOIN
    orders o
ON
    c.customer_id=o.customer_id
ORDER BY
    order_date;

---------------------

SELECT 
    p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
FROM
    products p
LEFT JOIN
    order_items o
ON
    p.product_id=o.product_id
LEFT JOIN
    inventories i
ON
    p.product_id=i.product_id
ORDER BY
    p.product_id;
      
 -----------------------------------------------#
--FULL OUTER JOIN
 -----------------------------------------------#

SELECT 
    c.customer_id,c.name,o.order_date,o.status
FROM
    customers c
FULL OUTER JOIN
    orders o
ON
    c.customer_id=o.customer_id
ORDER BY
    order_date;

-----------

SELECT 
    p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
FROM
    products p
FULL OUTER JOIN
    order_items o
ON
    p.product_id=o.product_id
LEFT JOIN
    inventories i
ON
    p.product_id=i.product_id
ORDER BY
    p.product_id;
  
    
 -----------------------------------------------#
--SELF JOIN
 -----------------------------------------------#

SELECT 
    e1.employee_id,e1.first_name,e1.email,e2.manager_id
FROM
    employees e1
JOIN 
    employees e2
ON
    e1.employee_id=e2.manager_id


    
 -----------------------------------------------#
--CROSS JOIN
 -----------------------------------------------#

SELECT 
    c.customer_id,c.name,o.order_date,o.status
FROM
    customers c
 CROSS JOIN
    orders o
ORDER BY
    order_date;
    
-------------

SELECT 
    p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
FROM
    products p
CROSS JOIN
    order_items o, inventories i
ORDER BY
    p.product_id;
  
 -------------------------------------------
--ANY
 -------------------------------------------

SELECT
    product_name,
    list_price
FROM
    products
WHERE
    list_price > ANY(
        2200,
        2259.99,
        2269.99
    )
    AND category_id = 1
ORDER BY
    list_price DESC;
    
 -------------------------------------------
--ALL
 -------------------------------------------

SELECT
    product_name,
    list_price
FROM
    products
WHERE
    list_price <= ALL(
        977.99,
        1000,
        2200
    )
    AND category_id = 1
ORDER BY
    list_price DESC;
    
---------------

SELECT
    product_name,
    list_price
FROM
    products
WHERE
    list_price >= ALL(
        1000,
        1500,
        2200
    )
    AND category_id = 1
    
###########################################
CHECK


--###########
--CREATING TABLES
--#############

CREATE TABLE brands(
	brand_id NUMBER CONSTRAINT pk_brands_brandid PRIMARY KEY,
	brand_name VARCHAR2(50) NOT NULL
);

CREATE TABLE cars (
	car_id NUMBER,
	car_name VARCHAR2(255) NOT NULL,
	brand_id NUMBER NOT NULL,
	PRIMARY KEY(car_id),
	FOREIGN KEY(brand_id) 
	REFERENCES brands(brand_id) ON DELETE CASCADE
);

 -------------------------------------------#
--INSERING VALUES
 -----------------------------------------------#

INSERT INTO brands
VALUES(1,'Audi');

INSERT INTO brands
VALUES(2,'BMW');

INSERT INTO brands
VALUES(3,'Ford');

INSERT INTO brands
VALUES(4,'Honda');

INSERT INTO brands
VALUES(5,'Toyota');

INSERT INTO cars 
VALUES(1,'Audi R8 Coupe',1);

INSERT INTO cars
VALUES(2,'Audi Q2',1);

INSERT INTO cars
VALUES(3,'Audi S1',1);

INSERT INTO cars
VALUES(4,'BMW 2-serie Cabrio',2);

INSERT INTO cars
VALUES(5,'BMW i8',2);

INSERT INTO cars
VALUES(6,'Ford Edge',3);

INSERT INTO cars 
VALUES(7,'Ford Mustang Fastback',3);

INSERT INTO cars
VALUES(8,'Honda S2000',4);

INSERT INTO cars
VALUES(9,'Honda Legend',4);

INSERT INTO cars 
VALUES(10,'Toyota GT86',5);

INSERT INTO cars
VALUES(11,'Toyota C-HR',5);

 -----------------------------------------------##

SELECT
	*
FROM
	brands;

---------

SELECT
	*
FROM
	cars;

 -------------------------------------------
--CREATING VIEWS
 -------------------------------------------#

CREATE VIEW audi_cars AS 
SELECT
        car_id,
        car_name,
        brand_id
    FROM
        cars
    WHERE
        brand_id = 1;

-----

SELECT
    *
FROM
    audi_cars;

-----------

INSERT
    INTO
        audi_cars(
            car_id,car_name,
            brand_id
        )
    VALUES(
        12,'BMW Z3 coupe',
        2
    ); 
    
------------

UPDATE
    audi_cars
SET
    car_name = 'BMW 1-serie Coupe',
    brand_id = 2
WHERE
    car_id = 3;

---------

SELECT
    *
FROM
    audi_cars;

----------------------
 -------------------------------------------####

CREATE VIEW ford_cars AS 
SELECT
        car_id,
        car_name,
        brand_id
    FROM
        cars
    WHERE
        brand_id = 3 WITH CHECK OPTION;
        
-------

INSERT INTO
        ford_cars(
            car_id,car_name,
            brand_id
        )
    VALUES(
        13,'Audi RS6 Avant',
        1
    );

-----------

UPDATE
    ford_cars
SET
    brand_id = 4,
    car_name = 'Honda NSX'
WHERE
    car_id = 6;
    
    
    
###############
--ORACLE VIEW
--###########

SELECT
    name,
    credit_limit
FROM
    customers;

--------

SELECT
    name AS customer,
    SUM( quantity * unit_price ) sales_amount,
    EXTRACT(
        YEAR
    FROM
        order_date
    ) YEAR
FROM
    orders
INNER JOIN order_items
        USING(order_id)
INNER JOIN customers
        USING(customer_id)
WHERE
    status = 'Shipped'
GROUP BY
    name,
    EXTRACT(
        YEAR
    FROM
        order_date
    );

---------------

CREATE OR REPLACE VIEW customer_sales AS 
SELECT
    name AS customer,
    SUM( quantity * unit_price ) sales_amount,
    EXTRACT(
        YEAR
    FROM
        order_date
    ) YEAR
FROM
    orders
INNER JOIN order_items
        USING(order_id)
INNER JOIN customers
        USING(customer_id)
WHERE
    status = 'Shipped'
GROUP BY
    name,
    EXTRACT(
        YEAR
    FROM
        order_date
    );

---------------

SELECT
    customer,
    sales_amount
FROM
    customer_sales
WHERE
    YEAR = 2017
ORDER BY
    sales_amount DESC;
    
#################################

-################
--CREATING VIEW
 -------------------------------------------#

CREATE VIEW cars_master AS 
SELECT
    car_id,
    car_name
FROM
    cars;

--DELETING ROW FROM CARS_MASTER VIEW 

DELETE
FROM
    cars_master
WHERE
    car_id = 1;

------UPDATING VIEW

UPDATE
    cars_master
SET
    car_name = 'Audi RS7 Sportback'
WHERE
    car_id = 2;

--INSERTING VALUE giving error

INSERT INTO cars_master
VALUES('Audi S1 Sportback');

--############
--CREATING UPDATEABLE JOIN VIEW
--#############

CREATE VIEW all_cars AS 
SELECT
    car_id,
    car_name,
    c.brand_id,
    brand_name
FROM
    cars c
INNER JOIN brands b ON
    b.brand_id = c.brand_id; 

---------

INSERT INTO all_cars(car_id,car_name, brand_id )
VALUES(13,'Audi A5 Cabriolet', 1);

-----------------

SELECT
    *
FROM
    USER_UPDATABLE_COLUMNS
WHERE
    TABLE_NAME = 'ALL_CARS';
    
    
########################################
--#############
--FETCH 
--##############

SELECT
    product_name,
    quantity
FROM
    inventories
INNER JOIN products
        USING(product_id)
ORDER BY
    quantity DESC 
FETCH NEXT 10 ROWS ONLY;

------TIES

SELECT
	product_name,
	quantity
FROM
	inventories
INNER JOIN products
		USING(product_id)
ORDER BY
	quantity DESC 
FETCH NEXT 10 ROWS WITH TIES;

---PERcent

SELECT
    product_name,
    quantity
FROM
    inventories
INNER JOIN products
        USING(product_id)
ORDER BY
    quantity DESC 
FETCH FIRST 5 PERCENT ROWS ONLY;

--OFFSET

SELECT
	product_name,
	quantity
FROM
	inventories
INNER JOIN products
		USING(product_id)
ORDER BY
	quantity DESC 
OFFSET 10 ROWS 
FETCH NEXT 10 ROWS ONLY;


#####################################

##########
--INLINE QUERY
--#############

SELECT
    *
FROM
    (
        SELECT
            product_id,
            product_name,
            list_price
        FROM
            products
        ORDER BY
            list_price DESC
    )
WHERE
    ROWNUM <= 10;
    
--JOIN 

SELECT
    category_name,
    max_list_price
FROM
    product_categories a,
    (
        SELECT
            category_id,
            MAX( list_price ) max_list_price
        FROM
            products
        GROUP BY
            category_id
    ) b
WHERE
    a.category_id = b.category_id
ORDER BY
    category_name;

---USE OF LATERAL

SELECT
    category_name,
    product_name
FROM
    products p,
    (
        SELECT
            *
        FROM
            product_categories c
        WHERE
            c.category_id = p.category_id
    )
ORDER BY
    product_name;

------

SELECT
    product_name,
    category_name
FROM
    products p,
    LATERAL(
        SELECT
            *
        FROM
            product_categories c
        WHERE
            c.category_id = p.category_id
    )
ORDER BY
    product_name;
    
--------------

UPDATE
    (
        SELECT
            list_price
        FROM
            products
        INNER JOIN product_categories using (category_id)
        WHERE
            category_name = 'CPU'
    )
SET
    list_price = list_price * 1.15; 
    
------

DELETE
    (
        SELECT
            list_price
        FROM
            products
        INNER JOIN product_categories
                USING(category_id)
        WHERE
            category_name = 'Video Card'
    )
WHERE
    list_price < 1000; 

commit;