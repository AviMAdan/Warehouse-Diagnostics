/*Inventory Value: Calculate total value of stock in each category.*/

SELECT category,
    SUM(stock_level) AS stock_total_value
    FROM
        inventory
GROUP BY
    category        

