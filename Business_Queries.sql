-- ==================================
-- Query 1: Total Revenue by Country
-- ==================================

SELECT Country,
       ROUND(SUM(Revenue), 2) AS Total_Revenue,
       COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM cleaned_retail
GROUP BY Country
ORDER BY Total_Revenue DESC;


-- =====================================
-- Query 2: Top 10 Customers by Revenue
-- =====================================

SELECT TOP 10
       CAST(CustomerID AS INT) AS CustomerID,
       ROUND(SUM(Revenue), 2) AS Total_Revenue,
       COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM cleaned_retail
GROUP BY CustomerID
ORDER BY Total_Revenue DESC;


-- ===================================
-- Query 3: Top 10 Products by Revenue
-- ===================================

SELECT TOP 10 Description ,
       ROUND(SUM(Revenue), 2) AS Total_Revenue,
       COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM cleaned_retail
GROUP BY Description
ORDER BY Total_Revenue DESC;


-- ==============================
-- Query 4: Monthly Revenue Trend
-- ==============================

SELECT 
    YEAR(InvoiceDate) AS Year,
    MONTH(InvoiceDate) AS Month,
    ROUND(SUM(Revenue), 2) AS Monthly_Revenue,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM cleaned_retail
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY Year, Month;


-- ================================
-- Query 5: Repeat vs One-Time Customers
-- ================================

SELECT 
    CASE WHEN Total_Orders = 1 THEN 'One-Time Customer'
         ELSE 'Repeat Customer'
    END AS Customer_Type,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Total_Revenue), 2) AS Avg_Revenue_Per_Customer
FROM (
    SELECT CustomerID,
           COUNT(DISTINCT InvoiceNo) AS Total_Orders,
           SUM(Revenue) AS Total_Revenue
    FROM cleaned_retail
    GROUP BY CustomerID
) AS Customer_Summary
GROUP BY 
    CASE WHEN Total_Orders = 1 THEN 'One-Time Customer'
         ELSE 'Repeat Customer'
    END;
        

-- =======================================
-- Query 6: Average Order Value by Country
-- =======================================

SELECT Country,
       ROUND(SUM(Revenue) / COUNT(DISTINCT InvoiceNo), 2) AS Avg_Order_Value,
       COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM cleaned_retail
GROUP BY Country
ORDER BY Avg_Order_Value DESC;
