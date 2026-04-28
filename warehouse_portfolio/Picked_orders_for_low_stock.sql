--Which staff picked orders for low-stock items?
/*The orders which have less stock_level compare to re-order point
are considered as Low-stock items.*/

SELECT 
    i.item_name,
    i.stock_level,
    i.reorder_point,
    w.name,
    o.status
FROM
    inventory i
LEFT JOIN
    orders o
ON 
i.sku = o.sku
LEFT JOIN
    warehouse_staff w
ON
o.staff_id = w.staff_id
    

WHERE i.reorder_point > i.stock_level        
AND
    o.status = 'Picking'
    

