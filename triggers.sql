--Auto increment trigger
-- Sequence to get the next ticket value    
CREATE SEQUENCE increment_ticket_ID
  START WITH 1
  INCREMENT BY 1
  CACHE 100;
--This sequence is used to increment ticket ID because auto_increment doesn’t work.
/
--trigger associated with the sequence
--this will pick the next value from the sequence and insert it into the ticket table
CREATE OR REPLACE TRIGGER incrementTicketID
  BEFORE INSERT ON TICKET
  FOR EACH ROW
BEGIN
  SELECT increment_ticket_ID.nextval
    INTO :new.TICKET_ID
    FROM dual;
END;
/


--Trigger to decrement seats available in a flight after every ticket
CREATE OR REPLACE TRIGGER decrementSeats
  BEFORE INSERT ON TICKET
  FOR EACH ROW
BEGIN
UPDATE FLIGHT SET SEATS_AVAILABLE=SEATS_AVAILABLE-1 WHERE FLIGHT.FLIGHT_ID=:new.FLIGHT_ID;
END;
/

-- Trigger to increment seats available in a flight after every DELETED ticket
CREATE OR REPLACE TRIGGER incrementSeats
  AFTER DELETE ON TICKET
  FOR EACH ROW
BEGIN
UPDATE FLIGHT SET SEATS_AVAILABLE=SEATS_AVAILABLE+1 WHERE FLIGHT.FLIGHT_ID=:old.FLIGHT_ID;
END;
/

--Trigger to make all tickets invalid after departure date has passed
CREATE OR REPLACE TRIGGER checkInValid
  BEFORE INSERT ON TICKET
  FOR EACH ROW
BEGIN
  UPDATE TICKET SET ISVALID=0 WHERE (SELECT FLIGHT.DEPARTURE_TIME FROM FLIGHT WHERE FLIGHT.FLIGHT_ID=TICKET.FLIGHT_ID)<= CURRENT_TIMESTAMP;
END;
/

--Trigger if a new ticket has been booked, it will show "thankyou for booking"
Create or Replace trigger new_booking
after insert on TICKET
Begin 
dbms_output.put_line('Thank you for booking with us');
End;
/

--Trigger if a new flight has been added, it will show "new flight has been added"
Create or Replace trigger new_flight
after insert on FLIGHT
Begin 
dbms_output.put_line('flight has been added');
End;
/