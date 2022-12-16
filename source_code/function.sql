------------------------FUNCTION---------------------
---2.1--
CREATE OR REPLACE FUNCTION AddDate(_days INT, _datetime DATE) RETURNS DATE AS
$$
	SELECT _datetime + _days;
$$ LANGUAGE sql IMMUTABLE;

CREATE OR REPLACE FUNCTION AddDateInt(_days INT, _datetime INT) RETURNS INT AS
$$
	SELECT _datetime + _days;
$$ LANGUAGE sql IMMUTABLE;

CREATE TYPE mytype AS(
		package_name TEXT,
		num_guests INT,
		time_starting DATE,
		time_expiring DATE,
		remaining_days INT
);
CREATE OR REPLACE FUNCTION PackageInfo(_customer_id TEXT)
	RETURNS mytype
AS
$$
DECLARE tableshow mytype;
DECLARE tempvar INT;
DECLARE tempvar1 DATE;
DECLARE tempvar2 DATE;
BEGIN
		tableshow.package_name = BillService.package_name FROM BillService WHERE BillService.customer_id = _customer_id;
		tableshow.num_guests = ServicePackage.num_guests FROM ServicePackage WHERE ServicePackage.package_name = tableshow.package_name;
		tableshow.time_starting = BillService.time_starting FROM BillService WHERE BillService.customer_id = _customer_id ;
		tableshow.time_expiring = (tableshow.time_starting+365);
		tempvar= ServicePackage.num_days FROM ServicePackage WHERE ServicePackage.package_name = tableshow.package_name;
		tempvar1 = BillBooking.time_checkout FROM BillBooking WHERE BillBooking.customer_id = _customer_id;
		tempvar2 = BillBooking.time_checkin FROM BillBooking WHERE BillBooking.customer_id = _customer_id;
		IF(AddDate(365,tableshow.time_starting) - CURRENT_DATE -
		   AddDateInt(tempvar ,- (tempvar1 - tempvar2))) > 0 THEN
		   tableshow.remaining_days = AddDateInt(tempvar, - (tempvar1 - tempvar2)) ;
		ELSE
			tableshow.remaining_days = AddDate(365,tableshow.time_starting) - CURRENT_DATE ;
		END IF;
		RETURN tableshow;
END;
$$ LANGUAGE 'plpgsql';
SELECT *FROM PackageInfo('KH000001');
--SELECT * FROM PackageInfo('KH000001');
--SELECT * FROM PackageInfo('KH000002');
--DROP FUNCTION IF EXISTS PackageInfo;

--2.2--
CREATE OR REPLACE FUNCTION TextDate(_year TEXT) RETURNS DATE AS
$$
	SELECT TO_DATE(_year::TEXT,'YYYY');
$$ LANGUAGE sql IMMUTABLE;

CREATE OR REPLACE FUNCTION MonthDate(_month TIMESTAMP) RETURNS TEXT AS
$$
	SELECT TO_CHAR(_month,'MM');
$$ LANGUAGE sql IMMUTABLE;

CREATE OR REPLACE FUNCTION StatisticGuests(_branch_id TEXT,_year TEXT)
	RETURNS TABLE(
		months TEXT,
		sum_num_guests BIGINT
	)
AS
$$
BEGIN
	RETURN QUERY 
	SELECT
		MonthDate(BillBooking.time_booking),
		COUNT(BillBooking.booking_id)
	FROM 
		RentingRoom JOIN PaymentBill ON RentingRoom.booking_id = PaymentBill.booking_id
		JOIN BillBooking ON PaymentBill.booking_id = BillBooking.booking_id
	WHERE
		RentingRoom.branch_id = _branch_id AND DATE_TRUNC('year',BillBooKing.time_booking) = TextDate(_year)
	GROUP BY MonthDate(BillBooking.time_booking);
END;
$$ LANGUAGE 'plpgsql';

--SELECT * FROM StatisticGuests('CN1','2022');
--SELECT * FROM StatisticGuests('CN2','2022');
--DROP FUNCTION IF EXISTS StatisticGuests;

--for application---
CREATE OR REPLACE FUNCTION BillBookingInfo(_customer_id TEXT)
	RETURNS TABLE(
		booking_id VARCHAR(16),
		time_booking TIMESTAMP,
		time_checkin DATE,
		time_checkout DATE,
		bill_status INT,
		bill_price INT
	)
AS
$$
BEGIN
	RETURN QUERY 
	SELECT
		BillBooking.booking_id,
		BillBooking.time_booking,
		BillBooking.time_checkin,
		BillBooking.time_checkout,
		BillBooking.bill_status,
		BillBooking.bill_price
	FROM
		BillBooking JOIN Customer ON BillBooking.customer_id = Customer.customer_id
	WHERE
		BillBooking.customer_id = _customer_id;
END;
$$ LANGUAGE 'plpgsql';

--SELECT * FROM BillBookingInfo('KH000001');
--for adding application---

