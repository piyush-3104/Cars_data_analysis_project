-- Q1: Retrieve all columns for the 'Amaze' model.
SELECT * FROM cars_data WHERE Model = 'Amaze';

-- Q2: Retrieve the models with more than 400 seats, ordered by the number of seats in descending order.
SELECT Model, Seats FROM cars_data WHERE Seats > 5 ORDER BY Seats DESC;

-- Q3: Calculate the average number of seats for all cars.
SELECT AVG(Seats) AS Avg_Seats FROM cars_data;

-- Q4: Retrieve the models and makers for all cars with a '5' in the model name.
SELECT Model, Maker FROM cars_data WHERE Model LIKE '%5%';


-- Q5: Find the makers of cars with the smallest and largest number of cylinders.
SELECT Maker, No_of_Cylinders FROM cars_data WHERE No_of_Cylinders = (SELECT MIN(No_of_Cylinders) FROM cars_data)
UNION
SELECT Maker, No_of_Cylinders FROM cars_data WHERE No_of_Cylinders = (SELECT MAX(No_of_Cylinders) FROM cars_data);


-- Q6: Increase the number of seats for the 'Virtus' model to 6.
UPDATE cars_data SET Seats = 6 WHERE Model = 'Virtus';

-- Q7: Delete all records where the 'Emission Type' is 'BS VI'.
DELETE FROM cars_data WHERE Emission_Type = 'BS VI';


-- Q8: Count the number of cars for each transmission type, but only show types with more than 2 cars.
SELECT Transmission, COUNT(*) AS Car_Count FROM cars_data GROUP BY Transmission HAVING Car_Count > 2;


-- Q10: Classify cars based on their fuel efficiency as 'High', 'Medium', or 'Low'.
SELECT Model, Fuel_Efficiency,
    CASE
        WHEN Fuel_Efficiency > 20 THEN 'High'
        WHEN Fuel_Efficiency BETWEEN 15 AND 20 THEN 'Medium'
        ELSE 'Low'
    END AS Efficiency_Classification
FROM cars_data;

-- Q11: Find the average fuel efficiency for cars with more than 50 seats and less than 500 seats.
SELECT AVG(Fuel_Efficiency) AS Avg_Fuel_Efficiency
FROM cars_data
WHERE Seats > 4 AND Seats < 8;

-- Q12: For each car, find other cars with the same maker.
SELECT c1.Model, c1.Maker, c2.Model AS Other_Model
FROM cars_data c1
JOIN cars_data c2 ON c1.Maker = c2.Maker AND c1.Model <> c2.Model;

-- Q13: Rank cars based on their turning radius in ascending order.
SELECT Model, Turning_Radius, RANK() OVER (ORDER BY Turning_Radius) AS Rank_Turning_Radius
FROM cars_data;


-- Q14: Find the makers with more than 3 car models.
WITH MakerCarCount AS (
    SELECT Maker, COUNT(*) AS Car_Count
    FROM cars_data
    GROUP BY Maker
)
SELECT Maker
FROM MakerCarCount
WHERE Car_Count > 3;

-- Q15: Retrieve the top 3 cars with the highest fuel efficiency.
SELECT Model, Fuel_Efficiency
FROM cars_data
ORDER BY Fuel_Efficiency DESC
LIMIT 3;

