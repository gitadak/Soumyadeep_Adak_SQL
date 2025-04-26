/*
CREATE TABLE EMP_HISTORY (
    EMPNO NUMBER,
    OLD_SAL NUMBER,
    CHANGE_DATE DATE
);
*/

BEGIN
    FOR rec IN (SELECT empno, sal FROM emp) LOOP
        DECLARE
            v_grade salgrade.grade%TYPE;
        BEGIN
            INSERT INTO EMP_HISTORY (EMPNO, OLD_SAL, CHANGE_DATE)
            VALUES (rec.empno, rec.sal, SYSDATE);

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
SQL> @C:\Users\DELL\OneDrive\Desktop\PLSQL\Ass9Q2g.sql

PL/SQL procedure successfully completed.

SQL> SELECT * FROM EMP_HISTORY;

     EMPNO    OLD_SAL CHANGE_DA
---------- ---------- ---------
      7369       1058 26-APR-25
      7499       1936 26-APR-25
      7521       1568 26-APR-25
      7566    3436.13 26-APR-25
      7698    3291.75 26-APR-25
      7782     2964.5 26-APR-25
      7788       3465 26-APR-25
      7839     5512.5 26-APR-25
      7844       1815 26-APR-25
      7876     1416.8 26-APR-25
      7900    1256.38 26-APR-25
      7902       3465 26-APR-25
      7934     1601.6 26-APR-25
      9001    1506.53 26-APR-25
      9002     3308.6 26-APR-25

15 rows selected.

*/