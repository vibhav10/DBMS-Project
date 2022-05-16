-- A trigger that raises an exception if arrival time is before departure time as it is not possible.
CREATE OR REPLACE TRIGGER raise_exception
BEFORE INSERT OR UPDATE ON FLIGHT
FOR EACH ROW
Declare
wrong_time exception;
BEGIN
    IF :new.ARRIVAL_TIME < :new.DEPARTURE_TIME THEN
        RAISE wrong_time;
    END IF;
exception
WHEN wrong_time THEN
    dbms_output.put_line('Arrival time cannot be before departure time');
END;


