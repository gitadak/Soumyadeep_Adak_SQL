CREATE OR REPLACE TRIGGER trg_before_update_employee1
BEFORE UPDATE ON Employee1
FOR EACH ROW
BEGIN
    IF :NEW.SALARY <= 500 THEN
        :NEW.SALARY := 10000;
    ELSE
        :NEW.SALARY := 15000;
    END IF;
END;
/

/*
OUTPUT:
------
SQL> @C:\Users\DELL\OneDrive\Desktop\PLSQL\Ass10Q1b.sql

Trigger created.

SQL> SELECT * FROM EMPLOYEE1;

       EID ENAME      CITY                 DESIGNATION                                            SALARY      PERKS
---------- ---------- -------------------- -------------------------------------------------- ---------- ----------
         1 Alice      New York             Manager                                                 12000        600
         2 Bob        Chicago              Developer                                                8000        400
         3 Charlie    Los Angeles          Analyst                                                  7000        700
         4 David      Newtown              Salesman                                                19700        560

SQL> UPDATE EMPLOYEE1 SET CITY = 'Dallas' WHERE EID = 1;

1 row updated.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM EMPLOYEE1;

       EID ENAME      CITY                 DESIGNATION                                            SALARY      PERKS
---------- ---------- -------------------- -------------------------------------------------- ---------- ----------
         1 Alice      Dallas               Manager                                                 15000        600
         2 Bob        Chicago              Developer                                                8000        400
         3 Charlie    Los Angeles          Analyst                                                  7000        700
         4 David      Newtown              Salesman                                                19700        560

*/