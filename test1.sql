select deptno , 'Angajatul' || ename||' are  ID-ul' || empno as "Angajatul  ENAME are  ID-ul empno", comm ,sal
from emp
where (comm is null or comm =0)
and empno != &id
and ename like '%O%';

select deptno , 'Angajatul' || ename||' are  ID-ul' || empno as "Angajatul  ENAME are  ID-ul empno", comm ,sal
from emp
where nvl(comm,0) = 0
and (empno >&id or empno<&id)
and ename like '%O%';


select deptno , 'Angajatul' || ename||' are  ID-ul' || empno  "Angajatul  ENAME are  ID-ul empno", comm ,sal
from emp
where nvl(comm,0) <= 0
and (empno <> &&id)
and ename like '%O%' ;
