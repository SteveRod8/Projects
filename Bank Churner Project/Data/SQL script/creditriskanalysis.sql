create database credit;

CREATE TABLE credit.bank (
    Bank_Acc INT,
    Attrition_Flag TEXT,
    Customer_Age INT,
    Gender TEXT,
    Dependent_count INT,
    Education_Level TEXT,
    Marital_Status TEXT,
    Income_Category TEXT,
    Card_Category TEXT,
    Month_on_book INT,
    Total_Relationship_Count INT,
    Months_Inactive INT,
    Contact_Count INT,
    Credit_Limit INT,
    Total_Revolving_Bal INT,
    Avg_Open_To_Buy INT,
    Total_Amt_Chnge_Q4_Q1 INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Total_Ct_Chng_Q4_Q1 INT,
    Avg_Utilization_Ratio INT
) 

SELECT * FROM credit.bank LIMIT 5;

SELECT * FROM credit.bank WHERE Attrition_Flag = 'Attrited Customer';
 



SELECT AVG(Month_on_book) FROM credit.bank WHERE Attrition_Flag = 'Attrited Customer';
 
SELECT 
    Attrition_Flag AS 'Type of Customer',
    AVG(Customer_Age) AS 'Average Customer Age',
    AVG(Month_on_book) AS 'Average Months on book',
    AVG(Months_Inactive) AS 'Average months of account inactivity'
FROM
    credit.bank
GROUP BY Attrition_Flag
ORDER BY Attrition_Flag;
 
SELECT 
    COUNT(*) AS total,
    COUNT(IF(Marital_Status = 'Married', 1, NULL)) AS Married_count,
    COUNT(IF(Marital_Status = 'Single', 1, NULL)) AS Single_count,
    COUNT(IF(Marital_Status = 'Divorced', 1, NULL)) AS Divorced_Count,
    COUNT(IF(Marital_Status = 'Unknown', 1, NULL)) AS Unknown_Count
FROM
    credit.bank
WHERE
    Attrition_Flag = 'Attrited Customer';
        

SELECT
	Marital_Status,
    COUNT(*)
FROM
	credit.bank
WHERE
	Attrition_Flag = 'Existing Customer'
GROUP BY 
	Marital_Status;
        
        
SELECT 
    Education_Level,
    COUNT(*),
    100.0 * COUNT(*) / (SELECT COUNT(*) FROM credit.bank WHERE Attrition_Flag = 'Attrited Customer') AS 'Percent'
FROM
    credit.bank
WHERE
    Attrition_Flag = 'Attrited Customer'
GROUP BY Education_Level;
        
SELECT 
    Education_Level, 
    COUNT(*) AS '# of People',
	100.0 * COUNT(*) / (SELECT COUNT(*) FROM credit.bank WHERE Attrition_Flag = 'Existing Customer') AS 'Percent'
FROM
    credit.bank
WHERE
    Attrition_Flag = 'Existing Customer'
GROUP BY Education_Level;

SELECT Attrition_Flag, Dependent_count, COUNT(*),
	100.0 * COUNT(*) / (SELECT COUNT(*) FROM credit.bank WHERE Attrition_Flag = 'Attrited Customer') AS 'Attrired Percent',
	100.0 * COUNT(*) / (SELECT COUNT(*) FROM credit.bank WHERE Attrition_Flag = 'Existing Customer') AS 'Existing Percent'
FROM credit.bank group by Attrition_Flag, Dependent_Count order by Attrition_Flag, Dependent_Count;

