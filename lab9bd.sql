

SELECT EXTRACT (YEAR FROM A.HIREDATE) ANUL, COUNT(*)
FROM EMP A
GROUP BY EXTRACT (YEAR FROM A.HIREDATE)
HAVING COUNT(*) = ( SELECT MAX(COUNT(*))
                                         FROM EMP B
                                         GROUP BY    EXTRACT (YEAR FROM B.HIREDATE));

select dname , count(*) from emp a join dept b 
on a.deptno=b.deptno
group by dname;

select dname , count(*) from emp a join dept b 
on a.deptno=b.deptno
group by dname
having count(*) = (  SELECT MAX(COUNT(*))
                                         FROM EMP c
                                         GROUP BY    c.deptno);



select a.dname, extract(year from b.hiredate), count(*)
from emp b, dept a
where
a.deptno = b.deptno
and 
extract(year from b.hiredate) != 1981
group by a.dname, extract(year from b.hiredate)
having count(*) = (select max(count(*))
                             from emp c
                             where 
                              extract(year from c.hiredate) != 1981
                             group by  c.deptno, extract(year from c.hiredate));



SELECT A.ENAME, A.SAL, (SELECT MAX(B.SAL) FROM EMP B) SALMAX
FROM EMP A JOIN SALGRADE C ON A.SAL BETWEEN C.LOSAL AND C.HISAL
WHERE
SUBSTR(A.ENAME, -2) !='ES'
AND
C.GRADE = ( SELECT E.GRADE 
            FROM EMP D JOIN SALGRADE E ON D.SAL BETWEEN E.LOSAL AND E.HISAL
            WHERE
                  D.ENAME='SCOTT'
  ) ;




SELECT A.ENAME, A.SAL,  X.SALMAX
FROM EMP A JOIN SALGRADE C ON A.SAL BETWEEN C.LOSAL AND C.HISAL,
 (SELECT MAX(B.SAL) SALMAX FROM EMP B) X
WHERE
SUBSTR(A.ENAME, -2) !='ES'
AND
C.GRADE = ( SELECT E.GRADE 
            FROM EMP D JOIN SALGRADE E ON D.SAL BETWEEN E.LOSAL AND E.HISAL
            WHERE
                  D.ENAME='SCOTT'
  ) ;

SELECT A.ENAME, A.SAL,  X.SALMAX
FROM EMP A JOIN SALGRADE C ON A.SAL BETWEEN C.LOSAL AND C.HISAL,
 (SELECT MAX(B.SAL) SALMAX FROM EMP B) X,
 ( SELECT E.GRADE 
            FROM EMP D JOIN SALGRADE E ON D.SAL BETWEEN E.LOSAL AND E.HISAL
            WHERE
                  D.ENAME='SCOTT'
  ) Y
WHERE
SUBSTR(A.ENAME, -2) !='ES'
AND
C.GRADE = Y.GRADE;


SELECT A.ENAME, B.DNAME, (SELECT COUNT(*) NRANG FROM EMP C WHERE C.DEPTNO=A.DEPTNO)
FROM EMP A JOIN DEPT B ON A.DEPTNO=B.DEPTNO;



SELECT A.ENAME, B.DNAME, COUNT(C.EMPNO) 
FROM EMP A JOIN DEPT B ON A.DEPTNO=B.DEPTNO , (SELECT empno , deptno  FROM EMP) C 
WHERE C.DEPTNO=B.DEPTNO group by a.ename , b.dname;

SELECT  A.ENAME
FROM EMP A
ORDER BY (select count(*) from dept b
          where b.deptno=a.deptno
            ) DESC;



SELECT A.ENAME 
FROM EMP A
WHERE
  EXISTS( SELECT B.ENAME FROM EMP B WHERE B.MGR=A.EMPNO );

select a.dname
from
dept a
where
not exists (select * 
            from emp b join salgrade c on b.sal between c.losal and c.hisal 
            where 
               b.deptno=a.deptno 
               and
               c.grade in (4, 5) );

update login_lab_bd set data_sf= sysdate where laborator='Lab9';
update login_lab_bd set durata= round((data_sf-data_in)*24*60) where laborator='Lab9';
commit;
select instance_number,instance_name, to_char(startup_time, 'dd-mm-yyyy hh:mi:ss'), host_name
from v$instance;
select nume_stud, grupa, laborator, to_char(data_in, 'dd-mm-yyyy hh:mi:ss') data_inceput,
to_char(data_sf, 'dd-mm-yyyy hh:mi:ss') data_sfarsit, durata minute_lucrate from login_lab_bd;
spool off; 