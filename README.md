# Purchase Certificate SQL Table

This project is designed to create a Purchase Certificate SQL Table based on Palestine state standards. Users can upload data in the following format: (OrderId, ParcelCode, PurchaseCertificateNumber, ParcelPrice, ShipDate).

### Functional Requirements:

1. Drop any row that doesn't contain both OrderId and PurchaseCertificateNumber.
  
2. The system should handle the PurchaseCertificateNumber and OrderTotalPrice, which equals the total sum of all parcels’ prices we already have.
   
3. If an input row lacks ParcelPrice, set it to zero; otherwise, maintain the given value.
   
4. If an input row lacks ParcelCode but has a price, assign that price to the entire order.

   ## Project Structure:

- `purchase_certificate.sql`: SQL file for creating the Purchase Certificate table.
- `test_cases.sql`: Test cases to ensure the functionality of the system.
- `ER_model.png`: Entity-Relationship model representing the database structure.
