create database sqlprojectpython;

use sqlprojectpython;

-- show tables
show tables;

-- Joining Tables:
-- 1. Retrieve the full name of artists along with the names of the museums where their works are displayed.

SELECT a.full_name AS Artist_Name, m.name as Museum_Name, w.name as Work_Name
FROM artist a
JOIN work w ON a.artist_id = w.artist_id
JOIN museum m ON w.museum_id = m.museum_id
ORDER BY a.full_name, m.name;

-- 2. Group By and Count:
-- How many works does each artist have in the database? Display the artist's full name along with the count of their works, ordered by the count in descending order.

SELECT a.full_name AS Artist_Name, COUNT(w.work_id) AS Work_Count
FROM artist a
LEFT JOIN work w ON a.artist_id = w.artist_id
GROUP BY a.full_name
ORDER BY work_count DESC;

-- 3. Order By and Limit:
-- List the top 5 museums with the highest number of works displayed in the database, along with their respective counts.
SELECT m.name as Museums, COUNT(w.work_id) AS Work_Count
FROM museum m
JOIN work w ON m.museum_id = w.museum_id
GROUP BY m.name
ORDER BY work_count DESC
LIMIT 5;

-- 4. Join, Order By, and Limit:
-- Display the names and styles of the works along with the corresponding museum names, ordered by the museum name in ascending order. Limit the results to 10.
SELECT w.name as Work, w.style, m.name as Museum
FROM work w
JOIN museum m ON w.museum_id = m.museum_id
ORDER BY m.name ASC
LIMIT 10;

-- 5.Join, Group By, and Sum:
-- Show the total sale price for each artist's works. Display the artist's full name along with the total sale price, ordered by the total sale price in descending order.
SELECT a.full_name AS Artist_Name, SUM(p.sale_price) AS Total_Sale_Price
FROM artist a
JOIN work w ON a.artist_id = w.artist_id
JOIN product_size p on p.work_id = w.work_id
GROUP BY a.full_name
ORDER BY Total_Sale_Price DESC;

-- 6. Join, Group By, and Having:
-- List artists who have more than 3 works in the database, along with the count of their works.
SELECT a.full_name AS Artist_Name, COUNT(w.work_id) AS Work_Count
FROM artist a
JOIN work w ON a.artist_id = w.artist_id
GROUP BY a.full_name
HAVING COUNT(w.work_id) > 3
ORDER BY work_count DESC;


-- 7. Join, Where, and Order By:
-- Retrieve the names of works and their corresponding artists' full names for works that have a sale price smaller than their regular price. 
SELECT DISTINCT w.name as Work_name, a.full_name AS Artist_name
FROM work w
INNER JOIN artist a ON w.artist_id = a.artist_id
INNER join product_size p on p.work_id = w.work_id
where p.sale_price < p.regular_price;


-- 8. Join, Group By, and Average:
-- Calculate the average height and width of the artworks in the database. Display the average height and width.
SELECT 
    AVG(height) AS Average_Height,
    AVG(width) AS Average_Width
FROM canvas_size;

-- Join, Group By, and Max:
-- 9 Find the maximum sale price among all the works in each museum. Display the museum name along with the maximum sale price.
SELECT m.name as Museum, MAX(p.sale_price) AS Max_Sale_Price
FROM work w
INNER JOIN museum m ON w.museum_id = m.museum_id
INNER JOIN product_size p ON p.work_id = w.work_id
GROUP BY m.name 
ORDER BY Max_Sale_Price desc;

-- Join, Group By, and Concatenate:
-- 10. Concatenate the first name and last name of artists along with their nationality, separated by a comma. Display the concatenated string along with the count of works by each artist, ordered by the count in descending order.
SELECT 
    CONCAT(a.first_name, ' ', a.last_name, ', ', a.nationality) AS Artist_Info,
    COUNT(w.work_id) AS Work_Count
FROM 
    artist a
LEFT JOIN 
    work w ON a.artist_id = w.artist_id
GROUP BY 
    a.artist_id, a.first_name, a.last_name, a.nationality
ORDER BY 
    Work_Count DESC;





