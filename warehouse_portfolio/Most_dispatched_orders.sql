/*Which shift handles the most dispatched orders?*/

SELECT w.shift,
    COUNT(CASE WHEN o.status = 'Dispatched' THEN 1 END) AS orders_count
FROM warehouse_staff w
LEFT JOIN
orders o
ON
    w.staff_id = o.staff_id
GROUP BY
    w.shift

        

