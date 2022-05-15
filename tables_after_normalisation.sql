
-- Admin table
CREATE TABLE ADMIN (
    ADMIN_ID int primary key,
    USERNAME varchar(45),
    PASSWRD varchar(45)
);

--Flight table
CREATE TABLE FLIGHT(
    FLIGHT_ID int primary key,
    AIRLINE varchar(20),
    DEPARTURE varchar(20),
    DESTINATION varchar(20),
    DEPARTURE_TIME timestamp,
    ARRIVAL_TIME timestamp,
    SEATS_AVAILABLE int,
    BASE_PRICE int,
    ADMIN_ID int,
    CONSTRAINT FK_ADMIN FOREIGN KEY(ADMIN_ID) REFERENCES ADMIN(ADMIN_ID)
);

-- Airtime table
CREATE TABLE AIRTIME(
    DEPARTURE varchar(20),
    DESTINATION varchar(20),
    DURATION varchar(20),
    constraint UNIQUE_AIRTIME UNIQUE(DEPARTURE, DESTINATION)
);


--customer table
CREATE TABLE CUSTOMER(
   CID int primary key,
   FNAME varchar(20),
   LNAME varchar(20),
   DOB date,
   EMAIL varchar(30),
   MOBILE varchar(10),
   PASSWRD varchar(20),
   CONSTRAINT CHK_MOBILELEN CHECK (LENGTH(MOBILE)=10)
);

--ticket table
create table TICKET(
    TICKET_ID int primary key,
    CID int,
    FLIGHT_ID int,
    FOOD_PREF varchar(10),
    BOOKING_DATE timestamp default systimestamp ,
    isVALID int,
    constraint fk_flight foreign key(FLIGHT_ID) references FLIGHT(FLIGHT_ID),
    constraint fk_user foreign key(CID) references CUSTOMER(CID),
    CONSTRAINT CHK_FOOD CHECK (FOOD_PREF='VEG' OR FOOD_PREF='NONVEG'),
    CONSTRAINT CHK_VALID CHECK (isVALID='0' OR isVALID='1')
);



