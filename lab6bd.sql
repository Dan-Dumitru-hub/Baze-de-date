--select * from emp;
select sysdate from sys.dual;
select 'a inceput ' from sys.dual;


select ename , sal ,sal/3 ,floor(sal/3) "valoare nr intregi" , round(sal/3) "val",round(sal/3 , 2) "value" from emp;


--nu primesc com => =null sau e zero , venit lunarr= sal + comision

select a.ename angajatul , a.job functia,a.comm comsion , a.hiredate "data anj",
ALLEN.hiredate "DATA ANJ ALLEN",ROUND (( a.sal +nvl(a.comm,0))*0.23) Prima
from emp a , emp ALLEN
where ALLEN.ename='ALLEN'
and nvl (a.comm,0)=0 and
a.job !='MANAJER'
and a.hiredate <ALLEN.hiredate;


select a.ename angajatul , a.job functia,a.comm comsion , a.hiredate "data anj",
ALLEN.hiredate "DATA ANJ ALLEN",ROUND (( a.sal +nvl(a.comm,0))*0.23) Prima
from emp a join  emp ALLEN ON 
 ALLEN.ename='ALLEN' WHERE 
 (a.COMM is null or(a.comm is not null and a.comm=0))
 and
a.job !='MANAJER'
and a.hiredate <ALLEN.hiredate;

select a.ename angajatul , a.job functia,a.comm comsion , a.hiredate "data anj",
ALLEN.hiredate "DATA ANJ ALLEN",ROUND (( a.sal +nvl(a.comm,0))*0.23) Prima
from emp a join  emp ALLEN ON 
 ALLEN.ename='ALLEN' WHERE 
 (a.COMM is null or(a.comm is not null and a.comm=0))
 and
a.job not like'MANAJER'
and a.hiredate <ALLEN.hiredate;




SELECT  A.ename , B.LOC , REPLACE(A.ENAME , 'AR','XY') Replace , TRANSLATE(A.ENAME , 'AR','XY') Translate
FROM EMP A JOIN DEPT B ON A.DEPTNO=B.DEPTNO WHERE SAL>1000;




SELECT  A.ename , B.LOC , REPLACE(A.ENAME , 'AR','XY') Replace , TRANSLATE(A.ENAME , 'AR','X') "Translate CU R"
FROM EMP A JOIN DEPT B ON A.DEPTNO=B.DEPTNO WHERE SAL>1000;

SELECT ENAME , JOB ,
substr(ENAME,-2) "ILTIMELE 2",
replace (JOB ,substr(ENAME ,-2),'') "JOB FARA DELE 2",
length(replace (JOB ,substr(ENAME,-2),'')) "sir  job ramas",
(length(JOB)-length(replace (JOB ,substr(ENAME,-2),'')))/2 Nr_aparitii
from emp where (length(JOB)-length(replace (JOB ,substr(ENAME,-2),'')))/2 !=0;




select EXTRACT(YEAR from sysdate),EXTRACT(MONTH FROM SYSDATE ) , EXTRACT(DAY FROM SYSDATE) FROM SYS.DUAL;


SELECT NEXT_DAY(SYSDATE ,'THURSDAY') "URM JOI" , LAST_DAY(SYSDATE) "URM" FROM SYS.DUAL;


SELECT ENAME "NUME" , DNAME DEPART , HIREDATE "ANJ" , NEXT_DAY(ADD_MONTHS(HIREDATE,2),'SUNDAY') "DATA TEST"
FROM  EMP,DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO
AND DEPT.DNAME='SALES';


SELECT CONCAT(CONCAT('=',ENAME),'=') AS "NUME FORMATAT",
ROUND(MONTHS_BETWEEN(SYSDATE ,HIREDATE)/12) AS "VECIME ANI",
LPAD(SAL,6,'X') AS "SALARIU FORMATAT"
FROM EMP WHERE INSTR(ENAME,'E')>1;

SELECT '=' || ENAME || '=' AS "NUME FORM",
ROUND ((SYSDATE-HIREDATE)/365) AS "VECHIME ANI",
LPAD(SAL,6,'X') AS "SALARIU FORMATAT"
FROM EMP WHERE ENAME LIKE '%E%';


SELECT DISTINCT MGR FROM EMP;