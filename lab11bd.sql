
SELECT A.ENAME "Nume angajat", A.SAL + NVL(A.COMM, 0) Venit, B.GRADE
FROM EMP A JOIN SALGRADE B ON A.SAL BETWEEN B.LOSAL AND B.HISAL
WHERE
B.GRADE=( SELECT D.GRADE 
          FROM EMP C JOIN SALGRADE D ON C.SAL BETWEEN D.LOSAL AND D.HISAL
          WHERE 
            C.ENAME='ALLEN'
        );



SELECT A.ENAME "Nume angajat", A.SAL + NVL(A.COMM, 0) Venit, B.GRADE
FROM EMP A JOIN SALGRADE B ON A.SAL BETWEEN B.LOSAL AND B.HISAL
WHERE
B.GRADE=( SELECT D.GRADE 
          FROM EMP C JOIN SALGRADE D ON C.SAL BETWEEN D.LOSAL AND D.HISAL
          WHERE 
            C.ENAME='ALLEN'
        )
AND
1 >= (SELECT COUNT(*)
      FROM EMP E JOIN SALGRADE F ON E.SAL BETWEEN F.LOSAL AND F.HISAL
      WHERE
          F.GRADE=( SELECT GRADE 
          FROM EMP  JOIN SALGRADE  ON SAL BETWEEN LOSAL AND HISAL
          WHERE 
            ENAME='ALLEN'
        )
        AND 
        E.SAL + NVL(E.COMM, 0) > A.SAL + NVL(A.COMM, 0)
       );


CREATE TABLE ANGAJATI_GRAD_ALLEN AS
(
SELECT A.ENAME "Nume angajat", A.SAL + NVL(A.COMM, 0) Venit, B.GRADE
FROM EMP A JOIN SALGRADE B ON A.SAL BETWEEN B.LOSAL AND B.HISAL
WHERE
B.GRADE=( SELECT D.GRADE 
          FROM EMP C JOIN SALGRADE D ON C.SAL BETWEEN D.LOSAL AND D.HISAL
          WHERE 
            C.ENAME='ALLEN'
        )
AND
1 >= (SELECT COUNT(*)
      FROM EMP E JOIN SALGRADE F ON E.SAL BETWEEN F.LOSAL AND F.HISAL
      WHERE
          F.GRADE=( SELECT GRADE 
          FROM EMP  JOIN SALGRADE  ON SAL BETWEEN LOSAL AND HISAL
          WHERE 
            ENAME='ALLEN'
        )
        AND 
        E.SAL + NVL(E.COMM, 0) > A.SAL + NVL(A.COMM, 0)
       )
);

SELECT * FROM ANGAJATI_GRAD_ALLEN;

DROP TABLE ANGAJATI_GRAD_ALLEN;





CONNECT sys as sysdba


alter session set "_ORACLE_SCRIPT"=true;

CREATE ROLE rol_contabil;
grant insert, delete, select on scott.emp to rol_contabil;

grant select, insert on scott.dept to rol_contabil;

revoke insert on scott.dept from rol_contabil;

CREATE USER user1 identified by user1;
GRANT CREATE SESSION TO user1;

GRANT rol_contabil to user1;

conn user1/user1

select * from SCOTT.dept;
 insert into SCOTT.dept values (60, 'TEST', 'TESTLOC');

conn sys as sysdba
alter session set "_ORACLE_SCRIPT"=true;
drop user user1;

drop role rol_contabil;


conn scott/tiger


set timing on
select * from emp, dept;
set timing off

select ename, empno from emp;

set space 6
select ename, empno from emp;
set space 1



COLUMN SAL FORMAT 00999 HEADING 'Salariu'

select ename, sal from emp;


ttitle 'Titlu raport sus' center underline

select ename, sal from emp;

ttitle off



TTITLE right 'Nr. pag' sql.pno center 'Angajati pe departamente'
BTITLE 'Final pagina raport'
COLUMN ENAME format a20 heading 'Nume'
COLUMN SAL heading 'Salariul'

BREAK ON DNAME NODUP ON REPORT
COMPUTE SUM OF SAL ON DNAME SKIP 2 REPORT

SELECT A.ENAME, B.DNAME, A.SAL
FROM EMP A JOIN DEPT B
     ON A.DEPTNO=B.DEPTNO
ORDER BY B.DNAME, A.SAL DESC;



SELECT A.ENAME, B.DNAME, A.SAL
FROM EMP A JOIN DEPT B
     ON A.DEPTNO=B.DEPTNO
ORDER BY B.DNAME, A.SAL DESC;

TTITLE OFF
BTITLE OFF
CLEAR BREAK
CLEAR COMPUTE
CLEAR COLUMNS



update login_lab_bd set data_sf= sysdate where laborator='Lab11';
update login_lab_bd set durata= round((data_sf-data_in)*24*60) where laborator='Lab11';
commit;
select instance_number,instance_name, to_char(startup_time, 'dd-mm-yyyy hh:mi:ss'), host_name
from v$instance;
select nume_stud, grupa, laborator, to_char(data_in, 'dd-mm-yyyy hh:mi:ss') data_inceput,
to_char(data_sf, 'dd-mm-yyyy hh:mi:ss') data_sfarsit, durata minute_lucrate from login_lab_bd;
spool off; 