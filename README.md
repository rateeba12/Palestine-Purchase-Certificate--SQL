Purchase Certificate SQL Table, based on Palestine state standards,
The user uploads the data as the following format (OrderId, ParcelCode, PurchaseCertificateNumber, 
ParcelPrice, ShipDate).
### Functional Requirements :
1- Drop any row that’s doesn’t have the OrderId & PurchaseCertificateNumber.
2- The system handle the PurchaseCertificateNumber & OrderTotalPrice which equal to the total sum or all parcels’ prices we already have 
3- Input row without PracelPrice so it will equal to zero else
4- Input row without parcel code but have a price this should be the price for the order
