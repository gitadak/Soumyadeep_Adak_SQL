CREATE OR REPLACE TRIGGER trg_after_insert_emp
AFTER INSERT ON EMP2
FOR EACH ROW
BEGIN
    INSERT INTO EMP_BACKUP (EMPID, ENAME, SALARY)
    VALUES (:NEW.EMPID, :NEW.ENAME, :NEW.SALARY);
END;
/

/*
OUTPUT:
------
SQL> @C:\Users\DELL\OneDrive\Desktop\PLSQL\Ass10Q1c.sql

Trigger created.

SQL> SELECT * FROM EMP_BACKUP;

no rows selected

SQL> INSERT INTO EMP2 VALUES (1,'Raj Das',23140);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM EMP_BACKUP;

     EMPID ENAME          SALARY
---------- ---------- ----------
         1 Raj Das         23140

*/