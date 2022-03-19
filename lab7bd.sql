
SELECT A.ENAME, A.EMPNO, DECODE(MOD(EMPNO, 2), 0, 200, 1,300) PRIMA
FROM EMP A, DEPT B
WHERE
A.DEPTNO=B.DEPTNO
AND
B.DNAME='SALES';


SELECT A.ENAME ANGAJAT, NVL(A.COMM, 0) COMISION, B.GRADE GRAD_SALARIAL, A.SAL+ NVL(A.COMM, 0) VENIT, 
       decode (sign(A.SAL+ NVL(A.COMM, 0)-2500), -1, 'BUN', 'FOARTE BUN')
FROM EMP A, SALGRADE B
WHERE 
A.SAL BETWEEN B.LOSAL AND B.HISAL
AND
NVL(A.COMM, 0) >0
and 
b.grade>1;


select ename, job, 
       case job
         when 'SALESMAN' then 'VANZATOR'
         when 'CLERK' then 'FUNCTIONAR' 
         when 'ANALYST' then 'ANALIST' 
         when 'MANAGER' then 'DIRECTOR' 
         else 'PRESEDINTE'
       end Traducere
from emp;


SELECT A.ENAME ANGAJAT, NVL(A.COMM, 0) COMISION, B.GRADE GRAD_SALARIAL, A.SAL+ NVL(A.COMM, 0) VENIT, 
      case sign(A.SAL+ NVL(A.COMM, 0)-2500)
        when -1  then 'BUN'
        else 'FOARTE BUN'
      end "Apreciere venit"
FROM EMP A, SALGRADE B
WHERE 
A.SAL BETWEEN B.LOSAL AND B.HISAL
AND
NVL(A.COMM, 0) >0
and 
b.grade>1;


select a.ename Nume_angajat, a.sal Salariu, 
case when extract( YEAR from a.hiredate)<= 1980 THEN 'FOARTE VECHI' 
     WHEN extract( YEAR from a.hiredate) BETWEEN 1981 AND 1986 then 'VECHI' 
     WHEN extract( YEAR from a.hiredate)>= 1987 THEN 'RECENT' END Apreciere_vechime
from emp a, dept b
where
a.deptno=b.deptno
and
b.dname='RESEARCH';


SELECT MAX(A.SAL) 
FROM EMP A, DEPT B
WHERE
A.DEPTNO=B.DEPTNO
AND
B.DNAME='SALES';


SELECT MAX(SAL) FROM EMP;

SELECT D.DNAME
FROM DEPT D JOIN EMP A ON D.DEPTNO=A.DEPTNO;


SELECT D.DNAME
FROM DEPT D JOIN EMP A ON D.DEPTNO=A.DEPTNO
GROUP BY D.DNAME;

SELECT D.DNAME, COUNT(*) "NR ANGAJATI"
FROM DEPT D JOIN EMP A ON D.DEPTNO=A.DEPTNO
GROUP BY D.DNAME;


SELECT D.DNAME, COUNT(*) "NR ANGAJATI"
FROM DEPT D JOIN EMP A ON D.DEPTNO=A.DEPTNO
GROUP BY D.DNAME
HAVING COUNT(*)>4;


SELECT C.GRADE, COUNT(*)
FROM EMP A JOIN DEPT B ON A.DEPTNO=B.DEPTNO JOIN SALGRADE C ON A.SAL BETWEEN C.LOSAL AND C.HISAL
WHERE
B.DNAME='SALES'
GROUP BY C.GRADE
HAVING COUNT(*) >1 ;



select b.dname den_dep, a.ename nume_ang, a.job, a.comm comision, 
min(c.sal) salariu_min_com, trunc( avg(c.sal)) salariu_mediu_com,
trunc(decode(a.job, 'MANAGER', 0, 'PRESIDENT', 0, 
decode(nvl(a.comm, 0), 0, min(c.sal), avg(c.sal)))) prima
from emp a, dept b, emp c
where a.deptno = b.deptno
group by b.dname, a.ename, a.comm, a.job;







update login_lab_bd set data_sf= sysdate where laborator='Lab7';
update login_lab_bd set durata= round((data_sf-data_in)*24*60) where laborator='Lab7';
commit;
select instance_number,instance_name, to_char(startup_time, 'dd-mm-yyyy hh:mi:ss'), host_name
from v$instance;
select nume_stud, grupa, laborator, to_char(data_in, 'dd-mm-yyyy hh:mi:ss') data_inceput,
to_char(data_sf, 'dd-mm-yyyy hh:mi:ss') data_sfarsit, durata minute_lucrate from login_lab_bd;
spool off; 



spool C:\Users\tipa\Desktop\anu3\sem2\bd\spool_bd\spool_bd_lab9_26apr2021.lst
set lines 200
set pages 100
select to_char(sysdate, 'dd-mm-yyyy hh:mi:ss') from dual;
insert into login_lab_bd values( 'Tipa Dan-Dumitru', '335CB', 'Lab9', user, sysdate, null, null);
select * from login_lab_bd;






