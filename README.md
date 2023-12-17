Purchase Certificate SQL Table, based on Palestine state standards.
The user uploads the data in the following format: (OrderId, ParcelCode, PurchaseCertificateNumber, ParcelPrice, ShipDate).

### Functional Requirements:

1. Drop any row that doesn't have OrderId and PurchaseCertificateNumber.
  
2. The system should handle the PurchaseCertificateNumber and OrderTotalPrice, which equals the total sum of all parcels’ prices we already have.
   
3. If the input row lacks ParcelPrice, set it to zero; otherwise, maintain the given value.
   
4. If the input row lacks ParcelCode but has a price, the price should be assigned to the entire order.
