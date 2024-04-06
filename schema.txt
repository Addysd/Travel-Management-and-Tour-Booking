CREATE TABLE Person(
  Name Varchar(50) not null,
  Phone Int not null,
  Age Int not null,
  Sex Char(1) not null,
  Pincode Int not null,
  Street Varchar(85),
  House_no Int ,
  City Varchar(60) not null,
  Country Varchar(60) not null,
  Birthdate Date not null,
  Person_id Int primary key);

CREATE TABLE Customer(
  Person_id Int primary key,
  constraint customervsperson foreign key (person_id) references Person(person_id) on delete cascade);

CREATE TABLE Tour_guide(
  salary Int not null,
  person_id Int primary key,
  constraint tourguidevsperson foreign key (person_id) references Person(person_id) on delete cascade);

CREATE TABLE Travel_agency(
  Name Char(70) not null,
  company_id Int primary key,
  phone_number Varchar(11),
  email_address Varchar(50),
  pincode Int not null,
  door_no Int,
  street Varchar(85),
  city Varchar(60) not null,
  country Varchar(60) not null);

CREATE TABLE Tour_package(
  Package_id Int primary key,
  tour_name Varchar(50) not null,
  no_of_days Int,
  max_no_of_people Int,
  cost_for_one_person Int,
  start_date Date,
  end_date Date,
  no_of_places Int,
  company_id Int not null,
  constraint tourpackagevstravelagency foreign key (company_id) references Travel_agency(company_id)on delete cascade);

CREATE TABLE Book_tour(
  type_of_transaction Varchar(100) not null,
  Transaction_id Int primary key,
  package_id Int not null,
  person_id Int not null,
  date_of_booking Date not null,
  duedate_of_payment Date not null,
  outstanding_balance Int not null,
  advance_amount Int not null,
  constraint bookingvsperson foreign key (person_id) references Customer(person_id)on delete cascade,
  constraint bookingtourvspackage foreign key (package_id) references tour_package(package_id)on delete cascade);

CREATE TABLE cancel_tour(
  cancellation_id Int primary key,
  refund_amount Int not null,
  date_of_cancellation Date not null,
  Transaction_id Int not null unique,
  constraint cancellationvsbookingtour foreign key (Transaction_id) references Book_tour(Transaction_id)on delete cascade);

CREATE TABLE cities(
  City_id Int primary key,
  City_name varchar(50) not null,
  Pincode Int,
  state varchar(50),
  country varchar(50),
  website_address varchar(100));

CREATE TABLE Flight(
 capacity Int,
 flight_no varchar(10) primary key,
 type_of_flight char(20) not null,
 source char(10) not null,
 destination char(20) not null);
 
CREATE TABLE staff(
  salary Int not null,
  person_id Int primary key,
  bonus_per_year Int,
  company_id Int not null,
  constraint staffvsperson foreign key (person_id) references Person(person_id) on delete cascade,
  constraint staffvstravelagency foreign key (company_id) references Travel_agency(company_id) on delete set null);
 
CREATE TABLE feedback(
 feedback_description varchar(400),
 person_id Int not null,
 package_id Int not null,
 primary key(person_id,package_id),
 constraint feedbackvsperson foreign key (person_id) references Customer(person_id) on delete cascade,
 constraint feedbackvstourpackage foreign key (package_id) references Tour_package(package_id) on delete cascade);

CREATE TABLE hotel(
 Hotel_id Int primary key,
 phone_no Int,
 hotel_name varchar(20) not null,
 city_id Int not null,
 constraint cityvshotel foreign key (city_id) references cities(city_id) on delete cascade);

CREATE TABLE hotel_booking_details(
 Booking_no_no Int,
 hotel_booking_date Date,
 Person_id Int not null,
 Hotel_id Int not null,
 primary key(Person_id,hotel_id),
 constraint hotelbookingvshotel foreign key (hotel_id) references Hotel(hotel_id) on delete cascade,
 constraint hotelbookingvsperson foreign key (person_id) references Customer(person_id) on delete cascade);

CREATE TABLE package_cities(
 city_id Int not null,
 package_id Int not null,
 primary key(city_id,package_id),
 constraint packagecitiesvscities foreign key (city_id) references cities(city_id) on delete set null,
 constraint packagecitiesvstourpackage foreign key (package_id) references Tour_package(package_id) on delete set null);


CREATE TABLE flight_booking_details(
 Booking_id Int primary key,
 Seat_no Int,
 Cost_of_journey Int,
 Date_of_travel Date,
 Flight_no varchar(10) not null,
 Person_id Int not null,
 constraint flightbookingvsperson foreign key (person_id) references customer(person_id) on delete set null,
 constraint flightbookingvsflight foreign key (flight_no) references Flight(flight_no) on delete set null);

CREATE TABLE guide_travel_agency(
 Person_id Int not null,
 company_id Int not null,
 primary key(person_id,company_id),
 constraint guidetravelagencyvsguide foreign key (person_id) references Tour_guide(person_id) on delete cascade,
 constraint guidetravelagencyvstravelagency foreign key (company_id) references Travel_agency(company_id) on delete set null);





































