drop table guide_travel_agency;
drop table hotel_booking_details;
drop table hotel;
drop table feedback;
drop table cancel_tour;
drop table book_tour;
drop table package_cities;
drop table tour_package;
drop table travel_agency;
drop table flight_booking_details;
drop table customer;
drop table tour_guide;
drop table person;
drop table cities;
drop table Flight;


CREATE TABLE Person(
  Name Varchar(50) not null,
  Phone Varchar(13) not null,
  Age Varchar(2) not null,
  Sex Char(1) not null,
  Pincode Varchar(10) not null,
  Street Varchar(85),
  House_no Varchar(3) ,
  City Varchar(60) not null,
  Country Varchar(60) not null,
  Birthdate Date not null,
  Password Varchar(8),
  Person_id Varchar(12) primary key);

CREATE TABLE Customer(
Person_id Varchar(12) primary key,
  constraint customervsperson foreign key (person_id) references Person(person_id) on delete cascade);

CREATE TABLE Tour_guide(
  salary Varchar(10) not null,
  Person_id Varchar(12) primary key,
  constraint tourguidevsperson foreign key (person_id) references Person(person_id) on delete cascade);

CREATE TABLE Travel_agency(
  Name Varchar(50) not null,
  company_id Varchar(5) primary key,
  phone_number Varchar(13),
  email_address Varchar(50),
  pincode Varchar(10) not null,
  door_no Varchar(4),
  street Varchar(85),
  city Varchar(60) not null,
  country Varchar(60) not null);

CREATE TABLE Tour_package(
  Package_id Varchar(5) primary key,
  tour_name Varchar(25) not null,
  no_of_days int,
  max_no_of_people Int,
  cost_for_one_person Int,
  start_date Date,
  end_date Date,
  no_of_places Int,
  company_id Varchar(5) not null,
  constraint tourpackagevstravelagency foreign key (company_id) references Travel_agency(company_id)on delete cascade);

CREATE TABLE Book_tour(
  type_of_transaction Varchar(100) not null,
  Transaction_id Varchar(5) primary key,
  package_id Varchar(5) not null,
  person_id Varchar(12) not null,
  constraint bookingvsperson foreign key (person_id) references Customer(person_id)on delete cascade,
  constraint bookingtourvspackage foreign key (package_id) references tour_package(package_id)on delete cascade);

CREATE TABLE cancel_tour(
  cancellation_id Varchar(5) primary key,
  refund_amount Int not null,
  date_of_cancellation Date not null,
  Transaction_id Varchar(5) not null unique,
  constraint cancellationvsbookingtour foreign key (Transaction_id) references Book_tour(Transaction_id)on delete cascade);

CREATE TABLE cities(
  City_id Varchar(5) primary key,
  City_name varchar(50) not null,
  Pincode Varchar(10),
  state varchar(50),
  country varchar(50),
  website_address varchar(100));

CREATE TABLE Flight(
 capacity Int,
 flight_no varchar(10) primary key,
 type_of_flight char(20) not null,
 source char(10) not null,
 destination char(10) not null);
 

 
CREATE TABLE feedback(
 feedback_description varchar(400),
 person_id varchar(12) not null,
 package_id varchar(5) not null,
 primary key(person_id,package_id),
 constraint feedbackvsperson foreign key (person_id) references Customer(person_id) on delete cascade,
 constraint feedbackvstourpackage foreign key (package_id) references Tour_package(package_id) on delete cascade);

CREATE TABLE hotel(
 Hotel_id varchar(5) primary key,
 phone_no varchar(13),
 hotel_name varchar(20) not null,
 city_id varchar(5) not null,
 constraint cityvshotel foreign key (city_id) references cities(city_id) on delete cascade);

CREATE TABLE hotel_booking_details(
 Booking_no varchar(5),
 hotel_booking_date Date,
 Person_id varchar(12) not null,
 Hotel_id varchar(5) not null,
 primary key(Booking_no),
 constraint hotelbookingvshotel foreign key (hotel_id) references Hotel(hotel_id) on delete cascade,
 constraint hotelbookingvsperson foreign key (person_id) references Customer(person_id) on delete cascade);

CREATE TABLE package_cities(
 city_id varchar(5) not null,
 package_id varchar(5) not null,
 primary key(city_id,package_id),
 constraint packagecitiesvscities foreign key (city_id) references cities(city_id) on delete set null,
 constraint packagecitiesvstourpackage foreign key (package_id) references Tour_package(package_id) on delete set null);


CREATE TABLE flight_booking_details(
 Booking_id varchar(5) primary key,
 Seat_no varchar(3),
 Cost_of_journey Int,
 Date_of_travel Date,
 Flight_no varchar(10) not null,
 Person_id varchar(12) not null,
 constraint flightbookingvsperson foreign key (person_id) references customer(person_id) on delete set null,
 constraint flightbookingvsflight foreign key (flight_no) references Flight(flight_no) on delete set null);

CREATE TABLE guide_travel_agency(
 Person_id varchar(12) not null,
 company_id varchar(5) not null,
 primary key(person_id,company_id),
 constraint guidetravelagencyvsguide foreign key (person_id) references Tour_guide(person_id) on delete cascade,
 constraint guidetravelagencyvstravelagency foreign key (company_id) references Travel_agency(company_id) on delete set null);

