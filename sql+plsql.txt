SIMPLE QUERIES:

1)Retrieve all customers' names and their corresponding phone numbers:

SELECT p.Name, p.Phone
FROM Person p
INNER JOIN Customer c ON p.Person_id = c.Person_id;

2)List all tour packages along with their start and end dates:

SELECT tour_name, start_date, end_date
FROM Tour_package;

3)Find the details of the hotels located in Bangalore:
SELECT *
FROM hotel
WHERE city_id = 'CITY3';

4)Retrieve the flight details for flights departing from Chennai:
SELECT *
FROM Flight
WHERE source = 'Chennai';

COMPLEX QUERIES:

1)List the tour guides along with their salaries and the travel agency they work for:
SELECT p.Name AS Guide_Name, t.salary AS Salary, ta.Name AS Agency_Name
FROM Person p
INNER JOIN Tour_guide t ON p.Person_id = t.Person_id
INNER JOIN guide_travel_agency g ON p.Person_id = g.Person_id
INNER JOIN Travel_agency ta ON g.company_id = ta.company_id;

2)etrieve the tour packages along with the number of cities included in each package:
SELECT tp.tour_name, COUNT(pc.city_id) AS Number_of_Cities
FROM Tour_package tp
LEFT JOIN package_cities pc ON tp.Package_id = pc.package_id
GROUP BY tp.tour_name;

3)Find the total number of bookings made for each tour package:
SELECT tp.tour_name, COUNT(bt.Transaction_id) AS Total_Bookings
FROM Tour_package tp
LEFT JOIN Book_tour bt ON tp.Package_id = bt.package_id
GROUP BY tp.tour_name;

4)Find the total cost of bookings made by each customer:
SELECT p.Name, SUM(tp.cost_for_one_person) AS Total_Cost
FROM Person p
INNER JOIN Customer c ON p.Person_id = c.Person_id
INNER JOIN Book_tour bt ON p.Person_id = bt.person_id
INNER JOIN Tour_package tp ON bt.package_id = tp.Package_id
GROUP BY p.Name;


PROCEDURES

1) This procedure returns hotel bookings in past 1 month.

CREATE OR REPLACE PROCEDURE SIX_MONTH_HOTEL /*HOTEL BOOKED IN PAST 6 MONTHS*/
IS
CURSOR HOTEL_DETAILS IS 
  SELECT P.NAME, H.HOTEL_NAME
  FROM HOTEL H, HOTEL_BOOKING_DETAILS H2, PERSON P
  WHERE (SYSDATE - H2.HOTEL_BOOKING_DATE) <= 180 AND H2.HOTEL_ID = H.HOTEL_ID AND P.PERSON_ID = H2.PERSON_ID;

THISNAME PERSON.NAME%TYPE;
THISHOTELNAME HOTEL.HOTEL_NAME%TYPE;

BEGIN
  OPEN HOTEL_DETAILS;

  LOOP
    FETCH HOTEL_DETAILS INTO THISNAME, THISHOTELNAME;
    EXIT WHEN HOTEL_DETAILS%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Name of customer is: ' || THISNAME || ' and Name of hotel is: ' || THISHOTELNAME);
  END LOOP;

  CLOSE HOTEL_DETAILS;
END;
/

declare
  begin
   six_month_hotel;
  end;
  /

2) This procedure gets the names of cities which are visited by the customers
for the given package organized by the particular travel agency.

CREATE OR REPLACE PROCEDURE cities_visited(agencyname IN VARCHAR2, packagename IN VARCHAR2) AS
  CURSOR citiess IS 
    SELECT p.name AS person_name, c1.city_name, a.name AS agency_name, t.tour_name
    FROM customer c, person p, travel_agency a, book_tour b, tour_package t, cities c1, package_cities p1
    WHERE b.package_id = t.package_id AND t.company_id = a.company_id AND a.name = agencyname
    AND t.tour_name = packagename AND c.person_id = b.person_id
    AND c.person_id = p.person_id AND t.package_id = p1.package_id AND p1.city_id = c1.city_id;
  
  cityy citiess%ROWTYPE;
BEGIN
  OPEN citiess;
  
  LOOP
    FETCH citiess INTO cityy;
    EXIT WHEN citiess%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Travel agency name: ' || cityy.agency_name || ' and City name: ' || cityy.city_name || ' and Package name: ' || cityy.tour_name || ' and Customer name: ' || cityy.person_name);
  END LOOP;
  
  CLOSE citiess;
END;
/
declare
  begin
   cities_visited('Global Travels','Mumbai sea Experience');
  end;
  /

3)To get the most popular(most booked) package name and the customer names
who booked that package.

CREATE OR REPLACE PROCEDURE TOP_PACKAGE IS
    -- Declare variables
    thistourname tour_package.tour_name%TYPE;
    thisname person.name%TYPE;
    
    -- Cursor definition
    CURSOR T_PACKAGE IS 
        SELECT t1.tour_name, p.name 
        FROM (
            SELECT pkg_id 
            FROM (
                SELECT p.package_id pkg_id, count(*) cnt
                FROM tour_package p, book_tour b
                WHERE b.transaction_id NOT IN (
                        SELECT c.transaction_id 
                        FROM cancel_tour c
                    ) 
                AND p.package_id = b.package_id
                GROUP BY p.package_id
            )
            WHERE cnt = (
                    SELECT MAX(cnt) 
                    FROM (
                        SELECT p.package_id pkg_id, count(*) cnt
                        FROM tour_package p, book_tour b
                        WHERE b.transaction_id NOT IN (
                                SELECT c.transaction_id 
                                FROM cancel_tour c
                            ) 
                        AND p.package_id = b.package_id
                        GROUP BY p.package_id
                    )
                )
        ) t, book_tour b, person p, tour_package t1
        WHERE t.pkg_id = b.package_id 
        AND p.person_id = b.person_id 
        AND t1.package_id = t.pkg_id;

BEGIN
    -- Open cursor
    OPEN T_PACKAGE;
    
    -- Fetch data and print
    LOOP
        FETCH T_PACKAGE INTO thistourname, thisname;
        EXIT WHEN T_PACKAGE%NOTFOUND;
        dbms_output.put_line('tour name: ' || thistourname || ' customer name: ' || thisname);
    END LOOP;
    
    -- Close cursor
    CLOSE T_PACKAGE;
END;
/

declare
  begin
   top_package;
  end;
  /

TRIGGERS:
1)
This is the trigger to delete the transactions permanently from the database if the no of cancellations in the cancelled table is more than 5000.

CREATE or replace TRIGGER deletion
BEFORE insert ON cancel_tour
for each row
declare
	thisnumber int;
begin
	SELECT count(*)into thisnumber
	FROM cancel_tour c;
	if(thisnumber>5000)then 
		delete from book_tour b where b.transaction_id in
		(select c.transaction_id from cancel_tour c, book_tour b where
		c.transaction_id=b.transaction_id);
	end if;
	if (thisnumber>5000)
		then
		delete from cancel_tour c;
	end if;
end;
/

2)This is the trigger to increase the salary of the tour guide if the corresponding company have 10
bookings.

CREATE OR REPLACE TRIGGER salary_updates
BEFORE INSERT ON Book_tour
FOR EACH ROW
BEGIN
    UPDATE TOUR_GUIDE t
    SET salary = salary + 5000
    WHERE t.person_id IN (
        SELECT g.person_id
        FROM guide_travel_agency g
        WHERE g.company_id IN (
            SELECT p.company_id
            FROM book_tour b, tour_package p
            WHERE b.transaction_id NOT IN (
                    SELECT c.transaction_id 
                    FROM cancel_tour c
                ) 
            AND b.package_id = p.package_id
            GROUP BY p.company_id
            HAVING COUNT(p.company_id) = 10
        )
    );
END;
/
































