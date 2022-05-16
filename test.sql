SET SERVEROUTPUT ON size 1000000;
DECLARE
--variable to take input
--flight table
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
mobile_length_error EXCEPTION;





--program start
BEGIN
    ct_cid = &enter_cid;
    ct_fname = &enter_fname;
    ct_lname = &enter_lname;
    ct_dob = &enter_dob;
    ct_email = &enter_email;
    ct_mobile = &enter_mobile;
    if length(ct_mobile)<10 then
        raise mobile_length_error;
    end if;
    ct_passwd = &enter_passwd;
    execute add_customer(ct_cid, 'ct_fname', 'ct_lname', ct_dob, 'ct_email', 'ct_mobile', 'ct_passwd');
    select * from customer;
            

--program end
exceptions
when mobile_length_error then
    dbms_output.put_line('enter a valid mobile number');
when other then
    dbms_output.put_line('run-time error');
When NO_DATA_FOUND then
    dbms_output.put_line('no data found');
when too_many_rows then
    dbms_output.put_line('too many rows');
    
END;



