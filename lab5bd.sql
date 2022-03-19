--select * from EMP;
--alias de coloana
--select deptno from dept;

--select deptno departamentul,dname denum,loc from dept;

--select ename,empno from emp where sal >&&salasir1 and(comm is not null and comm >0);

--select ename from emp where sal>&salariu and nvl(comm,0)>0;

select emp.ename,emp.sal,emp.comm,dept.dname from emp,dept where emp.deptno=dept.deptno and dept.dname='ACCOUNTING'and nvl(comm,0)=0;


select emp.ename,emp.sal,emp.comm,dept.dname from emp JOIN dept on emp.deptno=dept.deptno where dname ='ACCOUNTING'and nvl(comm,0)=0;


select emp.ename,emp.sal,emp.comm,dept.dname from emp natural join dept where dname ='ACCOUNTING'and nvl(comm,0)=0;


select a.ename,s.ename,a.sal +nvl(a.comm,0) venit_angajat , s.sal + nvl(s.comm,0) venit_sef
from emp a , emp s
where a.mgr=s.empno
and (a.sal +nvl(a.comm ,0))> (s.sal + nvl(s.comm,0));

select a.ename,s.ename,a.sal +nvl(a.comm,0) venit_angajat , s.sal + nvl(s.comm,0) venit_sef
from emp a , emp s
where a.hiredate>s.hiredate
and (a.sal +nvl(a.comm ,0))> 100 and a.mgr=s.empno;

select a.ename,b.dname,a.sal,c.grade 
from emp a , dept b,salgrade c
where a.deptno=b.deptno
and a.sal>=c.losal
and a.sal <=c.hisal
and b.dname like 'SALES' order by 4;

select a.ename,b.dname,a.sal,c.grade 
from emp a join dept b on a.deptno=b.deptno join salgrade c on a.sal between c.losal and c.hisal  where b.dname  like 'SALES' order by 4;

select a.ename , a.sal , c.grade from emp a  join dept b on a.deptno=b.deptno join salgrade c on a.sal between c.losal and c.hisal where a.deptno>&dep and c.grade=3 order by 3;

select a.dname from dept a ,emp b where a.deptno=b.deptno(+) order by a.dname;

select a.dname from dept a left outer join emp b on a.deptno=b.deptno order by a.dname;





