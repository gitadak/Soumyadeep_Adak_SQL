SET SERVEROUTPUT ON

BEGIN
	DBMS_OUTPUT.PUT_LINE('Nickname' || '  Empno');
	FOR rec IN (SELECT SUBSTR(ename, 1, 3) AS nickname, empno, job, mgr, hiredate, sal, comm, deptno
			FROM emp
			WHERE TO_CHAR(hiredate, 'YYYY') = '1981') 
	LOOP
		DBMS_OUTPUT.PUT_LINE(rec.nickname || '       ' || rec.empno);
   	END LOOP;
END;
/

/*
OUTPUT:
------
SQL> @C:\Users\DELL\OneDrive\Desktop\PLSQL\Ass9Q2b.sql
Nickname  Empno
ALL       7499
WAR       7521
JON       7566
BLA       7698
CLA       7782
KIN       7839
TUR       7844
JAM       7900
FOR       7902

PL/SQL procedure successfully completed.

*/