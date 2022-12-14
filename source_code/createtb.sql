--1--
CREATE TABLE Branch(
	number_id SERIAL NOT NULL,
	branch_id TEXT GENERATED ALWAYS AS ('CN' || number_id::text) STORED,
	province TEXT,
	address TEXT,
	phone_num VARCHAR(12),
	email TEXT,
	PRIMARY KEY(branch_id)
);
--2--
CREATE TABLE BranchPicture(
	branch_id TEXT ,
	link_image TEXT,
	PRIMARY KEY(branch_id,link_image),
	FOREIGN KEY(branch_id) REFERENCES Branch(branch_id)
);
--3--
CREATE TABLE Zone(
	branch_id TEXT,
	name_zone TEXT,
	PRIMARY KEY(branch_id, name_zone),
	FOREIGN KEY(branch_id) REFERENCES Branch(branch_id)
);
--4--
CREATE TABLE RoomType(
	roomtype_id SERIAL NOT NULL,
	room_name TEXT,
	area_square TEXT,
	num_guests INT NOT NULL CHECK(num_guests > 0 AND num_guests <11),
	description TEXT,
	PRIMARY KEY(roomtype_id)
);
--5--
CREATE TABLE BedInfo(
	roomtype_id SERIAL,
	bed_size NUMERIC(2,1),
	quantity INT NOT NULL DEFAULT 1 CHECK(quantity > 0 AND quantity < 11),
	PRIMARY KEY(roomtype_id,bed_size),
	FOREIGN KEY(roomtype_id) REFERENCES RoomType(roomtype_id)
);
--6--
CREATE TABLE BranchHavRoomType(
	roomtype_id SERIAL,
	branch_id TEXT,
	price INT NOT NULL,
	PRIMARY KEY(roomtype_id, branch_id),
	FOREIGN KEY(roomtype_id) REFERENCES RoomType(roomtype_id),
	FOREIGN KEY(branch_id) REFERENCES Branch(branch_id)
);
--7--
CREATE TABLE Room(
	branch_id TEXT,
	num_room VARCHAR(3),
	roomtype_id SERIAL,
	name_zone TEXT,
	PRIMARY KEY(branch_id,num_room),
	FOREIGN KEY (branch_id) REFERENCES Branch(branch_id),
	FOREIGN KEY(branch_id,name_zone) REFERENCES Zone(branch_id,name_zone),
	FOREIGN KEY(roomtype_id) REFERENCES RoomType(roomtype_id)
);
--8--
CREATE TABLE SpicimenType(
	spicimen_id VARCHAR(6) CHECK(spicimen_id ~ 'VT[0-9]{4}'),
	spicimen_name TEXT,
	PRIMARY KEY(spicimen_id)
);
--9--
CREATE TABLE SpicTypeInRoomType(
	spicimen_id VARCHAR(6),
	roomtype_id SERIAL,
	quantity_spic INT NOT NULL DEFAULT 1 CHECK(quantity_spic > 0 AND quantity_spic < 21),
	PRIMARY KEY(spicimen_id,roomtype_id),
	FOREIGN KEY(spicimen_id) REFERENCES SpicimenType(spicimen_id),
	FOREIGN KEY(roomtype_id) REFERENCES RoomType(roomtype_id)
);
--10--
CREATE TABLE Material(
	branch_id TEXT,
	spicimen_id VARCHAR(6),
	num_material INT CHECK(num_material > 0),
	status TEXT,
	num_room VARCHAR(3),
	PRIMARY KEY(branch_id,spicimen_id,num_material),
	FOREIGN KEY(branch_id) REFERENCES Branch(branch_id),
	FOREIGN KEY(spicimen_id) REFERENCES SpicimenType(spicimen_id),
	FOREIGN KEY(branch_id,num_room) REFERENCES Room(branch_id,num_room)
);
--11--
CREATE TABLE Provider(
	provider_id VARCHAR(7) CHECK(provider_id ~ 'NCC[0-9]{4}'),
	provider_name TEXT,
	provider_email TEXT,
	provider_address TEXT,
	PRIMARY KEY(provider_id)
);
--12--
CREATE TABLE ProviderMaterial(
	provider_id VARCHAR(7),
	spicimen_id VARCHAR(6),
	branch_id TEXT,
	PRIMARY KEY(spicimen_id,branch_id),
	FOREIGN KEY(provider_id) REFERENCES Provider(provider_id),
	FOREIGN KEY(spicimen_id) REFERENCES SpicimenType(spicimen_id),
	FOREIGN KEY(branch_id) REFERENCES Branch(branch_id)
);
--13--
CREATE TABLE Customer(
	customer_id VARCHAR(8) CHECK(customer_id ~ 'KH[0-9]{6}'),
	cccd_cmnd VARCHAR(12) NOT NULL UNIQUE,
	customer_name TEXT,
	customer_phone TEXT UNIQUE,
	customer_email TEXT UNIQUE,
	username TEXT UNIQUE,
	cus_password TEXT,
	points INT NOT NULL DEFAULT 0 CHECK(points >= 0),
	customer_type INT NOT NULL DEFAULT 1 CHECK(customer_type > 0 AND customer_type < 5),
	PRIMARY KEY(customer_id)
);
--14--
CREATE TABLE ServicePackage(
	package_name TEXT,
	num_days INT NOT NULL CHECK(num_days > 0 AND num_days < 101),
	num_guests INT NOT NULL CHECK(num_guests > 0 AND num_guests < 11),
	price INT NOT NULL,
	PRIMARY KEY(package_name)
);
--15--
CREATE TABLE BillService(
	customer_id VARCHAR(8),
	package_name TEXT,
	time_buying TIMESTAMP,
	time_starting DATE CHECK(time_starting > time_buying),
	total_price INT ,
	PRIMARY KEY(customer_id,package_name,time_buying),
	FOREIGN KEY(customer_id) REFERENCES Customer(customer_id),
	FOREIGN KEY(package_name) REFERENCES ServicePackage(package_name)
);
CREATE TABLE TypeForDiscount(
	customer_type INT,
	discount REAL,
	point_type INT,
	PRIMARY KEY(customer_type)
);
--16--
CREATE OR REPLACE FUNCTION Generate_Room_Booking_ID(timestamp,INT) RETURNS text AS
$$
	SELECT (to_char($1, 'DD') || to_char($1, 'MM') || to_char($1, 'YYYY'))||LPAD($2::text, 6, '0');
$$ LANGUAGE sql IMMUTABLE;
CREATE TABLE BillBooking(
	book_id SERIAL NOT NULL,
	booking_id VARCHAR(16) GENERATED ALWAYS AS ('DP'|| Generate_Room_Booking_ID(time_booking,book_id)) STORED,
	time_booking TIMESTAMP,
	time_checkin DATE CHECK(time_checkin > time_booking),
	time_checkout DATE CHECK(time_checkout > time_checkin),
	bill_status INT CHECK(bill_status >= 0 AND bill_status <= 3),
	bill_price INT NOT NULL DEFAULT 0,
	customer_id VARCHAR(8),
	package_name TEXT,
	PRIMARY KEY(booking_id),
	FOREIGN KEY(customer_id) REFERENCES Customer(customer_id),
	FOREIGN KEY(package_name) REFERENCES ServicePackage(package_name)
);
--17--
CREATE TABLE RentingRoom(
	booking_id VARCHAR(16),
	branch_id TEXT,
	num_room VARCHAR(3),
	PRIMARY KEY(booking_id,branch_id,num_room),
	FOREIGN KEY(booking_id) REFERENCES BillBooking(booking_id),
	FOREIGN KEY(branch_id,num_room) REFERENCES Room(branch_id,num_room)
);
--18--
CREATE TABLE PaymentBill(
	bill_num SERIAL NOT NULL,
	bill_id VARCHAR(16) GENERATED ALWAYS AS ('HD'|| Generate_Room_Booking_ID(timer_checkout,bill_num)) STORED,
	timer_checkin TIMESTAMP,
	timer_checkout TIMESTAMP,
	booking_id VARCHAR(16),
	PRIMARY KEY(bill_id),
	FOREIGN KEY(booking_id) REFERENCES BillBooking(booking_id)
);
--19--
CREATE TABLE Company(
	company_id VARCHAR(6) CHECK(company_id ~ 'DN[0-9]{4}'),
	company_name TEXT,
	PRIMARY KEY(company_id)
);
--20--
CREATE TABLE Service(
	service_id VARCHAR(6) CHECK(service_id ~ 'DV[RSCMB][0-9]{3}'),
	service_type VARCHAR(1) CHECK(SUBSTRING(service_id,3,1) = service_type),
	num_guests INT,
	stype TEXT,
	company_id VARCHAR(6),
	PRIMARY KEY(service_id),
	FOREIGN KEY(company_id) REFERENCES Company(company_id)
);
--21--
CREATE TABLE ServiceSpa(
	service_id VARCHAR(6) CHECK(SUBSTRING(service_id,1,3) = 'DVS'),
	spa_type TEXT,
	PRIMARY KEY(service_id,spa_type),
	FOREIGN KEY(service_id) REFERENCES Service(service_id)
);
--22--
CREATE TABLE TypeSouvenir(
	service_id VARCHAR(6) CHECK(SUBSTRING(service_id,1,3) = 'DVM'),
	souv_type TEXT,
	PRIMARY KEY(service_id,souv_type),
	FOREIGN KEY(service_id) REFERENCES Service(service_id)
);
--23--
CREATE TABLE BrandSouvenir(
	service_id VARCHAR(6) CHECK(SUBSTRING(service_id,1,3) = 'DVM'),
	souv_brand TEXT,
	PRIMARY KEY(service_id,souv_brand),
	FOREIGN KEY(service_id) REFERENCES Service(service_id)
);
--24-- 
CREATE TABLE AreaPlace(
	branch_id TEXT,
	stt_num INT NOT NULL DEFAULT 1 CHECK( stt_num >= 1 AND stt_num <= 50),
	area_length TEXT,
	area_width TEXT,
	area_price INT NOT NULL,
	description TEXT,
	service_id VARCHAR(6),
	name_shop TEXT,
	logo_shop TEXT,
	PRIMARY KEY(branch_id,stt_num),
	FOREIGN KEY(branch_id) REFERENCES Branch(branch_id),
	FOREIGN KEY(service_id) REFERENCES Service(service_id)
);
--25--
CREATE TABLE ShopPicture(
	branch_id TEXT,
	stt_num INT,
	picture TEXT,
	PRIMARY KEY(branch_id,stt_num,picture),
	FOREIGN KEY(branch_id,stt_num) REFERENCES AreaPlace(branch_id,stt_num)
);
--26--
CREATE TABLE TimelineShop(
	branch_id TEXT,
	stt_num INT,
	time_starting TIME,
	time_closing TIME,
	PRIMARY KEY(branch_id,stt_num,time_starting),
	FOREIGN KEY(branch_id,stt_num) REFERENCES AreaPlace(branch_id,stt_num)
);
---speciallogin--- 
CREATE TABLE login_users(
	username CHAR VARYING(100) NOT NULL PRIMARY KEY, 
	password CHAR VARYING(100) 
); 

CREATE OR REPLACE FUNCTION check_userlogin(_username CHAR VARYING(100), _password CHAR VARYING(100))
RETURNS INT AS
$$
BEGIN
	IF(SELECT COUNT(*) FROM login_users WHERE username = _username AND password = _password) > 0 THEN
		RETURN 1;
	ELSE
		RETURN 0;
	END IF;

END;
$$ LANGUAGE plpgsql;

--DROP FUNCTION IF EXISTS user_login;