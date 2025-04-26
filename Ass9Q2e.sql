SET SERVEROUTPUT ON

DECLARE
    v_grade2_losal NUMBER;
    v_grade5_losal NUMBER;
BEGIN
    SELECT losal INTO v_grade2_losal FROM salgrade WHERE grade = 2;
    SELECT losal INTO v_grade5_losal FROM salgrade WHERE grade = 5;

    INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (9001, 'BOS_G2_EMP', 'CLERK', NULL, SYSDATE, v_grade2_losal, NULL, (SELECT deptno FROM dept WHERE loc = 'BOSTON'));

    INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (9002, 'BOS_G5_EMP', 'CLERK', NULL, SYSDATE, v_grade5_losal, NULL, (SELECT deptno FROM dept WHERE loc = 'BOSTON'));

    COMMIT;
END;
/

/*
OUTPUT:
------
SQL> @C:\Users\DELL\OneDrive\Desktop\PLSQL\Ass9Q2e.sql

PL/SQL procedure successfully completed.

SQL> SELECT * FROM EMP;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10
      9001 BOS_G2_EMP CLERK                26-APR-25       1201                    40
      9002 BOS_G5_EMP CLERK                26-APR-25       3001                    40

15 rows selected.
*/
