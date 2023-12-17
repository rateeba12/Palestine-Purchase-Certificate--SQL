CREATE TABLE Orders (
  OrderId VARCHAR(50) NOT NULL PRIMARY KEY,
  OrderTotalPrice FLOAT
);

CREATE TABLE PurchaseCertificate (
  OrderId VARCHAR(50) NOT NULL,
  ParcelCode VARCHAR(50),
  PurchaseCertificateNumber INT NOT NULL PRIMARY KEY,
  ParcelPrice FLOAT DEFAULT 0,
  ShipDate DATE,
  IsProcessed BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderId, OrderTotalPrice)
VALUES 
  ('2', 0),
  ('3', 0);

-- Insert data into PurchaseCertificate table
INSERT INTO PurchaseCertificate (OrderId, ParcelCode, PurchaseCertificateNumber, ParcelPrice, ShipDate)
VALUES 
  ('2', 'XYZ789', 1002, 75.0, '2023-02-15'),
  ('2', 'XYZ779', 1004, 75.0, '2023-02-15'),
  ('3', 'PQR456', 1003, 100.0, '2023-03-10');

-- Update Orders table with the total price
UPDATE Orders
SET OrderTotalPrice = (
    SELECT COALESCE(SUM(ParcelPrice), 0)
    FROM PurchaseCertificate
    WHERE Orders.OrderId = PurchaseCertificate.OrderId
)
WHERE Orders.OrderId IN (SELECT OrderId FROM PurchaseCertificate);

-- Delete rows where OrderId or PurchaseCertificateNumber is NULL
DELETE FROM PurchaseCertificate 
WHERE OrderId IS NULL OR PurchaseCertificateNumber IS NULL;

-- Update Orders with the total sum of all parcels' prices
UPDATE Orders 
SET OrderTotalPrice = 0
WHERE OrderTotalPrice >= (SELECT COALESCE(SUM(ParcelPrice), 0) FROM PurchaseCertificate);

-- Update Orders with the price for orders without a ParcelCode
UPDATE Orders 
SET OrderTotalPrice = OrderTotalPrice + PurchaseCertificate.ParcelPrice
FROM PurchaseCertificate
WHERE
    Orders.OrderId = PurchaseCertificate.OrderId
    AND PurchaseCertificate.ParcelCode IS NULL
    AND PurchaseCertificate.ParcelPrice IS NOT NULL;
