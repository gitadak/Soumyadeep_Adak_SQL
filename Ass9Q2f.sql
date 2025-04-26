SET SERVEROUTPUT ON

BEGIN
    FOR rec IN (SELECT empno, sal FROM emp) LOOP
        DECLARE
            v_grade salgrade.grade%TYPE;
        BEGIN
            SELECT grade INTO v_grade
            FROM salgrade
            WHERE rec.sal BETWEEN losal AND hisal;
            
            IF v_grade = 1 THEN
                UPDATE emp SET sal = sal * 1.15 WHERE empno = rec.empno;
            ELSIF v_grade = 2 THEN
                UPDATE emp SET sal = sal * 1.12 WHERE empno = rec.empno;
            ELSIF v_grade = 3 THEN
                UPDATE emp SET sal = sal * 1.10 WHERE empno = rec.empno;
            ELSIF v_grade = 4 THEN
                UPDATE emp SET sal = sal * 1.10 WHERE empno = rec.empno;
            ELSIF v_grade = 5 THEN
                UPDATE emp SET sal = sal * 1.05 WHERE empno = rec.empno;
            END IF;
        END;
    END LOOP;
    COMMIT;
END;
/

/*
OUTPUT:
------
SQL> @C:\Users\DELL\OneDrive\Desktop\PLSQL\Ass9Q2f.sql

PL/SQL procedure successfully completed.

SQL> SELECT * FROM EMP;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        920                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1760        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1400        500         30
      7566 JONES      MANAGER         7839 02-APR-81     3272.5                    20
      7698 BLAKE      MANAGER         7839 01-MAY-81       3135                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2695                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3300                    20
      7839 KING       PRESIDENT            17-NOV-81       5250                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1650          0         30
      7876 ADAMS      CLERK           7788 23-MAY-87       1265                    20
      7900 JAMES      CLERK           7698 03-DEC-81     1092.5                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3300                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1456                    10
      9001 BOS_G2_EMP CLERK                26-APR-25    1345.12                    40
      9002 BOS_G5_EMP CLERK                26-APR-25    3151.05                    40

15 rows selected.

*/
