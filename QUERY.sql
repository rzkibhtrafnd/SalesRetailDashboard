-- Total Transaksi --
select count(Transaction_ID) as TotalTransaksi
into TotalTransaksi
from retail_sales_dataset
-- Total Quantity Product Sales --
select sum(Quantity) as TotalProductSales
into TotalQuantityProductSales
from retail_sales_dataset
-- Total Sales --
select sum(Total_Amount) as TotalSales
into TotalSales
from retail_sales_dataset
-- Total Transaction by Gender --
select Gender , count(Transaction_ID) AS TotalTransaksi
into TotalTransactionbyGender
from retail_sales_dataset
group by Gender
-- Total Product Category Sales by Gender
select Gender, Product_Category, sum(Quantity) TotalQuantitySales
into TotalproductCategorySalesbyGender
from retail_sales_dataset
group by Gender, Product_Category
-- Total Product Category Sales by Age
SELECT
CASE
WHEN Age <= 25 THEN 'Remaja'
WHEN Age <= 40 THEN 'Dewasa'
ELSE 'Lansia'
END AS AgeCategory,
Product_Category,
SUM(Quantity) AS TotalQuantitySales
into TotalProductCategorySalesbyAge
FROM retail_sales_dataset
GROUP BY
CASE
WHEN Age <= 25 THEN 'Remaja'
WHEN Age <= 40 THEN 'Dewasa'
ELSE 'Lansia'
END,
Product_Category
-- Total Quantity Sales vs Total Amount by Product Category --
select Product_Category, sum(Quantity) as TotalQuantitySales, sum(Total_Amount) as TotalAmount
into TotalQuantityvsTotalAmountByProduct
from retail_sales_dataset
group by Product_Category
-- Daily Sales vs Daily Order --
SELECT
FORMAT(Date, 'MM') AS Bulan,
FORMAT(Date, 'dd') AS Hari,
SUM(Quantity) AS TotalQuantitySales,
SUM(Total_Amount) AS TotalAmount
into DailySalesvsDailyOrder
FROM retail_sales_dataset
GROUP BY FORMAT(Date, 'MM'), FORMAT(Date, 'dd')
order by FORMAT(Date, 'MM') ,FORMAT(Date, 'dd')