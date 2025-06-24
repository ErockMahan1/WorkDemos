/* Welcome to the SQL mini project. You will carry out this project partly in
the PHPMyAdmin interface, and partly in Jupyter via a Python connection.

This is Tier 2 of the case study, which means that there'll be less guidance for you about how to setup
your local SQLite connection in PART 2 of the case study. This will make the case study more challenging for you: 
you might need to do some digging, aand revise the Working with Relational Databases in Python chapter in the previous resource.

Otherwise, the questions in the case study are exactly the same as with Tier 1. 

PART 1: PHPMyAdmin
You will complete questions 1-9 below in the PHPMyAdmin interface. 
Log in by pasting the following URL into your browser, and
using the following Username and Password:

URL: https://sql.springboard.com/
Username: student
Password: learn_sql@springboard

/*The data you need is in the "country_club" database. This database
contains 3 tables:
    i) the "Bookings" table,							this is mostly to join the other two
	
Field			Type		Null	Key	Default
bookid		smallint(6)	YES	NULL
facid		tinyint(4)	YES	NULL
memid		tinyint(4)	YES	NULL					id of member who has used it
starttime	varchar(19)	YES	NULL
slots		tinyint(4)	YES	NULL

    ii) the "Facilities" table		(information about each facility)
Field			Type		Null	Key	Default
facid			tinyint(4)
name			varchar(15)
membercost		decimal(2,1)
guestcost		decimal(3,1)
initialoutlay		mediumint(9)
monthlymaintenance	smallint(6)
expense_label		varchar(15)


    iii) the "Members" table.

memid			tinyint(4)
surname			varchar(17)
firstname		varchar(9)
address			varchar(39)
zipcode			mediumint(9)
telephone		varchar(14)
recommendedby		varchar(2)
joindate		varchar(19)

*/

In this case study, you'll be asked a series of questions. You can
solve them using the platform, but for the final deliverable,
paste the code for each solution into this script, and upload it
to your GitHub.

Before starting with the questions, feel free to take your time,
exploring the data, and getting acquainted with the 3 tables. */


/* QUESTIONS 
/* Q1: Some of the facilities charge a fee to members, but some do not.
Write a SQL query to produce a list of the names of the facilities that do. */

USE country_club

SELECT name FROM Facilities WHERE membercost > 0;



/* Q2: How many facilities do not charge a fee to members? */

SELECT count(*) FROM Facilities WHERE membercost = 0;



/* Q3: Write an SQL query to show a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost.
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */

SELECT facid, name, membercost, monthlymaintenance FROM Facilities WHERE membercost < (.2 * monthlymaintenance);



/* Q4: Write an SQL query to retrieve the details of facilities with ID 1 and 5.
Try writing the query without using the OR operator. */

SELECT * FROM Facilities WHERE facid IN (1, 5);



/* Q5: Produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100. Return the name and monthly maintenance of the facilities
in question. */

SELECT name, monthlymaintenance, CASE 
        WHEN monthlymaintenance > 100 THEN 'expensive'
        ELSE 'cheap'
    END AS Cost
FROM Facilities;



/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Try not to use the LIMIT clause for your solution. */

SELECT firstname, surname, joindate FROM Members
WHERE joindate = (SELECT max(joindate) FROM Members);



/* Q7: Produce a list of all members who have used a tennis court.
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */

SELECT DISTINCT f.name, CONCAT(m.firstname, " ", m.surname) AS member
FROM Members as m
JOIN Bookings as b
	ON b.memid = m.memid
JOIN Facilities as f
	ON f.facid = b.facid
WHERE f.name LIKE 'Tennis%'
ORDER BY member;


/* Q8: Produce a list of bookings on the day of 2012-09-14 which
will cost the member (or guest) more than $30. Remember that guests have
different costs to members (the listed costs are per half-hour 'slot'), and
the guest user's ID is always 0. Include in your output the name of the
facility, the name of the member formatted as a single column, and the cost.
Order by descending cost, and do not use any subqueries. */

SELECT 
    f.name AS facility_name, 
    CONCAT(m.firstname, ' ', m.surname) AS member_name,
    (CASE 
        WHEN b.memid = 0 THEN f.guestcost * b.slots
        ELSE f.membercost * b.slots
    END) AS total_cost
FROM Bookings b
JOIN Facilities f ON b.facid = f.facid
JOIN Members m ON b.memid = m.memid
WHERE b.starttime LIKE '2012-09-14%'
AND (CASE 
        WHEN b.memid = 0 THEN f.guestcost * b.slots 
        ELSE f.membercost * b.slots 
    END) > 30
ORDER BY total_cost DESC;



/* Q9: This time, produce the same result as in Q8, but using a subquery. */
SELECT 
    f.name AS facility_name, 
    CONCAT(m.firstname, ' ', m.surname) AS member_name,
    cost.total_cost
FROM Bookings b
JOIN Facilities f ON b.facid = f.facid
JOIN Members m ON b.memid = m.memid
JOIN (
    SELECT 
        bookid, 
        (CASE 
            WHEN b.memid = 0 THEN f.guestcost * b.slots  
            ELSE f.membercost * b.slots  
        END) AS total_cost
    FROM Bookings b
    JOIN Facilities f ON b.facid = f.facid
) cost ON b.bookid = cost.bookids
WHERE b.starttime LIKE '2012-09-14%'  
AND cost.total_cost > 30  -- Filtering bookings that exceed $30
ORDER BY cost.total_cost DESC;


/* PART 2: SQLite

Export the country club data from PHPMyAdmin, and connect to a local SQLite instance from Jupyter notebook 
for the following questions.  


QUESTIONS:
/* Q10: Produce a list of facilities with a total revenue less than 1000.
The output of facility name and total revenue, sorted by revenue. Remember
that there's a different cost for guests and members! */

SELECT 
    f.name AS facility_name,
    SUM(CASE 
            WHEN b.memid = 0 THEN f.guestcost * b.slots  
            ELSE f.membercost * b.slots  
        END) AS total_revenue
FROM Bookings b
JOIN Facilities f ON b.facid = f.facid
WHERE (b.memid <> 0)  -- Exclude guests from the calculation
GROUP BY f.name
HAVING total_revenue < 1000  ORDER BY total_revenue DESC;




/* Q11: Produce a report of members and who recommended them in alphabetic surname,firstname order */

SELECT 
    m1.surname, 
    m1.firstname, 
    m2.surname AS recommender_surname, 
    m2.firstname AS recommender_firstname
FROM Members m1
JOIN Members m2 ON m1.recommendedby = m2.memid
ORDER BY m1.surname, m1.firstname;




/* Q12: Find the facilities with their usage by member, but not guests */

SELECT 
    f.name AS facility_name,
    COUNT(b.bookid) AS usage_count
FROM Bookings b
JOIN Facilities f ON b.facid = f.facid
WHERE b.memid <> 0  -- Only include members
GROUP BY f.name;



/* Q13: Find the facilities usage by month, but not guests */

SELECT 
    f.name AS facility_name,
    DATE_FORMAT(b.starttime, '%Y-%m') AS month,  -- Extract the year and month
    COUNT(b.bookid) AS usage_count
FROM Bookings b
JOIN Facilities f ON b.facid = f.facid
WHERE b.memid <> 0  -- Only include members
GROUP BY f.name, month
ORDER BY month;

