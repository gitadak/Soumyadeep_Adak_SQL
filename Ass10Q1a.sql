CREATE OR REPLACE TRIGGER trg_before_insert_employee1
BEFORE INSERT ON Employee1
FOR EACH ROW
BEGIN
    IF :NEW.PERKS > 500 THEN
        :NEW.SALARY := :NEW.SALARY - 300;
    END IF;
END;
/

/*
OUTPUT:
------
SQL> @C:\Users\DELL\OneDrive\Desktop\PLSQL\Ass10Q1a.sql

Trigger created.

SQL> INSERT INTO Employee1 VALUES (4, 'David', 'Newtown', 'Salesman', 20000, 560);

1 row created.

SQL> SELECT * FROM EMPLOYEE1;

       EID ENAME      CITY                           DESIGNATION                        SALARY      PERKS
---------- ---------- ------------------------------ ------------------------------ ---------- ----------
         1 Alice      New York                       Manager                             12000        600
         2 Bob        Chicago                        Developer                            8000        400
         3 Charlie    Los Angeles                    Analyst                              7000        700
         4 David      Newtown                        Salesman                            19700        560
*/