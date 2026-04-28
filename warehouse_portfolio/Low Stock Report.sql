/*Low Stock Report: Find items where stock_level is below reorder_point.*/

SELECT sku,
    stock_level,
    reorder_point
FROM    
    inventory
WHERE stock_level < reorder_point
