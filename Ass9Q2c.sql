SET SERVEROUTPUT ON

BEGIN
    FOR rec IN (SELECT empno, ename, sal
                FROM (SELECT empno, ename, sal
                      FROM emp
                      ORDER BY sal DESC)
                WHERE ROWNUM <= 7) LOOP
        DBMS_OUTPUT.PUT_LINE('Empno: ' || rec.empno || ', Ename: ' || rec.ename || ', Salary: ' || rec.sal);
    END LOOP;
END;
/

/*
OUTPUT:
------
SQL> @C:\Users\DELL\OneDrive\Desktop\PLSQL\Ass9Q2c.sql
Empno: 7839, Ename: KING, Salary: 5000
Empno: 7788, Ename: SCOTT, Salary: 3000
Empno: 7902, Ename: FORD, Salary: 3000
Empno: 7566, Ename: JONES, Salary: 2975
Empno: 7698, Ename: BLAKE, Salary: 2850
Empno: 7782, Ename: CLARK, Salary: 2450
Empno: 7499, Ename: ALLEN, Salary: 1600

PL/SQL procedure successfully completed.

*/