

select a.ename Nume_angajat, sef.ename Nume_angajat, a.hiredate Data_ang_angajat, 
       sef.hiredate Data_ang_sef, floor(months_between(a.hiredate, sef.hiredate)) Nr_luni_dupa_sef,
      'CERCETARE' "Traducere departament" 
from emp a, dept sales, emp sef
where
a.deptno=sales.deptno
and
sales.dname='RESEARCH'
and
a.mgr=sef.empno
and
a.mgr is not null
and
months_between(a.hiredate, sef.hiredate)>=3
UNION
select a.ename Nume_angajat, sef.ename Nume_angajat, a.hiredate Data_ang_angajat, 
       sef.hiredate Data_ang_sef, floor(months_between(a.hiredate, sef.hiredate)) Nr_luni_dupa_sef,
      'VANZARI' "Traducere departament" 
from emp a, dept sales, emp sef
where
a.deptno=sales.deptno
and
sales.dname='SALES'
and
a.mgr=sef.empno
and
a.mgr is not null
and
months_between(a.hiredate, sef.hiredate)>=3;

SELECT A.ENAME, B.DNAME, A.SAL + NVL(A.COMM, 0) VENIT
FROM EMP A, DEPT B, EMP MARTIN
where
 A.DEPTNO=B.DEPTNO
 AND
 B.DNAME NOT LIKE 'SALES'
 AND
 MARTIN.ENAME='MARTIN'
 AND
 A.SAL  + NVL(A.COMM, 0) > MARTIN.SAL + NVL(MARTIN.SAL, 0);



select martin.sal+nvl(martin.comm, 0)
      from emp martin
      where
         martin.ename like 'MARTIN'
    ;  

SELECT A.ENAME, B.DNAME, A.SAL + NVL(A.COMM, 0) VENIT
FROM EMP A, DEPT B
where
 A.DEPTNO=B.DEPTNO
 AND
 B.DNAME NOT LIKE 'SALES'
 AND
 A.SAL  + NVL(A.COMM, 0) > 
    ( 
      select martin.sal+nvl(martin.comm, 0)
      from emp martin
      where
         martin.ename like 'MARTIN'
    );  

SELECT A.EMPNO, A.SAL, B.DNAME
FROM EMP A JOIN DEPT B ON A.DEPTNO= B.DEPTNO
WHERE
 A.DEPTNO IN (
              SELECT C.DEPTNO
              FROM EMP X JOIN DEPT C ON X.DEPTNO=C.DEPTNO
              WHERE 
                C.DNAME='SALES' 
            )
AND
A.SAL in (
         SELECT MAX(D.SAL)
         FROM EMP D JOIN DEPT E ON E.DEPTNO=D.DEPTNO
         WHERE 
             E.DNAME='SALES' 
       );




select a.ename,a.sal,b.dname
from emp a join dept b on a.deptno=b.deptno
where a.sal > (select avg(c.sal) from emp c);





select ename , hiredate from emp
where hiredate> (select hiredate from emp where ename ='ALLEN');



SELECT A.ENAME, A.SAL, B.DNAME
FROM EMP A JOIN DEPT B ON A.DEPTNO=B.DEPTNO
WHERE
A.SAL > (SELECT AVG(C.SAL) 
         FROM EMP C 
         WHERE
           C.DEPTNO=A.DEPTNO);   


select * from emp a
where
sal in (select max(sal) from emp);




select * from emp a
where
a.sal = (select max(sal) 
         from emp
         where
            sal != (select max(sal) from emp)
       ); 


SELECT A.ENAME, A.SAL
FROM EMP A
WHERE
 4 = (SELECT COUNT(*)
     FROM EMP B
     WHERE
      B.SAL >A.SAL
     );



SELECT A.ENAME, A.SAL
FROM EMP A
WHERE
 4 >= (SELECT COUNT(*)
     FROM EMP B
     WHERE
      B.SAL >A.SAL
     );




SELECT A.ENAME, B.GRADE, A.SAL, C.SALMAX
FROM EMP A, SALGRADE B, (SELECT MAX(SAL) SALMAX FROM EMP) C
WHERE
  A.SAL BETWEEN B.LOSAL AND B.HISAL;



SELECT A.ENAME, A.SAL, BLAKE.SAL "SALARIU BLAKE", A.SAL-BLAKE.SAL DIFERENTA, BLAKE.DNAME
FROM EMP A, (SELECT B.SAL, C.DNAME
             FROM EMP B JOIN DEPT C ON B.DEPTNO=C.DEPTNO
             WHERE
               B.ENAME='BLAKE'
            ) BLAKE
WHERE
A.SAL >BLAKE.SAL;








