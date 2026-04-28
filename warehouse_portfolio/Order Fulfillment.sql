/*Order Fulfillment: Count 'Pending' vs 'Shipped' orders by shift.*/


SELECT 
    w.shift,
    COUNT(CASE WHEN o.status = 'Pending' THEN 1 END) AS pending_orders,
    COUNT(CASE WHEN o.status = 'Delivered' THEN 1 END) AS delivered_orders
FROM orders o
JOIN warehouse_staff w 
    ON o.staff_id = w.staff_id
GROUP BY w.shift;
