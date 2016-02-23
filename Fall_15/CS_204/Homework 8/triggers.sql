CREATE TABLE Audit_Trail(
  trigger_string VARCHAR(500)
);

CREATE OR REPLACE TRIGGER  before_table BEFORE
UPDATE OF Salary ON Employee FOR EACH ROW
BEGIN
  INSERT INTO Audit_Trail (trigger_String)
  VALUES ('Before_table trigger fired.');
END;
/

CREATE OR REPLACE TRIGGER  after_table AFTER
UPDATE OF Salary ON Employee FOR EACH ROW
BEGIN
  INSERT INTO Audit_Trail (trigger_String)
  VALUES ('After_table trigger fired.');
END;
/

CREATE OR REPLACE TRIGGER  before_row BEFORE
UPDATE OF Salary ON Employee FOR EACH ROW
BEGIN
  INSERT INTO Audit_Trail (trigger_String)
  VALUES ('Before_row trigger fired.');
END;
/

CREATE OR REPLACE TRIGGER  after_row AFTER
UPDATE OF Salary ON Employee FOR EACH ROW
BEGIN
  INSERT INTO Audit_Trail (trigger_String)
  VALUES ('After_row trigger fired.');
END;
/

UPDATE Employee 
SET Salary = Salary * 1.1;

SELECT trigger_string
FROM Audit_Trail;

UPDATE Employee
SET Salary = Salary / 1.1;

DROP TRIGGER before_table;
DROP TRIGGER after_table;
DROP TRIGGER before_row;
DROP TRIGGER after_row;

DROP TABLE Audit_Trail;