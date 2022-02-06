#	DB Queries ASSIGNMENT 3 ABHAY SHIVHARE

1	 Display all the information of the EMP table?
     SELECT * FROM EMP;
     
2	 Display unique Jobs from EMP table?
     SELECT DISTINCT JOB from EMP;
     
3	 List the emps in the asc order of their Salaries?
     SELECT EMPNO, ENAME,sal FROM Emp
     order by sal;

4	 List the details of the emps in asc order of the Dptnos and desc of Jobs?
     SELECT empno,ename,deptno,branchno,sal,job FROM Emp
     ORDER BY deptno,job DESC;

5	 Display all the unique job groups in the descending order?
     SELECT DISTINCT job FROM emp ORDER BY job desc ;

6	 Display all the details of all MGRS
     SELECT DISTINCT mgr, empno,ename, job , sal,deptno,branchno
     FROM emp ORDER BY mgr;
     
     SELECT mgr,empno,ename,job,hiredate,sal,comm,deptno,branchno FROM emp
     WHERE mgr IN(SELECT mgr FROM emp WHERE mgr IS NOT NULL) ORDER BY mgr;

####DOUBT##
7	 List the emps who joined before 1981
     SELECT empno,ename from emp where hiredate <'01-01-81';
     
      
8	 List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal
     SELECT Empno, Ename, Sal,sal/30 perdaysal,sal*12 as annualsal FROM emp ORDER BY annualsal;
     
     ###########IMP#############
9	 Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
    SELECT empno,ename,job,hiredate,mgr,MONTHS_BETWEEN(SYSDATE,hiredate)/12 experience 
    FROM emp WHERE mgr IS NOT NULL ORDER BY mgr; 

10	 List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369
    SELECT empno,ename,sal,mgr,MONTHS_BETWEEN(SYSDATE,hiredate)/12 experience 
    FROM emp WHERE mgr=7698;

11	 Display all the details of the emps whose Comm  Is more than their Sal
    SELECT * FROM emp WHERE comm > sal; 

#######DOUBT###############
13	 List the emps along with their Exp and Daily Sal is more than Rs 100
     SELECT Empno, Ename, Sal,MONTHS_BETWEEN(SYSDATE,hiredate)/12 experience
     ,sal/30 as dailysal FROM emp WHERE (sal/30)>100;
     
     SELECT Empno, Ename, Sal,MONTHS_BETWEEN(SYSDATE,hiredate)/12 experience
     ,sal/30 as dailysal FROM emp WHERE dailysal>100;
     
14	 List the emps who are either CLERK or ANALYST in the Desc order
     SELECT *  FROM emp WHERE job='CLERK' or job='ANALYST' ORDER BY empno DESC;
     
 #####doubt####    
15	 List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority
     SELECT empno,ename,job,hiredate FROM emp WHERE hiredate IN ('01-05-1981','03-12-1981','17-12-1981','19-01-1980')
     ORDER BY hiredate;

16	 List the emp who are working for the Deptno 10 or20
     SELECT *  FROM emp WHERE deptno IN (10,20);

17	 List the emps who are joined in the year 81
     SELECT *  FROM emp WHERE  TO_CHAR(hiredate,'yyyy')='1981';
     
########DOUBT##########     
19	 List the emps Who Annual sal ranging from 22000 and 45000
     SELECT empno,ename,deptno,branchno,job,Sal,
     sal*12 as annualsal FROM emp where annualsal BETWEEN 22000 and 45000;
         
20	 List the Enames those are having five characters in their Names
     SELECT ename FROM emp WHERE ename like '_____';
     
21	 List the Enames those are starting with S and with five characters
     SELECT ename FROM emp WHERE ename like 'S____';
     
22	 List the emps those are having four chars and third character must be ‘r’
     SELECT * FROM emp WHERE ename like '__R_';
    
23	 List the Five character names starting with ‘S’ and ending with ‘H’
     SELECT ename,empno FROM emp WHERE ename like 'S___H';
     
24	 List the emps who joined in January
     SELECT *  FROM emp WHERE  TO_CHAR(hiredate,'mon')='jan';

27	 List the emps whose names having a character set ‘ll’ together
     SELECT *  FROM emp WHERE ename like '%LL%';
     
29	 List the emps who does not belong to Deptno 20
     SELECT *  FROM emp WHERE deptno!=20;

30	 List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries
     SELECT *  FROM emp WHERE job!='PRESIDENT' AND job!='MANAGER' ORDER BY sal;
    
34	 List the emps who joined in any year but not belongs to the month of March
     SELECT * FROM emp WHERE  TO_CHAR(hiredate,'mon')!='MAR' ORDER BY deptno;
     
35	 List all the Clerks of Deptno 20
     SELECT *  FROM emp where job='CLERK' AND deptno=20;
     
36	 List the emps of Deptno 30 or 10 joined in the year 1981
     SELECT * FROM emp WHERE deptno IN (10,30) AND TO_CHAR(hiredate,'yyyy')='1981' ORDER BY deptno;

37	 Display the details of SMITH     
     SELECT *  FROM emp WHERE ename='SMITH';
     
38	 Display the location of SMITH   
     SELECT emp.empno,emp.ename,branch.branchno,branch.location FROM
     emp,branch WHERE emp.branchno=branch.branchno AND emp.ename='SMITH';



