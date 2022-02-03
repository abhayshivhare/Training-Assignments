SELECT 
		username, 
		default_tablespace, 
		profile, 
		authentication_type
	FROM
		dba_users 
	WHERE 
		account_status = 'OPEN'
	ORDER BY
		username
	dba_users 
	WHERE 
		account_status = 'OPEN'
	ORDER BY
		username
        
GRANT create session TO c##erpuser;
GRANT create table TO  c##erpuser;
GRANT create view TO c##erpuser;
GRANT create any trigger TO c##erpuser;
GRANT create any procedure TO c##erpuser;
GRANT create sequence TO c##erpuser;
GRANT create synonym TO c##erpuser;
GRANT ALL PRIVILEGES TO c##erpuser;
GRANT CONNECT TO c##erpuser;


GRANT RESOURCE TO c##erpuser;
GRANT DBA TO c##erpuser;
GRANT DBA TO c##erpuser;


connect c##erpuser/root


CREATE TABLE BRANCH (
		BRANCHNO	INT CONSTRAINT PK_BRANCH_BRANCHNO PRIMARY KEY,
		BRANCHNAME  VARCHAR2(20) NOT NULL,
		LOCATION    VARCHAR2(20) NOT NULL
        );

drop table branch;


CREATE TABLE BRANCH (
		BRANCHNO	INT CONSTRAINT PK_BRANCH_BRANCHNO PRIMARY KEY,
		BRANCHNAME  VARCHAR2(20) NOT NULL,
		LOCATION    VARCHAR2(20) NOT NULL 
	);


CREATE TABLE DEPT    (
		DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
		DNAME VARCHAR2(14), 
		BRANCHNO	INT CONSTRAINT FK_DEPT_BRANCHNO REFERENCES BRANCH
	);


ALTER TABLE DEPT
    MODIFY DNAME VARCHAR2(14) NOT NULL UNIQUE;


CREATE TABLE EMP(
		EMPNO 		NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
		ENAME 		VARCHAR2(10),
		JOB 		VARCHAR2(9),
		MGR 		NUMBER(4),
		HIREDATE 	DATE,
		SAL 		NUMBER(7,2),
		COMM 		NUMBER(7,2),
		DEPTNO 		NUMBER(2) CONSTRAINT FK_EMP_DEPTNO REFERENCES DEPT,
		BRANCHNO 	INT CONSTRAINT FK_EMP_BRANCHNO REFERENCES BRANCH
	);
    
    
    INSERT INTO BRANCH VALUES 	(101,'Geneva','NEW YORK');
	INSERT INTO BRANCH VALUES 	(102,'Geneva','NEW YORK');
	INSERT INTO BRANCH VALUES 	(103,'CHICAGO','CHICAGO');
	INSERT INTO BRANCH VALUES 	(104,'CHICAGO','CHICAGO');
	INSERT INTO BRANCH VALUES 	(105,'Kingston','NEW YORK');
	INSERT INTO BRANCH VALUES 	(106,'Kingston','NEW YORK');
    
    
    INSERT INTO DEPT VALUES	(10,'ACCOUNTING',101);
	INSERT INTO DEPT VALUES (20,'RESEARCH',103);
	INSERT INTO DEPT VALUES	(30,'SALES',105);
	INSERT INTO DEPT VALUES	(40,'OPERATIONS',106);


INSERT INTO EMP VALUES(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20,102);
INSERT INTO EMP VALUES(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30,102);
INSERT INTO EMP VALUES(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30,103);
INSERT INTO EMP VALUES(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20,104);
INSERT INTO EMP VALUES(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30,105);
INSERT INTO EMP VALUES(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30,105);
INSERT INTO EMP VALUES(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10,102);
INSERT INTO EMP VALUES(7788,'SCOTT','ANALYST',7566,to_date('13-JUL-87')-85,3000,NULL,20,103);
INSERT INTO EMP VALUES(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,NULL,101);
INSERT INTO EMP VALUES(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30,104);
INSERT INTO EMP VALUES(7876,'ADAMS','CLERK',7788,to_date('13-JUL-87')-51,1100,NULL,20,105);
INSERT INTO EMP VALUES(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30,103);
INSERT INTO EMP VALUES(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20,105);
INSERT INTO EMP VALUES(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10,104);
INSERT INTO EMP VALUES(7901,'JOHN_SMITH','CLERK',7698,to_date('23-1-1982','dd-mm-yyyy'),3000,NULL,30,104);

COMMIT;

SELECT  * FROM dept;

SELECT deptno,dname,branchno FROM dept;

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno  
FROM
    emp
ORDER BY 
    empno;

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno  
FROM
    emp
ORDER BY 
    job,empno;

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno  
FROM
    emp
ORDER BY 
    empno, job;

SELECT 
    deptno,empno,ename,job,mgr,hiredate,sal,comm,branchno    
FROM
    emp
ORDER BY
    deptno,empno;

SELECT branchno, branchname,location FROM branch;

SELECT * FROM branch;

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno  
FROM
    emp
ORDER BY
    deptno;

SELECT 
    deptno,empno,ename,job,mgr,hiredate,sal,comm,branchno    
FROM
    emp
ORDER BY
    deptno,empno DESC;

SELECT
    deptno,empno,ename,job,mgr,hiredate,sal,comm,branchno
FROM 
    emp
ORDER BY
    deptno,sal;

SELECT 
    deptno,empno,ename,job,mgr,hiredate,sal,comm,branchno
FROM 
    emp
ORDER BY
    sal;

SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
WHERE deptno=10;

SELECT 
    empno,ename,deptno
FROM
    emp
WHERE deptno=10;


SELECT 
    empno,ename,deptno
FROM
    emp
WHERE 
    deptno=10 or deptno=20;

SELECT 
    empno,ename,deptno
FROM
    emp
WHERE 
    deptno IN (10,20);


SELECT
    empno,ename,deptno
FROM
    emp
WHERE
    deptno not in (10,20,30);


SELECT
    empno,ename,deptno
FROM
    emp
WHERE
    deptno is null;
    


-- ################################################################
-- 12.8 Display all employees not earning any commission
-- ################################################################
SELECT
    empno,ename,comm
FROM
    emp
WHERE 
    comm is null or comm = 0;

-- ################################################################
-- 12.9 Display all employees earning salary in range 1000 to 3000 including boundry values
-- ################################################################

SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal>=1000 and sal<=3000
ORDER BY
    sal;
    
    

SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal BETWEEN 1000 AND 3000
ORDER BY
    sal;



-- ################################################################
-- 12.10 Display all employees earning salary in range 1000 to 3000 excluding boundry values
-- ################################################################
SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal>1000 and sal<3000
ORDER BY
    sal;

SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal BETWEEN 1001 AND 2999
ORDER BY
    sal;

SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal BETWEEN (1000+1) AND (3000-1)
ORDER BY
    sal;


-- ################################################################
-- 12.11 Display all employees earning salary not in range 1000 to 3000
-- ################################################################
SELECT
    empno,ename,sal
FROM
        emp
WHERE
    sal not between 1000 and 3000
ORDER BY
    sal;


-- ################################################################
-- 12.12 Display all employees earning 5000salary 
-- ################################################################
SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal=5000
ORDER BY 
    sal;


	

-- ################################################################
-- 13. Where caluse with like
--     WHERE WITH ESCAPE Clause
--   = comparison ->equality-> exact match
-- ################################################################
-- ################################################################
-- 13.1 Display all details of SMITH
-- ################################################################
SELECT
    empno,ename
FROM
    emp
WHERE
    ename='SMITH'
ORDER BY
    ename;
--    below query won't return any record as data saved in a cell is Case Sensetive
SELECT
    empno,ename
FROM
    emp
WHERE
    ename='Smith'
ORDER BY
    ename;    

-- ################################################################
-- 13.2 Display all details of EMPLOYEE who's name starts with S
-- ################################################################
SELECT
    empno,ename
FROM
    emp
WHERE
    ename LIKE 'S%'
ORDER BY
    ename;    

-- ################################################################
-- 13.3 Display all details of EMPLOYEE who's name ends with S
-- ################################################################
SELECT
    empno,ename
FROM
    emp
WHERE
    ename LIKE '%S'
ORDER BY
    ename;    

-- ################################################################
-- 13.4 Display all details of EMPLOYEE who's name contains LL
-- ################################################################
SELECT
    empno,ename
FROM
    emp
WHERE
    ename LIKE '%LL%'
ORDER BY
    ename;    


-- ################################################################
-- 13.5 Display all details of EMPLOYEE who's name contains _
-- ################################################################
SELECT
    empno,ename
FROM
    emp
WHERE
    ename LIKE '%\_%' ESCAPE '\' 
ORDER BY
    ename;    

-- ################################################################
-- 14. Aggregate Function max,min,sum,avg,count 
--     SUM
--     AVG
--     COUNT
--     MAX
--     MIN
-- ################################################################
-- 14.1 Display count of employees
-- count(*) including null values 
-- ################################################################
SELECT
    COUNT(*)
FROM 
    emp;
-- ################################################################
-- 14.2 Display count of employees WORKING IN SOME DEPT
-- count(deptno) excludes the null vlaue 
-- ################################################################
SELECT
    COUNT(*),COUNT(deptno),COUNT(EMPNO)
FROM
    emp;
-- ################################################################
-- 14.3 Display max,min,sum,avg salary of employees
-- ################################################################
SELECT
    MIN(sal),MAX(sal),SUM(sal),AVG(sal),COUNT(sal)
FROM 
    emp;


-- ################################################################
-- 15. Aggregate Function max,min,sum,avg,count  and grouping
-- ################################################################
-- 15.1 Display department wise count of employees
-- ################################################################
SELECT
        deptno,count(empno)
FROM
        emp
GROUP BY 
        deptno
ORDER BY 
        deptno;

-- 15.1 Display  job wise count of employees                
SELECT
        job,count(empno)
FROM
        emp
GROUP BY 
        job
ORDER BY 
        count(empno);
       
	-- ################################################################
-- 15.2 Display department wise max,min,avg salary
-- ################################################################
SELECT
    deptno,min(sal),max(sal),avg(sal),sum(sal)
FROM
    emp
GROUP BY
        deptno
ORDER BY 
        deptno;
 

-- ################################################################
-- 15.2 Display department wise max,min,avg salary
-- ################################################################
SELECT
    deptno,min(sal),max(sal),avg(sal),sum(sal)
FROM
    emp
GROUP BY
        deptno
ORDER BY 
        deptno;


SELECT
    deptno,min(sal),max(sal),round(avg(sal),2),sum(sal)
FROM
    emp
GROUP BY
        deptno
HAVING 
        deptno=30
ORDER BY 
        deptno;
-- ################################################################
-- 15.3 Display department wise max,min,avg salary where avg(sal)<2500
-- ################################################################
SELECT 
    deptno,min(sal),max(sal),avg(sal),sum(sal)
FROM
        emp
GROUP BY
        deptno
HAVING 
        avg(sal)<2500
ORDER BY
        deptno;


-- ################################################################
-- 16. Special functions nvl() 
-- If comm is null display 0
-- ################################################################
SELECT
    empno,ename,sal,comm, sal+comm
FROM 
    emp
ORDER BY
    empno;

-- correct solution
SELECT
    empno,ename,sal,comm, sal+nvl(comm,0)
FROM 
    emp
ORDER BY
    comm;
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
1. OracleTutorial reading + queries execution ->git
2. Assignment 30+ -> git


######################2 FEB 2022


create table temp1(
id int primary key,
data varchar2(34)
);

insert into temp1 values(1,'some data');
insert into temp1 values(2,'some data');
insert into temp1 values(3,'some data');
insert into temp1 values(4,'some data');

select * from temp1;

delete from temp1 where id=4;
--ORA-00001: unique constraint (C##ERPUSER.SYS_C008348) violated

DROP TABLE temp1;

create table temp1(
id int GENERATED BY DEFAULT AS IDENTITY START WITH 10 PRIMARY KEY,
data varchar2(34)
);

insert into temp1(data) values('some data');
insert into temp1(data) values('some data');
insert into temp1(data) values('some data');
insert into temp1 (data)values('some data');

select * from temp1;

create table temp2(
id int GENERATED BY DEFAULT AS IDENTITY START WITH 10 PRIMARY KEY,
data varchar2(34)
);
-- ################################################################
-- Text Literal Example 
-- The text literal '10' has datatype CHAR. 
-- Oracle implicitly converts it to the NUMBER datatype if it appears in a numeric 
-- expression as in the following statement:
-- ################################################################
-- 17. Display employees salary +10
-- ################################################################
SELECT
    empno,ename,sal,sal+10, sal+'10'
FROM 
    emp;
-- ################################################################
-- Date Example
-- In the following statement, Oracle implicitly converts '03-Dec-81' 
-- to a DATE value using the default date format 'DD-MON-YY':
-- ################################################################
-- 18, Display details of employees join on 3rd Dec'1981
-- ################################################################
SELECT 
    empno,ename,hiredate
FROM 
    emp
WHERE
    hiredate='03-Dec-81';
-- Second way
SELECT 
    empno,ename,hiredate
FROM 
    emp
WHERE
    hiredate=to_date('03-12-1981','dd-mm-yyyy');
    
-- ################################################################
-- to_char()
-- ################################################################
SELECT TO_CHAR('01110') FROM DUAL;
SELECT TO_CHAR('65') FROM DUAL;    

-- ################################################################
-- to_char(datetime)
--  converts a datetime or interval value of DATE, TIMESTAMP, TIMESTAMP WITH TIME ZONE, 
--  or TIMESTAMP WITH LOCAL TIME ZONE datatype to a value of VARCHAR2 datatype in the 
--  format specified by the date format fmt.
-- ################################################################
CREATE TABLE date_tab (
   ts_col      TIMESTAMP,--dd-mm-yyyy hh:MM:ss
   tsltz_col   TIMESTAMP WITH LOCAL TIME ZONE,--dd-mm-yyyy hh:MM:ss
   tstz_col    TIMESTAMP WITH TIME ZONE);

-- ################################################################
-- The example shows the results of applying TO_CHAR to different TIMESTAMP datatypes.
--  The result for a TIMESTAMP WITH LOCAL TIME ZONE column is sensitive to session time zone, 
-- whereas the results for the TIMESTAMP and TIMESTAMP WITH TIME ZONE columns are not sensitive 
-- to session time zone:
-- ################################################################
ALTER SESSION SET TIME_ZONE = '+8:00';
INSERT INTO date_tab VALUES (  
   TIMESTAMP'1999-12-01 10:00:00',
   TIMESTAMP'1999-12-01 10:00:00',
   TIMESTAMP'1999-12-01 10:00:00');
INSERT INTO date_tab VALUES (
   TIMESTAMP'1999-12-02 10:00:00 -8:00', 
   TIMESTAMP'1999-12-02 10:00:00 -8:00',
   TIMESTAMP'1999-12-02 10:00:00 -8:00');
-- ################################################################
ALTER SESSION SET TIME_ZONE = '+5:30';
INSERT INTO date_tab VALUES (  
   TIMESTAMP'1999-12-01 10:00:00',
   TIMESTAMP'1999-12-01 10:00:00',
   TIMESTAMP'1999-12-01 10:00:00');
INSERT INTO date_tab VALUES (
   TIMESTAMP'1999-12-02 10:00:00 +5:30', 
   TIMESTAMP'1999-12-02 10:00:00 +5:30',
   TIMESTAMP'1999-12-02 10:00:00 +5:30');
-- ################################################################
-- record        02-DEC-99 10.00.00.000000000 AM +05:30   
-- query output: 02-DEC-1999 10:00:00.000000 +05:30
-- ################################################################
SELECT TO_CHAR(ts_col, 'DD-MON-YYYY HH24:MI:SSxFF'),
   TO_CHAR(tstz_col, 'DD-MON-YYYY HH24:MI:SSxFF TZH:TZM')
   FROM date_tab;
-- ################################################################   
SELECT SESSIONTIMEZONE,    TO_CHAR(tsltz_col, 'DD-MON-YYYY HH24:MI:SSxFF')
   FROM date_tab;
   
ALTER SESSION SET TIME_ZONE = '-5:00';
SELECT TO_CHAR(ts_col, 'DD-MON-YYYY HH24:MI:SSxFF'),    TO_CHAR(tstz_col, 'DD-MON-YYYY HH24:MI:SSxFF TZH:TZM')
   FROM date_tab;
   
SELECT SESSIONTIMEZONE,    TO_CHAR(tsltz_col, 'DD-MON-YYYY HH24:MI:SSxFF')     FROM date_tab;
-- ################################################################   
--0+1=1
--1+1=0 cary 1
-- ################################################################   
SELECT TO_CHAR('01110' + 1) FROM dual;   
-- ################################################################   

-- ################################################################
-- In the next example, the output is blank padded to the left of the currency symbol.
-- ################################################################
SELECT TO_CHAR(-10000,'L99G999D99MI') "Amount"     FROM DUAL;
SELECT TO_CHAR(-10000,'L99G999D99MI',   'NLS_NUMERIC_CHARACTERS = '',.''   NLS_CURRENCY = ''AusDollars'' ') "Amount"
     FROM DUAL;

SELECT TO_DATE('January 15, 1989, 11:00 A.M.','Month dd, YYYY, HH:MI A.M.', 'NLS_DATE_LANGUAGE = American')     FROM DUAL;
-- ################################################################
SELECT 
    deptno, dname
FROM 
    dept;
-- ################################################################
10	ACCOUNTING
40	OPERATIONS
20	RESEARCH
30	SALES
-- Decode the department no in employee table as above
SELECT 
    empno,ename,deptno 
FROM 
    emp;
-- ################################################################
SELECT 
    empno,ename,deptno,
    DECODE(deptno,
            10,	'ACCOUNTING',
            40,	'OPERATIONS',
            20,	'RESEARCH',
            30,	'SALES',
            'No Specific Department') as departmen_name
    FROM 
        emp;
--  Giving meaning full name to the value
create table colors(
id int,
colorcode varchar2(7) 
);
drop table colors;
insert into colors values(1,'#ff0000');
insert into colors values(2,'#00ff00');
insert into colors values(3,'#0000ff');
insert into colors values(4,null);

select id,colorcode,DECODE(colorcode,
'#ff0000','red','#00ff00','green','#0000ff','blue','No Color'
) as colorname from colors;

-- ################################################################
-- 						CASE statement
-- CASE statement has the functionality of an IF-THEN-ELSE statement	
-- The CASE statement returns any datatype such as a string, numeric, date, etc. 
-- (BUT all results must be the same datatype in the CASE statement.)
-- If all conditions are not the same datatype, an ORA-00932 error will be returned.
-- If all results are not the same datatype, an ORA-00932 error will be returned.
-- If no condition is found to be true, then the CASE statement will return the value in the ELSE clause.
-- If the ELSE clause is omitted and no condition is found to be true, then the CASE statement will return NULL.   
-- ################################################################	   
SELECT 
    empno,ename,sal,comm
FROM
    emp
WHERE ename!='KING'
ORDER BY COMM;
-- IF COMM = O -> RETURN 500
-- IF COMM IS NULL -> RETURN 0
-- IF COMM IS >0 AND <500 -> RETURN COMM+500
-- IF COMM >500 -> COMM

SELECT 
    empno,ename,sal,comm,CASE
                        WHEN comm=0 then 500
                        WHEN comm is null then 0
                        WHEN comm>0 and comm<500 then comm+500
                        ELSE comm
                    END as updated_comm
FROM 
    emp
WHERE 
    ename!='KING'
ORDER BY
    comm;
-- ################################################################	   
-- COALESCE returns the first non-null expr in the expression list. 
-- At least one expr must not be the literal NULL. 
-- If all occurrences of expr evaluate to null, then the function returns null.
-- ################################################################	   
--SELECT comm, COALESCE(500,0,comm+500,comm) 
--FROM emp
--ORDER by comm;
--1. Resultant column -> more than one columns in a table
-- in collace if the expression is not null then it returns
SELECT sal,comm,COALESCE(comm,sal,300)
FROM 
    emp
order by comm;


SELECT sal,comm,sal+comm,COALESCE(sal+comm,comm,sal)
FROM 
    emp
order by comm;


-- ################################################################	   
-- The following example calculates the rank of a hypothetical employee in the sample table 
-- hr.employees with a salary of $15,500 and a commission of 5%:   
-- ################################################################	   
SELECT RANK(15500, .05) WITHIN GROUP (ORDER BY salary, commission_pct) "Rank" FROM employees;

SELECT SAL,COMM FROM EMP ORDER BY SAL,COMM;
-- RANK THE EMPLOYEE WHOS SALARY 5000 
SELECT SAL FROM EMP ORDER BY SAL;
SELECT 
    RANK(5000) WITHIN GROUP (ORDER BY SAL)AS "RANK Asc",
    RANK(5000) WITHIN GROUP (ORDER BY SAL DESC)AS "RANK desc"
    FROM EMP; 

SELECT 
    RANK(3000) WITHIN GROUP (ORDER BY SAL)AS "RANK Asc",
    RANK(3000) WITHIN GROUP (ORDER BY SAL DESC)AS "RANK desc"
    FROM EMP; 

--SELECT 
--    SAL,
--    RANK(3000) WITHIN GROUP (ORDER BY SAL)AS "RANK Asc"
--FROM 
--    EMP 
--WHERE SAL=3000
--    GROUP BY SAL
--    ORDER BY SAL;


SELECT SAL FROM EMP ORDER BY SAL;

SELECT deptno,sal, RANK() OVER (PARTITION BY deptno ORDER BY sal) as "RankPER DEPT" FROM emp;

SELECT deptno,sal,
RANK() OVER (PARTITION BY deptno ORDER BY sal) as "RankPER DEPT",
RANK()OVER ( ORDER BY sal) as "Rank PER SAL "
FROM emp
ORDER BY DEPTNO,SAL;

SELECT deptno,sal,
RANK()OVER ( ORDER BY sal) as "Rank PER SAL "
FROM emp
ORDER BY SAL;






































































































































































