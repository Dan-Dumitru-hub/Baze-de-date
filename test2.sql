
SELECT distinct
    a1.ename "ang",
    a1.job "func_ang",
    a2.ename "sef",
    d.dname "depart",
    d.loc "locatie",
    g.grade "gradatie"
FROM
    emp a1
        INNER JOIN emp a2
        ON a1.empno = a2.mgr,
    salgrade g,
    dept d
    where
    a1.sal between g.losal and g.hisal
    AND a1.sal  > a2.sal
    and a1.deptno=d.deptno
    order by 1;

   

   SELECT distinct
    a1.ename "ang",
    a1.job "func_ang",
    a2.ename "sef",
    d.dname "depart",
    d.loc "locatie",
    g.grade "gradatie"
FROM
    emp a1, emp a2 natural join 
    salgrade g natural join
    dept d
    where 
    a1.empno = a2.mgr and
    a1.sal >= g.losal and  a1.sal<=g.hisal
    AND a1.sal  > a2.sal
    order by 1;
  

   