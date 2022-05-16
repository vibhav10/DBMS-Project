select * from flight where flight_id=1001;
execute add_ticket(204,1001,'VEG',1);
select * from flight where flight_id=1001;

select * from flight where flight_id=1001;
execute delete_ticket(7);
select * from flight where flight_id=1001;