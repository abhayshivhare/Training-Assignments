------------------------------
--CREATING INDEX
-------------------------------##

SELECT first_name FROM employees WHERE first_name LIKE 'S%';

CREATE INDEX i_employees_firstname
ON employees(first_name);

-------------

SELECT 
    index_name, 
    index_type, 
    visibility, 
    status 
FROM 
    all_indexes
WHERE 
    table_name = 'employees';
    
-------------

EXPLAIN PLAN FOR
SELECT * FROM employees WHERE first_name LIKE 'S%';

-----------

SELECT 
    PLAN_TABLE_OUTPUT 
FROM 
    TABLE(DBMS_XPLAN.DISPLAY());

-------------------------------###
--REMOVING INDEX
-------------------------------#####

DROP INDEX i_employees_firstname;

-------------------------------
--CREATING UNIQUE INDEX
-------------------------------##

CREATE UNIQUE INDEX ui_employees_lastname
ON employees(last_name);


--------------------------------------------------

------------------------------
--SYNONYM
--################

CREATE SYNONYM users
FOR customers;

select name from users;

DROP SYNONYM users;

CREATE PUBLIC SYNONYM users
FOR customers;

select name from users;

DROP PUBLIC SYNONYM users;

-------------------------------########
--SEQUENCE
-------------------------------########

CREATE SEQUENCE id_seq
    INCREMENT BY 10
    START WITH 10
    MINVALUE 10
    MAXVALUE 100
    CYCLE
    CACHE 2;

SELECT 
    id_seq.NEXTVAL 
FROM 
    dual;
    
CREATE SEQUENCE invoice_seq
    START WITH 2022;

ALTER SEQUENCE invoice_seq
CACHE 10;

DROP SEQUENCE invoice_seq;

-------------------------------#####
--ROLES
-------------------------------######

CREATE ROLES mdm;


GRANT SELECT, INSERT, UPDATE, DELETE
ON products
TO mdm;

SET ROLE mdm;

DROP ROLE mdm;

COMMIT;