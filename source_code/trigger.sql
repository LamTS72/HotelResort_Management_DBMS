-------------------TRIGGER----------------------
--------------------2.a-------------------------
--DROP FUNCTION IF EXISTS UpdateSumServiceBill;
CREATE OR REPLACE FUNCTION UpdateSumServiceBill()
RETURNS TRIGGER 
AS 
$updateServiceBill$
BEGIN
	UPDATE BillService
	SET total_price = ServicePackage.price - ServicePackage.price * (SELECT discount FROM BillService JOIN Customer
											 ON BillService.customer_id = Customer.customer_id
											 JOIN TypeForDiscount ON Customer.customer_type = TypeForDiscount.customer_type
											 WHERE BillService.customer_id = NEW.customer_id LIMIT 1)
	FROM ServicePackage
	WHERE 
		ServicePackage.package_name = BillService.package_name AND BillService.customer_id = NEW.customer_id;
	RETURN NULL;
END;
$updateServiceBill$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER UpdateTotalServiceBill
	AFTER INSERT 
	ON BillService
	FOR EACH ROW 
	EXECUTE FUNCTION UpdateSumServiceBill();
--FOR TESTING--	
--INSERT INTO BillService(customer_id,package_name,time_buying,time_starting)
--VALUES('KH000005','SweetHoliday','05-May-2022 08:10','06-May-2022');

--------------------2.b-------------------------
CREATE OR REPLACE FUNCTION UpdateSumPayment()
RETURNS TRIGGER
AS
$UpdateBillBooking$
BEGIN
	UPDATE BillBooking
	SET bill_price = BillBooking.bill_price - BillBooking.bill_price *(SELECT discount FROM RentingRoom 
								JOIN BillBooking ON RentingRoom.booking_id = BillBooking.booking_id 
								JOIN Customer ON Customer.customer_id = BillBooking.customer_id
								JOIN TypeForDiscount ON TypeForDiscount.customer_type = Customer.customer_type
								WHERE NEW.booking_id = BillBooking.booking_id LIMIT 1)
	FROM RentingRoom
	WHERE NEW.booking_id = BillBooking.booking_id;
	RETURN NULL;
END;
$UpdateBillBooking$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER UpdateSumPaymentBill
AFTER INSERT 
ON RentingRoom
FOR EACH ROW
EXECUTE FUNCTION UpdateSumPayment();
--------------------2.c-------------------------
CREATE OR REPLACE FUNCTION UpdatePointCustomer()
RETURNS TRIGGER
AS
$UpdatCustomer$
BEGIN
	UPDATE Customer
	SET points = Customer.points + (SELECT bill_price FROM BillBooking JOIN Customer ON
								  	BillBooking.customer_id = Customer.customer_id
								   WHERE NEW.bill_status = 1 AND NEW.booking_id = BillBooking.booking_id LIMIT 1)/1000
	FROM BillBooking
	WHERE NEW.customer_id = Customer.customer_id AND NEW.booking_id = BillBooking.booking_id AND NEW.bill_status = 1;
	RETURN NULL;
END;
$UpdatCustomer$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER UpdatePointClient
AFTER UPDATE 
ON BillBooking
FOR EACH ROW 
EXECUTE FUNCTION UpdatePointCustomer();
--------------------2.d-------------------------
CREATE OR REPLACE FUNCTION UpdateTypeCustomer()
RETURNS TRIGGER
AS
$UpdateCustomer$
BEGIN
	UPDATE Customer
	SET customer_type = (SELECT customer_type FROM TypeForDiscount WHERE NEW.points >= point_type
						ORDER BY customer_type DESC LIMIT 1)
	WHERE NEW.customer_id = Customer.customer_id;
	RETURN NULL;
END;
$UpdateCustomer$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER UpdateTypeClient
AFTER UPDATE
ON Customer
FOR EACH ROW
WHEN(NEW.points <> OLD.points)
EXECUTE FUNCTION UpdateTypeCustomer();
