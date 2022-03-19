--Pas1 selectam angajatii din departamentul cu cei mai multi angajati
select b.dname , a.ename, a.sal , a.comm from 
emp a natural join dept b
where b.dname in (
 select b.dname
 from emp a natural join dept b
 group by b.dname
 having count(a.empno) = (select max(count(empno)) from emp group by deptno)
 )
order by a.sal;


--pas 2 selectam angajati care au comisionul cel putin jumatate din salariul mediu pe firma .

select b.dname , a.ename, a.sal , a.comm from 
emp a natural join dept b
where b.dname in (
 select b.dname
 from emp a natural join dept b
 group by b.dname
 having count(a.empno) = (select max(count(empno)) from emp where nvl(comm,0) > (select avg(sal) from emp)/2 group by deptno)
 )
order by a.sal;
