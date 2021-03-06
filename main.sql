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


--to access the menu
choice_one integer := 0;
choice_two integer := 0;
flag1 integer:=0; --for finding if the user has entered a valid choice for choice_one
flag2 integer:=0; --for finding if the user has entered a valid choice for choice_two



--program start
BEGIN
    --prompt user to enter choice
    dbms_output.put_line('CHOICES');
    dbms_output.put_line('1.Flights Table');
    dbms_output.put_line('2.Customers Table');
    dbms_output.put_line('3.Tickets Table');
    dbms_output.put_line('4.Airtime Table');
    --input the choice
    choice_one:=&Enter_the_choice_from_above;
    --promt user to enter choice
    dbms_output.put_line('CHOICES');
    dbms_output.put_line('1.Insert');
    dbms_output.put_line('2.Delete');
    --input the choice
    choice_two:=&Enter_the_choice_from_above;



    if choice_one=1 then
        flag1:=1;
        flag2:=0;
        if choice_two=1 then
            --call insert procedure on Flights table
            execute add_flight (&fv_flight_id, '&fv_airline', '&fv_departure', '&fv_destination', timestamp '&dept_time', timestamp '&arr_time', &seats, &price, &aid);
            select * from flight;
            flag2:=1;
        end if;
        if choice_two=2 then
            --call delete procedure on Flights table
            execute delete_flight(&fid);
            select * from flight;
            flag2:=1;
        end if;
        if flag2=0 then
            dbms_output.put_line('enter a valid option');
        end if;
    end if;
    
    if choice_one=2 then
        flag1:=1;
        flag2:=0;
        if choice_two=1 then
            --call insert procedure on Customers table

            ct_cid := &enter_cid;
            ct_fname := &enter_fname;
            ct_lname := &enter_lname;
            ct_dob := &enter_dob;
            ct_email := &enter_email;
            ct_mobile := &enter_mobile;
            if length(ct_mobile)<10 then
                raise mobile_length_error;
            end if;
            ct_passwd := &enter_passwd;
            execute add_customer(ct_cid, 'ct_fname', 'ct_lname', DATE 'ct_dob', 'ct_email', 'ct_mobile', 'ct_passwd');
            select * from customer;
            flag2:=1;
        end if;
        if choice_two=2 then
            --call delete procedure on Customers table
            ct_cid=&Enter_the_cid_to_delete;
            execute delete_customer(ct_cid);
            select * from customer;
            flag2:=1;
        end if;

        if flag2=0 then
            dbms_output.put_line('enter a valid option');
        end if;
    end if;

    if choice_one=3 then
        flag1:=1;
        flag2:=0;
        if choice_two=1 then
            --call insert procedure on Tickets table
            
            execute add_ticket(&tt_cid, &tt_fid, '&tt_foodpref',&tt_isValid);
            select * from ticket;
            flag2:=1;
        end if;
        if choice_two=2 then
            --call delete procedure on Tickets table
            execute delete_ticket(&tid);
            select * from ticket;
            flag2:=1;
        end if;
        if flag2=0 then
            dbms_output.put_line('enter a valid option');
        end if;
    end if;

    if choice_one=4 then
        flag1:=1;
        flag2:=0;
        if choice_two=1 then
            --call insert procedure on Airtime table
            execute add_airtime(&departure, &destination, &duration);
            select * from airtime;

            flag2:=1;
        end if;
        if choice_two=2 then
            --call delete procedure on Airtime table
            execute delete_airtime(&departure, &destination);
            select * from airtime;
            flag2:=1;
        end if;
        if flag2=0 then
            dbms_output.put_line('enter a valid option');
        end if;
    end if;


    if flag1=0 then
        dbms_output.put_line('enter a valid option');
    end if;
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



