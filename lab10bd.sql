
create table firme
(
id_firma number(3),
den_firma varchar2(20),
constraint pk_firme primary key(id_firma)
);


CREATE TABLE ANGAJATI_NOI
(
ID_ANG NUMBER(3),
NUME_ANG VARCHAR2(30),
FUNCTIE_ANG VARCHAR2(30),
SAL NUMBER,
COMM NUMBER,
ID_FIRMA number(3),
CONSTRAINT PK_ANGAJATI_NOI PRIMARY KEY(ID_ANG),
CONSTRAINT FK_ANGAJATI_NOI_FIRME FOREIGN KEY (ID_FIRMA)
REFERENCING FIRME(ID_FIRMA) ON DELETE CASCADE
);



DROP TABLE ANGAJATI_NOI CASCADE CONSTRAINTS;


desc firme



ALTER TABLE FIRME
ADD
(NR_ANGAJATI NUMBER(4));

ALTER TABLE FIRME
drop constraint pk_firme;


DESC FIRME



select a.ename Nume_angajat, b.dname Den_departament, a.hiredate,
trunc((sysdate-a.hiredate)/365) Ani_vechime
from emp a, dept b
where
b.deptno=a.deptno
and
extract(month from a.hiredate) not in (3,4,5)
and
0=(
select count(*) from 
emp c
where a.hiredate <c.hiredate
and
a.deptno=c.deptno
and
extract(month from c.hiredate) not in (3,4,5)
  );



create table ultimii_veniti as (select a.ename Nume_angajat, b.dname Den_departament, a.hiredate,
trunc((sysdate-a.hiredate)/365) Ani_vechime
from emp a, dept b
where
b.deptno=a.deptno
and
extract(month from a.hiredate) not in (3,4,5)
and
0=(
select count(*) from 
emp c
where a.hiredate <c.hiredate
and
a.deptno=c.deptno
and
extract(month from c.hiredate) not in (3,4,5)
  )
);

select * from ultimii_veniti;




select b.mgr
            from emp b
            group by b.mgr
            having count(*) = (select max(count(*)) from emp c group by c.mgr);

select 
x.ename Nume_angajat, 
e.dname Den_departament, 
extract (YEAR from x.hiredate) An_angajare, 
x.sal+nvl(x.comm, 0) Venit,
 trunc((sysdate-x.hiredate)/365) Ani_vechime
from emp x, dept e
where
e.deptno=x.deptno
and
x.deptno in (
select a.deptno
from emp a
where
a.empno in (select b.mgr
            from emp b
            group by b.mgr
            having count(*) = (select max(count(*)) from emp c group by c.mgr)
            ));


create table ang_blake as 
(select 
x.ename Nume_angajat, 
e.dname Den_departament, 
extract (YEAR from x.hiredate) An_angajare, 
x.sal+nvl(x.comm, 0) Venit,
 trunc((sysdate-x.hiredate)/365) Ani_vechime
from emp x, dept e
where
e.deptno=x.deptno
and
x.deptno in (
select a.deptno
from emp a
where
a.empno in (select b.mgr
            from emp b
            group by b.mgr
            having count(*) = (select max(count(*)) from emp c group by c.mgr)
            ))
);


CREATE OR REPLACE VIEW EMP_SALE
AS
SELECT A.EMPNO, A.ENAME, A.DEPTNO
FROM EMP A
WHERE
A.DEPTNO IN (
              SELECT B.DEPTNO 
              FROM DEPT B
              WHERE
                B.DNAME LIKE 'SALES'
            );


SELECT * FROM EMP_SALE;


DROP VIEW EMP_SALE;





commit;
rollback;

delete from emp;

select * from emp;

rollback;

select * from emp;




DROP TABLE FIRME;

drop table ultimii_veniti;
drop table ang_blake;

update login_lab_bd set data_sf= sysdate where laborator='Lab10';
update login_lab_bd set durata= round((data_sf-data_in)*24*60) where laborator='Lab10';
commit;
select instance_number,instance_name, to_char(startup_time, 'dd-mm-yyyy hh:mi:ss'), host_name
from v$instance;
select nume_stud, grupa, laborator, to_char(data_in, 'dd-mm-yyyy hh:mi:ss') data_inceput,
to_char(data_sf, 'dd-mm-yyyy hh:mi:ss') data_sfarsit, durata minute_lucrate from login_lab_bd;
spool off; 