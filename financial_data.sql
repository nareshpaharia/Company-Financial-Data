create database financial_data;

select count(*)
from financial_data.financials;

select * 
from financial_data.financials;

--  Financial Performance Analysis
-- Calculate total gross sales, discounts, and profit for the entire dataset
SELECT
    SUM(`Gross Sales`) AS Total_Gross_Sales,
    SUM(Discounts) AS Total_Discounts,
    SUM(Profit) AS Total_Profit
FROM
    financial_data.financials;

-- Segment and Country Analysis:
-- Calculate total gross sales, discounts, and profit by segment and country
SELECT 
    Segment,
    Country,
    SUM(`Gross Sales`) AS Total_Gross_Sales,
    SUM(Discounts) AS Total_Discounts,
    SUM(Profit) AS Total_Profit
FROM
    financial_data.financials
GROUP BY Segment , Country;

-- Product Analysis:
-- Calculate total gross sales, discounts, and profit by product
SELECT
    Product,
    SUM(`Gross Sales`) AS Total_Gross_Sales,
    SUM(Discounts) AS Total_Discounts,
    SUM(Profit) AS Total_Profit
FROM
    financial_data.financials
GROUP BY
    Product;

-- Discount Analysis:
-- Calculate average discount and its impact on profit
SELECT
    `Discount Band`,
    AVG(Discounts) AS Average_Discount,
    SUM(Profit) AS Total_Profit
FROM
    financial_data.financials
GROUP BY
     `Discount Band`;
    
    
select * 
from financial_data.financials;

--  Cost Structure Analysis:
-- Calculate total manufacturing cost, selling expenses
SELECT
    SUM(`Manufacturing Price` * `Units Sold`) AS Total_Manufacturing_Cost,
    SUM(`Sale Price` * `Units Sold`) AS Total_Selling_Expenses
FROM
    financial_data.financials;

-- Time Series Analysis:
-- Calculate total gross sales, discounts, and profit over time
SELECT
    Year,
    `Month Number`,
    SUM(`Gross Sales`) AS Total_Gross_Sales,
    SUM(Discounts) AS Total_Discounts,
    SUM(Profit) AS Total_Profit
FROM
     financial_data.financials
GROUP BY Year, `Month Number`
ORDER BY Year, `Month Number`;

 -- Financial Health Assessment:
 -- Calculate liquidity, solvency, and profitability ratios
SELECT
    (SUM(`Gross Sales`) - SUM(Discounts)) / SUM(Discounts) AS Gross_Margin,
    SUM(Profit) / SUM(`Gross Sales`) AS Net_Profit_Margin
FROM
    financial_data.financials;
    
-- Scenario Analysis and Forecasting 
-- Calculate moving average of gross sales for forecasting
SELECT
    Year,
    `Month Number`,
    round(AVG(`Gross Sales`) OVER (ORDER BY Year, `Month Number` ROWS BETWEEN 3 PRECEDING AND CURRENT ROW),0) AS Moving_Average_Gross_Sales
FROM
    financial_data.financials
ORDER BY
    Year,
    `Month Number`;
    
-- Profitability Analysis

SELECT
    Product,
    SUM(Profit) AS Total_Profit,
    SUM(Sales) AS Total_Sales,
    (SUM(Profit) / SUM(Sales)) * 100 AS Profit_Margin_Percentage
FROM
    financial_data.financials
GROUP BY
    Product
ORDER BY
    Total_Profit DESC;
    
   



