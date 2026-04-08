SET SERVEROUTPUT ON;
CREATE TABLE EMP (
Empno NUMBER,
Ename VARCHAR2(50)
);

CREATE OR REPLACE TRIGGER restrict_weekend_access
BEFORE INSERT OR UPDATE OR DELETE ON EMP
BEGIN
IF TO_CHAR(SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
DBMS_OUTPUT.PUT_LINE('Warning: Today is weekend, but
operation is allowed.');
END IF;
END;
/

INSERT INTO EMP VALUES (101, 'John');
UPDATE EMP SET Ename = 'Johnny' WHERE Empno = 101;
DELETE FROM EMP WHERE Empno = 101;

“ OUTPUT RESUIT”
Warning: Today is weekend, but operation is allowed.
Warning: Today is weekend, but operation is allowed.
Warning: Today is weekend, but operation is allowed.