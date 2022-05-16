select * from customer;
execute add_customer(207, 'tanmay', 'gupta', DATE '2002-04-01', 'tgupta_4@thapar.edu', '5462138790', 'pass');
select * from customer;

select * from ticket;
execute delete_ticket(4);
select * from ticket;

execute add_ticket(204,1001,'VEG',1);

