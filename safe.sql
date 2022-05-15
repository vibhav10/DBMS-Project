SET SERVEROUTPUT ON size 1000000;
--prompt user to enter choice
accept x char prompt '1.Flights Table 2.Customers Table 3.Tickets Table 4.Airtime Table'
--prompt user to enter choice
accept y char prompt '1.Insert 2.Delete'
DECLARE
--variable to take input
--flight table

a varchar(1);
b varchar(1);
fv_flight_id FLIGHT.FLIGHT_ID%type;
fv_airline FLIGHT.airline%type;
fv_departure FLIGHT.departure%type;
fv_destination FLIGHT.destination%type;
fv_departure_time FLIGHT.departure_time%type;
fv_arrival_time FLIGHT.arrival_time%type;
fv_seats_available FLIGHT.seats_available%type;
fv_base_price FLIGHT.base_price%type;
fv_admin_id FLIGHT.admin_id%type;

--airtime table
at_departure airtime.DEPARTURE%type;
at_destination airtime.DESTINATION%type;
at_duration airtime.DURATION%type;

--customer table
ct_cid CUSTOMER.CID%type;
ct_fname CUSTOMER.FNAME%type;
ct_lname CUSTOMER.LNAME%type;
ct_dob CUSTOMER.DOB%type;
ct_email CUSTOMER.EMAIL%type;
ct_mobile CUSTOMER.MOBILE%type;
ct_passwd CUSTOMER.PASSWRD%type;

--ticket table
tt_tid TICKET.TID%type;
tt_cid TICKET.CID%type;
tt_fid TICKET.FID%type;
tt_foodpref TICKET.FOOD_PREF%type;
tt_bookingDate TICKET.BOOKING_DATE%type;
tt_isValid TICKET.isVALID%type;


--exceptions


--to access the menu
choice_one integer := 0;
choice_two integer := 0;
flag1 integer:=0; --for finding if the user has entered a valid choice for choice_one
flag2 integer:=0; --for finding if the user has entered a valid choice for choice_two



--program start
BEGIN

    --input the choice
    a := '&x';
    --input the choice
    b :='&y';
    CASE a
        when '1' then 
            CASE b
                when '1' then
                    execute add_flight(&fv_flight_id, '&fv_airline', '&fv_departure', '&fv_destination', &dept_time, &arr_time, &seats, &price, &duration, &aid);
                    select * from flight;
                when '2' then
                    execute delete_flight(&fv_flight_id);
                    select * from flight;
            End CASE;
        when '2' then
            CASE b
                when '1' then 
                    execute add_customer(&cid, '&fname', '&lname', &dob, '&email', '&mobile', '&passwd');
                    select * from customer;
                when '2' then
                    execute delete_customer(&cid);
                    select * from customer;
            End CASE;
        when '3' then
            CASE b
                when '1' then
                    execute add_ticket(&tid, &cid, &fid, &food_pref, &booking_date, &is_valid);
                    select * from ticket;
                when '2' then
                    execute delete_ticket(&tid);
                    select * from ticket;
            End CASE;
        when '4' then
            CASE b
                when '1' then
                    execute add_airtime(&at_departure, &at_destination, &at_duration);
                    select * from airtime;
                when '2' then
                    execute delete_airtime(&at_departure, &at_destination);
                    select * from airtime;
            End CASE;
    END CASE;

END;
