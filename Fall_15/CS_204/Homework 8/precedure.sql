CREATE OR REPLACE PROCEDURE mytables (
  oracle_name in all_users.username%type default NULL
)
AS
BEGIN
  IF oracle_name IS NULL THEN
    dbms_output.put_line('Error: Missing Username');
  ELSE
    DECLARE
      CURSOR C1 IS
        SELECT all_users.username, all_tables.table_name
        FROM all_tables, all_users
        WHERE all_users.username = all_tables.owner
        AND all_tables.owner = UPPER(oracle_name);
    BEGIN
      FOR C1_rec IN C1 LOOP
        dbms_output.put_line(
          'Username: ' || C1_rec.username || 
          ', Table Name: ' || C1_rec.table_name
        );
      END LOOP;
    EXCEPTION
      WHEN no_data_found THEN
        dbms_output.put_line('Error: Invalid Username');
    END;
  END IF;
END;
/

EXEC mytables();
EXEC mytables('foobar');
EXEC mytables('sanguish');

DROP PROCEDURE mytables;