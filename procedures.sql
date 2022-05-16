--adding flight details
create or replace procedure add_flight(FLIGHT_ID int, airline in varchar2, departure in varchar2, destination in varchar2, departure_time timestamp, arrival_time timestamp, seats_available int, base_price int, admin_id int) as
begin
    insert into flight values(flight_id, airline, departure, destination, departure_time, arrival_time, seats_available, base_price, admin_id);
end;
--delete flight 
create or replace procedure delete_flight(fid number) as
begin
    delete from FLIGHT where FLIGHT.FLIGHT_ID=fid;
end;

--adding airtime details
create or replace procedure add_airtime(DEPARTURE in varchar2, DESTINATION in varchar2, DURATION in varchar2) as
begin
    insert into airtime values(DEPARTURE, DESTINATION, DURATION);

end;

--delete airtime details
create or replace procedure delete_airtime(DEPARTURE in varchar2, DESTINATION in varchar2) as
begin
    delete from airtime where airtime.DEPARTURE=DEPARTURE and airtime.DESTINATION=DESTINATION;
end;

--add customer
create or replace procedure add_customer(cid number, fname in varchar2, lname in varchar2, dob date, email in varchar2, mobile in varchar2, passwd in varchar2) as
begin
    insert into customer values(cid, fname, lname, dob, email, mobile, passwd);
end;

--delete customer
create or replace procedure delete_customer(cid number) as
begin
    delete from customer where CID=cid;
end;


--add ticket
create or replace procedure add_ticket( cid number, fid number, food_pref in varchar2, is_valid number) as
begin
    INSERT INTO TICKET(CID,FLIGHT_ID,FOOD_PREF,isVALID)
    VALUES(cid, fid, food_pref ,is_valid);
end;

-- delete ticket
create or replace procedure delete_ticket(tid number) as
begin
    delete from ticket where ticket.TICKET_ID=tid;
end;


