

select a.ename "Nume angajat", a.comm "Comision angajat" ,a.hiredate "Data angajare",sef.hiredate "Data angajare sef",
 c.grade "Grad salarial" , 
 case c.grade
 when 1 then 500
 when 2 then 300
 when 3 then 100
 else 0
 end
 "PRIMA"
from emp a , emp sef , salgrade c 
where a.mgr=sef.empno
and a.sal > c.losal and a.sal <c.hisal
and  nvl(a.comm,0)=0
and EXTRACT( MONTH FROM TO_DATE( a.hiredate,  'DD-Mon-YYYY HH24:MI:SS' ) ) - EXTRACT( MONTH FROM TO_DATE( sef.hiredate,  'DD-Mon-YYYY HH24:MI:SS' ) )>=2;




select a.ename "Nume angajat", a.comm "Comision angajat" ,a.hiredate "Data angajare",sef.hiredate "Data angajare sef",
 c.grade "Grad salarial" , decode(c.grade,1,500 ,2, 300 , 3 ,100,0 ) "PRIMA"
from emp a , emp sef , salgrade c 
where a.mgr=sef.empno
and a.sal > c.losal and a.sal <c.hisal
and  nvl(a.comm,0)=0
and  MONTHS_BETWEEN(a.hiredate,sef.hiredate )>=2;



