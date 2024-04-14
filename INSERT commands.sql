
INSERT INTO Person (Name, Phone, Age, Sex, Pincode, Street, House_no, City, Country, Birthdate, Password, Person_id)
VALUES ('Rajesh Kumar', '9876543210', '35', 'M', '110001', 'MG Road', '101', 'New Delhi', 'India', TO_DATE('15-04-1989', 'DD-MM-YY'), 'pass1', 'PID000000001');


INSERT INTO Person (Name, Phone, Age, Sex, Pincode, Street, House_no, City, Country, Birthdate, Password, Person_id)
VALUES ('Amit Singh', '9876543212', '42', 'M', '560001', 'Brigade Road', '303', 'Bangalore', 'India', TO_DATE('10-11-1980', 'DD-MM-YY'), 'pass3', 'PID000000003');

INSERT INTO Person (Name, Phone, Age, Sex, Pincode, Street, House_no, City, Country, Birthdate, Password, Person_id)
VALUES ('Sunita Gupta', '9876543213', '33', 'F', '600001', 'Anna Nagar', '404', 'Chennai', 'India', TO_DATE('05-09-1989', 'DD-MM-YY'), 'pass4', 'PID000000004');

INSERT INTO Person (Name, Phone, Age, Sex, Pincode, Street, House_no, City, Country, Birthdate, Password, Person_id)
VALUES ('Ankit Patel', '9876543214', '29', 'M', '110001', 'Connaught Place', '505', 'New Delhi', 'India', TO_DATE('20-03-1995', 'DD-MM-YY'), 'pass5', 'PID000000005');

INSERT INTO Person (Name, Phone, Age, Sex, Pincode, Street, House_no, City, Country, Birthdate, Password, Person_id)
VALUES ('Neha Khanna', '9876543215', '36', 'F', '400001', 'Worli Sea Face', '606', 'Mumbai', 'India', TO_DATE('12-08-1988', 'DD-MM-YY'), 'pass6', 'PID000000006');

INSERT INTO Person (Name, Phone, Age, Sex, Pincode, Street, House_no, City, Country, Birthdate, Password, Person_id)
VALUES ('Rahul Verma', '9876543216', '31', 'M', '560001', 'Indiranagar', '707', 'Bangalore', 'India', TO_DATE('18-06-1993', 'DD-MM-YY'), 'pass7', 'PID000000007');

INSERT INTO Person (Name, Phone, Age, Sex, Pincode, Street, House_no, City, Country, Birthdate, Password, Person_id)
VALUES ('Aarti Sharma', '9876543217', '26', 'F', '600001', 'Adyar', '808', 'Chennai', 'India', TO_DATE('29-11-1998', 'DD-MM-YY'), 'pass8', 'PID000000008');



INSERT INTO Person (Name, Phone, Age, Sex, Pincode, Street, House_no, City, Country, Birthdate, Password, Person_id)
VALUES ('Priyanka Das', '9876543219', '24', 'F', '400001', 'Juhu Beach', '100', 'Mumbai', 'India', TO_DATE('14-10-2000', 'DD-MM-YY'), 'pass10', 'PID000000010');





INSERT INTO Customer (Person_id) VALUES ('PID000000001');
INSERT INTO Customer (Person_id) VALUES ('PID000000003');
INSERT INTO Customer (Person_id) VALUES ('PID000000005');
INSERT INTO Customer (Person_id) VALUES ('PID000000007');




-- Insert data into Tour_guide table
INSERT INTO Tour_guide (salary, Person_id) VALUES ('30000', 'PID000000004');
INSERT INTO Tour_guide (salary, Person_id) VALUES ('32000', 'PID000000006');
INSERT INTO Tour_guide (salary, Person_id) VALUES ('28000', 'PID000000008');
INSERT INTO Tour_guide (salary, Person_id) VALUES ('31000', 'PID000000010');

 


-- Insert data into Travel_agency table
INSERT INTO Travel_agency (Name, company_id, phone_number, email_address, pincode, door_no, street, city, country)
VALUES ('Travel World', 'COMP1', '9876543210', 'info@travelworld.com', '110001', '101A', 'MG Road', 'New Delhi', 'India');

INSERT INTO Travel_agency (Name, company_id, phone_number, email_address, pincode, door_no, street, city, country)
VALUES ('Global Travels', 'COMP2', '9876543211', 'contact@globaltravels.com', '400001', '202B', 'Marine Drive', 'Mumbai', 'India');

INSERT INTO Travel_agency (Name, company_id, phone_number, email_address, pincode, door_no, street, city, country)
VALUES ('Dream Destinations', 'COMP3', '9876543212', 'dreams@dreamdestinations.com', '560001', '303C', 'Brigade Road', 'Bangalore', 'India');

INSERT INTO Travel_agency (Name, company_id, phone_number, email_address, pincode, door_no, street, city, country)
VALUES ('City Explorers', 'COMP4', '9876543213', 'explore@cityexplorers.com', '600001', '404D', 'Anna Nagar', 'Chennai', 'India');




-- Insert data into Tour_package table
INSERT INTO Tour_package (Package_id, tour_name, no_of_days, max_no_of_people, cost_for_one_person, start_date, end_date, no_of_places, company_id)
VALUES ('TP001', 'Golden Triangle Tour', 5, 20, 15000, TO_DATE('01-06-2024', 'DD-MM-YY'), TO_DATE('05-06-2024', 'DD-MM-YY'), 3, 'COMP1');

INSERT INTO Tour_package (Package_id, tour_name, no_of_days, max_no_of_people, cost_for_one_person, start_date, end_date, no_of_places, company_id)
VALUES ('TP002', 'Mumbai sea Experience', 7, 15, 20000, TO_DATE('10-07-2024', 'DD-MM-YY'), TO_DATE('17-07-2024', 'DD-MM-YY'), 5, 'COMP2');

INSERT INTO Tour_package (Package_id, tour_name, no_of_days, max_no_of_people, cost_for_one_person, start_date, end_date, no_of_places, company_id)
VALUES ('TP003', 'Bangalore city safari', 10, 12, 25000, TO_DATE('05-08-2024', 'DD-MM-YY'), TO_DATE('15-08-2024', 'DD-MM-YY'), 4, 'COMP3');

INSERT INTO Tour_package (Package_id, tour_name, no_of_days, max_no_of_people, cost_for_one_person, start_date, end_date, no_of_places, company_id)
VALUES ('TP004', 'Chennai Beach Retreat', 3, 25, 12000, TO_DATE('20-09-2024', 'DD-MM-YY'), TO_DATE('23-09-2024', 'DD-MM-YY'), 2, 'COMP4');


-- Insert data into Book_tour table
INSERT INTO Book_tour (type_of_transaction, Transaction_id, package_id, person_id)
VALUES ('Offline', 'TRN1', 'TP001', 'PID000000001');

INSERT INTO Book_tour (type_of_transaction, Transaction_id, package_id, person_id)
VALUES ('Online', 'TRN2', 'TP002', 'PID000000003');

INSERT INTO Book_tour (type_of_transaction, Transaction_id, package_id, person_id)
VALUES ('Offline', 'TRN3', 'TP003', 'PID000000005');

INSERT INTO Book_tour (type_of_transaction, Transaction_id, package_id, person_id)
VALUES ('Offline', 'TRN4', 'TP004', 'PID000000007');


DONT INSERT CANCEL_TOUR TABLE VALUES

-- Insert data into cancel_tour table
INSERT INTO cancel_tour (cancellation_id, refund_amount, date_of_cancellation, Transaction_id)
VALUES ('CAN1', 0, TO_DATE('2024-04-20', 'YYYY-MM-DD'), 'TRN1');

INSERT INTO cancel_tour (cancellation_id, refund_amount, date_of_cancellation, Transaction_id)
VALUES ('CAN2', 0, TO_DATE('2024-04-20', 'YYYY-MM-DD'), 'TRN2');

INSERT INTO cancel_tour (cancellation_id, refund_amount, date_of_cancellation, Transaction_id)
VALUES ('CAN3', 0, TO_DATE('2024-04-20', 'YYYY-MM-DD'), 'TRN3');

INSERT INTO cancel_tour (cancellation_id, refund_amount, date_of_cancellation, Transaction_id)
VALUES ('CAN4', 0, TO_DATE('2024-04-27', 'YYYY-MM-DD'), 'TRN4');



-- Insert data into cities table
INSERT INTO cities (City_id, City_name, Pincode, state, country, website_address)
VALUES ('CITY1', 'New Delhi', '110001', 'Delhi', 'India', 'https://newdelhi.gov.in');

INSERT INTO cities (City_id, City_name, Pincode, state, country, website_address)
VALUES ('CITY2', 'Mumbai', '400001', 'Maharashtra', 'India', 'https://mumbai.gov.in');

INSERT INTO cities (City_id, City_name, Pincode, state, country, website_address)
VALUES ('CITY3', 'Bangalore', '560001', 'Karnataka', 'India', 'https://bangalore.gov.in');

INSERT INTO cities (City_id, City_name, Pincode, state, country, website_address)
VALUES ('CITY4', 'Chennai', '600001', 'Tamil Nadu', 'India', 'https://chennai.gov.in');



-- Insert data into Flight table
INSERT INTO Flight (capacity, flight_no, type_of_flight, source, destination)
VALUES (150, 'FL1', 'Domestic', 'New Delhi', 'Mumbai');

INSERT INTO Flight (capacity, flight_no, type_of_flight, source, destination)
VALUES (200, 'FL2', 'Domestic', 'Mumbai', 'Bangalore');

INSERT INTO Flight (capacity, flight_no, type_of_flight, source, destination)
VALUES (180, 'FL3', 'Domestic', 'Bangalore', 'Chennai');

INSERT INTO Flight (capacity, flight_no, type_of_flight, source, destination)
VALUES (170, 'FL4', 'Domestic', 'Chennai', 'New Delhi');





INSERT INTO feedback (feedback_description, person_id, package_id)
VALUES ('The tour exceeded my expectations. I had a wonderful time and would highly recommend it to others.', 'PID000000001', 'TP001');

INSERT INTO feedback (feedback_description, person_id, package_id)
VALUES ('I thoroughly enjoyed the experience. The arrangements were excellent, and I felt well taken care of throughout the tour.', 'PID000000003', 'TP002');

INSERT INTO feedback (feedback_description, person_id, package_id)
VALUES ('The trip was fantastic! I made unforgettable memories and learned a lot about the culture and history of the places we visited.', 'PID000000005', 'TP003');

INSERT INTO feedback (feedback_description, person_id, package_id)
VALUES ('It was a relaxing and rejuvenating retreat. I returned home feeling refreshed and grateful for the wonderful experience.', 'PID000000007', 'TP004');




-- Hotels in New Delhi
INSERT INTO hotel (Hotel_id, phone_no, hotel_name, city_id)
VALUES ('HOT1', '9876543210', 'Deluxe Inn', 'CITY1');

-- Hotels in Mumbai
INSERT INTO hotel (Hotel_id, phone_no, hotel_name, city_id)
VALUES ('HOT2', '9876543211', 'Sea Breeze Resort', 'CITY2');

-- Hotels in Bangalore
INSERT INTO hotel (Hotel_id, phone_no, hotel_name, city_id)
VALUES ('HOT3', '9876543212', 'Mountain View Lodge', 'CITY3');

-- Hotels in Chennai
INSERT INTO hotel (Hotel_id, phone_no, hotel_name, city_id)
VALUES ('HOT4', '9876543213', 'Ocean View Hotel', 'CITY4');



-- Insert statements for hotel_booking_details table
INSERT INTO hotel_booking_details (Booking_no, hotel_booking_date, Person_id, Hotel_id) VALUES ('HB001', TO_DATE('02-04-2024', 'DD-MM-YY'), 'PID000000001', 'HOT1');
INSERT INTO hotel_booking_details (Booking_no, hotel_booking_date, Person_id, Hotel_id) VALUES ('HB002', TO_DATE('09-05-2024', 'DD-MM-YY'), 'PID000000003', 'HOT2');
INSERT INTO hotel_booking_details (Booking_no, hotel_booking_date, Person_id, Hotel_id) VALUES ('HB003', TO_DATE('16-06-2024', 'DD-MM-YY'), 'PID000000005', 'HOT3');
INSERT INTO hotel_booking_details (Booking_no, hotel_booking_date, Person_id, Hotel_id) VALUES ('HB004', TO_DATE('23-07-2024', 'DD-MM-YY'), 'PID000000007', 'HOT4');




INSERT INTO package_cities (city_id, package_id) VALUES ('CITY1', 'TP001');	
INSERT INTO package_cities (city_id, package_id) VALUES ('CITY2', 'TP002');
INSERT INTO package_cities (city_id, package_id) VALUES ('CITY3', 'TP003');
INSERT INTO package_cities (city_id, package_id) VALUES ('CITY4', 'TP004');



-- Inserting flight booking details
INSERT INTO flight_booking_details (Booking_id, Seat_no, Cost_of_journey, Date_of_travel, Flight_no, Person_id)
VALUES ('FB001', 'A01', 5000, TO_DATE('2024-06-15', 'YYYY-MM-DD'), 'FL1', 'PID000000001');

INSERT INTO flight_booking_details (Booking_id, Seat_no, Cost_of_journey, Date_of_travel, Flight_no, Person_id)
VALUES ('FB002', 'B02', 6500, TO_DATE('2024-07-20', 'YYYY-MM-DD'), 'FL2', 'PID000000003');

INSERT INTO flight_booking_details (Booking_id, Seat_no, Cost_of_journey, Date_of_travel, Flight_no, Person_id)
VALUES ('FB003', 'C03', 8000, TO_DATE('2024-08-25', 'YYYY-MM-DD'), 'FL3', 'PID000000005');

INSERT INTO flight_booking_details (Booking_id, Seat_no, Cost_of_journey, Date_of_travel, Flight_no, Person_id)
VALUES ('FB004', 'D04', 7000, TO_DATE('2024-09-30', 'YYYY-MM-DD'), 'FL4', 'PID000000007');



-- Inserting guide travel agency details
INSERT INTO guide_travel_agency (Person_id, company_id)
VALUES ('PID000000004', 'COMP3');

INSERT INTO guide_travel_agency (Person_id, company_id)
VALUES ('PID000000006', 'COMP2');

INSERT INTO guide_travel_agency (Person_id, company_id)
VALUES ('PID000000008', 'COMP1');

INSERT INTO guide_travel_agency (Person_id, company_id)
VALUES ('PID000000010', 'COMP4');




