/*
CREATE TABLE BONUS (
    EMPNO NUMBER,
    ENAME VARCHAR2(50),
    BONUS_AMOUNT NUMBER
);
*/

SET SERVEROUTPUT ON

BEGIN
    INSERT INTO BONUS (EMPNO, ENAME, BONUS_AMOUNT)
    SELECT e.EMPNO, e.ENAME, e.SAL * 0.2
    FROM emp e
    JOIN dept d ON e.DEPTNO = d.DEPTNO
    WHERE d.LOC = 'CHICAGO'
      AND e.JOB = 'SALESMAN'
      AND e.SAL <= 15000;
    
    COMMIT;
END;
/

/*
OUTPUT:
------
SQL> @C:\Users\DELL\OneDrive\Desktop\PLSQL\Ass9Q2d.sql

PL/SQL procedure successfully completed.

SQL> SELECT * FROM BONUS;

     EMPNO ENAME                                              BONUS_AMOUNT
---------- -------------------------------------------------- ------------
      7499 ALLEN                                                       320
      7521 WARD                                                        250
      7844 TURNER                                                      300

*/