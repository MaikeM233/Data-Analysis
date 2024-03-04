--Video Game Sales Data Exploration
----------------------------------------------------------------------------------------------------------------

-- CREATE DATAFRAME WITH SAME STRUCTURE AS EXCEL FILE
CREATE TABLE VGSales (
    Name NVARCHAR(255) PRIMARY KEY,
    Platform NVARCHAR(50),
    Year INT,
    Genre NVARCHAR(50),
    Publisher NVARCHAR(255),
    NA_Sales FLOAT,
    EU_Sales FLOAT,
    JP_Sales FLOAT,
    Other_Sales FLOAT,
    Global_Sales FLOAT);

----------------------------------------------------------------------------------------------------------------

--I USED IMPORT WIZARD TO IMPORT THE DATA, BUT HERE'S A INSERT EXAMPLE IF DONE WITH CODE:
INSERT INTO VGSales (Name, Platform, Year, Genre, Publisher, NA_Sales, EU_Sales, JP_Sales, Other_Sales, Global_Sales) 
VALUES ('Wii Sports', 'Wii', 2006, 'Sports', 'Nintendo', 41.49, 29.02, 3.77, 8.46, 82.74);

----------------------------------------------------------------------------------------------------------------

-- FIND THE TOP 10 SELLING GAMES OF ALL TIME
SELECT TOP 10 Name, Year, Global_Sales
FROM VGSales
ORDER BY "Global_Sales" DESC;

----------------------------------------------------------------------------------------------------------------

--TOP SELLING GAME IS Wii Sports. FIND EACH REGION'S SALE AS PERCENTAGE (ROUNDED TO 2 DECIMAL)
SELECT Name, ROUND((NA_Sales/Global_Sales)*100, 2) as NA_Percentage,
		ROUND((EU_Sales/Global_Sales)*100, 2) as EU_Percentage,
		ROUND((JP_Sales/Global_Sales)*100, 2) as JP_Percentage,
		ROUND((Other_Sales/Global_Sales)*100, 2) as Other_Percentage
FROM VGSales
WHERE Name = 'Wii Sports';

----------------------------------------------------------------------------------------------------------------

--FIND THE TIME RANGE OF GAME RELEASE DATES
SELECT MIN(Year) AS Earliest_Year, 
		MAX(Year) AS Latest_Year
FROM VGSales
WHERE Year IS NOT NULL;

----------------------------------------------------------------------------------------------------------------

--FIND COMPANIES THAT REALEASED MOST GAMES
SELECT TOP 10 Publisher, COUNT(Name) as Releases
FROM VGSales
GROUP BY Publisher
ORDER BY Releases DESC;

----------------------------------------------------------------------------------------------------------------

--ELECTRONIC ARTS (EA) RELEASED MOST GAMES, FIND ITS TOP SELLER
SELECT TOP 5 Name, Year, Global_Sales
FROM VGSales
WHERE Publisher = 'Electronic Arts'
ORDER BY Global_Sales DESC;

----------------------------------------------------------------------------------------------------------------

--NUMBER OF GAME RELEASED FOR EA EACH YEAR
SELECT Year, COUNT(Name) as Releases
FROM VGSales
WHERE Publisher = 'Electronic Arts' AND Year IS NOT NULL
GROUP BY Year
ORDER BY Year ASC;

----------------------------------------------------------------------------------------------------------------

--WHAT GENRE DOES EA MAKE THE MOST? (SPORTS, OF COURSE)
SELECT Genre, COUNT(Name) as Amount
FROM VGSales
WHERE Publisher = 'Electronic Arts' AND Genre IS NOT NULL
GROUP BY Genre
ORDER BY Amount DESC;

----------------------------------------------------------------------------------------------------------------
