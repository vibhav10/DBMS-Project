-- insert into flight values(1019, 'Air India', 'Delhi', 'Mumbai', '18-05-2022 11:30:01', '18-05-2022 09:00:01', 100, '200', '1');

-- CREATE OR REPLACE TRIGGER raise_exception
-- BEFORE INSERT OR UPDATE ON FLIGHT
-- FOR EACH ROW
-- BEGIN
--     IF :new.ARRIVAL_TIME < :new.DEPARTURE_TIME THEN
--         RAISE_APPLICATION_ERROR(-20000, 'Arrival time cannot be before departure time');
--     END IF;
-- END;

--insert this value to see an exception:
insert into flight values(1019, 'Air India', 'Delhi', 'Mumbai', '18-05-2022 11:30:01', '18-05-2022 09:00:01', '100', '200', '1');
