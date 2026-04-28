-- Database Setup Script for Warehouse Logistics Analysis

-- 1. Create Tables
CREATE TABLE IF NOT EXISTS warehouse_staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(100),
    shift VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS inventory (
    sku VARCHAR(50) PRIMARY KEY,
    item_name VARCHAR(100),
    category VARCHAR(50),
    stock_level INT,
    reorder_point INT
);

CREATE TABLE IF NOT EXISTS orders (
    order_id SERIAL PRIMARY KEY,
    sku VARCHAR(50) REFERENCES inventory(sku),
    quantity INT,
    order_date DATE,
    status VARCHAR(50), -- 'Pending', 'Picking', 'Shipped', 'Delivered'
    staff_id INT REFERENCES warehouse_staff(staff_id)
);

-- 2. Insert Sample Data
-- Staff
INSERT INTO warehouse_staff (staff_id, name, shift) VALUES
(1, 'Rahul Sharma', 'Morning'),
(2, 'Priya Patil', 'Afternoon'),
(3, 'Amit Khan', 'Night');

-- Inventory
INSERT INTO inventory (sku, item_name, category, stock_level, reorder_point) VALUES
('SKU-001', 'Cardboard Boxes', 'Packaging', 500, 100),
('SKU-002', 'Bubble Wrap', 'Packaging', 50, 100), -- Low Stock
('SKU-003', 'Packing Tape', 'Consumables', 200, 50),
('SKU-004', 'Pallets', 'Storage', 10, 20); -- Low Stock

-- Orders
INSERT INTO orders (sku, quantity, order_date, status, staff_id) VALUES
('SKU-001', 10, '2026-04-20', 'Shipped', 1),
('SKU-002', 5, '2026-04-21', 'Picking', 2),
('SKU-004', 2, '2026-04-22', 'Picking', 3),
('SKU-003', 20, '2026-04-22', 'Pending', 1);