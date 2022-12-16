---------------------INSERT---------------------
---------------------1---------------------
INSERT INTO Branch(province, address, phone_num, email) values ('Tien Giang', 'My Tho', '0321133236', 'sdasda@gmail.com');
INSERT INTO Branch(province, address, phone_num, email) values ('TP.HCM', 'Thu Duc', '0321133236', 'sdasda@gmail.com');
INSERT INTO Branch(province, address, phone_num, email) values ('Long An', 'Duc Hoa', '03215334', 'skjkjlda@gmail.com');
INSERT INTO Branch(province, address, phone_num, email) values ('Ben Tre', 'Mo Cay', '012102467', 'dgfga@gmail.com');
INSERT INTO Branch(province, address, phone_num, email) values ('Vung Tau', 'Long Hai', '012102467', 'vtg@gmail.com');
---------------------2---------------------
INSERT INTO BranchPicture(branch_id,link_image) VALUES('CN1','www.google.com');
INSERT INTO BranchPicture(branch_id,link_image) VALUES('CN2','www.facebook.com');
INSERT INTO BranchPicture(branch_id,link_image) VALUES('CN3','www.leetcode.com');
INSERT INTO BranchPicture(branch_id,link_image) VALUES('CN4','www.w3school.com');
INSERT INTO BranchPicture(branch_id,link_image) VALUES('CN5','www.youtube.com');
---------------------3---------------------
INSERT INTO Zone(branch_id,name_zone) VALUES('CN1','DIAMOND');
INSERT INTO Zone(branch_id,name_zone) VALUES('CN2','BEACH');
INSERT INTO Zone(branch_id,name_zone) VALUES('CN3','SAHARA');
INSERT INTO Zone(branch_id,name_zone) VALUES('CN4','EARTH');
INSERT INTO Zone(branch_id,name_zone) VALUES('CN5','SEA');
---------------------4---------------------
INSERT INTO RoomType(room_name,area_square,num_guests) VALUES('bigcity','18 m2','4');
INSERT INTO RoomType(room_name,area_square,num_guests) VALUES('bigarea','14 m2','1');
INSERT INTO RoomType(room_name,area_square,num_guests) VALUES('bigroom','50 m2','10');
INSERT INTO RoomType(room_name,area_square,num_guests) VALUES('bigbang','15 m2','2');
INSERT INTO RoomType(room_name,area_square,num_guests) VALUES('smallroom','8 m2','1');
---------------------5---------------------
INSERT INTO BedInfo(roomtype_id,bed_size, quantity) VALUES('1',1.0,'4');
INSERT INTO BedInfo(roomtype_id,bed_size, quantity) VALUES('2',0.9,'2');
INSERT INTO BedInfo(roomtype_id,bed_size, quantity) VALUES('3',2.0,'4');
INSERT INTO BedInfo(roomtype_id,bed_size, quantity) VALUES('4',1.8,'2');
INSERT INTO BedInfo(roomtype_id,bed_size, quantity) VALUES('5',1.8,'2');
---------------------6---------------------
INSERT INTO BranchHavRoomType(roomtype_id, branch_id,price) VALUES('1','CN1','2000');
INSERT INTO BranchHavRoomType(roomtype_id, branch_id,price) VALUES('2','CN2','1000');
INSERT INTO BranchHavRoomType(roomtype_id, branch_id,price) VALUES('4','CN4','1500');
INSERT INTO BranchHavRoomType(roomtype_id, branch_id,price) VALUES('3','CN3','500');
INSERT INTO BranchHavRoomType(roomtype_id, branch_id,price) VALUES('5','CN5','1200');
---------------------7---------------------
INSERT INTO Room(branch_id,num_room,roomtype_id,name_zone) VALUES('CN1','103','1','DIAMOND');
INSERT INTO Room(branch_id,num_room,roomtype_id,name_zone) VALUES('CN1','203','1','DIAMOND');
INSERT INTO Room(branch_id,num_room,roomtype_id,name_zone) VALUES('CN1','303','1','DIAMOND');
INSERT INTO Room(branch_id,num_room,roomtype_id,name_zone) VALUES('CN1','403','1','DIAMOND');
INSERT INTO Room(branch_id,num_room,roomtype_id,name_zone) VALUES('CN1','603','1','DIAMOND');
INSERT INTO Room(branch_id,num_room,roomtype_id,name_zone) VALUES('CN1','703','1','DIAMOND');
INSERT INTO Room(branch_id,num_room,roomtype_id,name_zone) VALUES('CN1','503','1','DIAMOND');
INSERT INTO Room(branch_id,num_room,roomtype_id,name_zone) VALUES('CN2','303','3','BEACH');
INSERT INTO Room(branch_id,num_room,roomtype_id,name_zone) VALUES('CN3','203','4','SAHARA');
INSERT INTO Room(branch_id,num_room,roomtype_id,name_zone) VALUES('CN4','403','2','EARTH');
INSERT INTO Room(branch_id,num_room,roomtype_id,name_zone) VALUES('CN5','503','2','SEA');
---------------------8---------------------
INSERT INTO SpicimenType(spicimen_id,spicimen_name) VALUES('VT0001','chair');
INSERT INTO SpicimenType(spicimen_id,spicimen_name) VALUES('VT0003','table');
INSERT INTO SpicimenType(spicimen_id,spicimen_name) VALUES('VT0002','mirror');
INSERT INTO SpicimenType(spicimen_id,spicimen_name) VALUES('VT0004','cups');
INSERT INTO SpicimenType(spicimen_id,spicimen_name) VALUES('VT0005','tivi');
---------------------9---------------------
INSERT INTO SpicTypeInRoomType(spicimen_id,roomtype_id,quantity_spic) VALUES('VT0001','2','2');
INSERT INTO SpicTypeInRoomType(spicimen_id,roomtype_id,quantity_spic) VALUES('VT0002','3','1');
INSERT INTO SpicTypeInRoomType(spicimen_id,roomtype_id,quantity_spic) VALUES('VT0003','1','4');
INSERT INTO SpicTypeInRoomType(spicimen_id,roomtype_id,quantity_spic) VALUES('VT0004','4','2');
INSERT INTO SpicTypeInRoomType(spicimen_id,roomtype_id,quantity_spic) VALUES('VT0005','4','1');
---------------------10---------------------
INSERT INTO Material(branch_id,spicimen_id,num_material,status,num_room) VALUES('CN1','VT0002','1','new','103');
INSERT INTO Material(branch_id,spicimen_id,num_material,status,num_room) VALUES('CN2','VT0001','2','new','303');
INSERT INTO Material(branch_id,spicimen_id,num_material,status,num_room) VALUES('CN3','VT0003','4','old','203');
INSERT INTO Material(branch_id,spicimen_id,num_material,status,num_room) VALUES('CN4','VT0004','1','new','403');
INSERT INTO Material(branch_id,spicimen_id,num_material,status,num_room) VALUES('CN5','VT0005','1','new','503');
---------------------11---------------------
INSERT INTO Provider(provider_id,provider_name,provider_email,provider_address) VALUES('NCC0001','Panasonic','panasonis@gmail.com','Japan');
INSERT INTO Provider(provider_id,provider_name,provider_email,provider_address) VALUES('NCC0002','Samsung','samsung@gmail.com','Korea');
INSERT INTO Provider(provider_id,provider_name,provider_email,provider_address) VALUES('NCC0003','Sony','sony@gmail.com','Japan');
INSERT INTO Provider(provider_id,provider_name,provider_email,provider_address) VALUES('NCC0004','Sharp','shap@gmail.com','Japan');
---------------------12---------------------
INSERT INTO ProviderMaterial(provider_id,spicimen_id,branch_id) VALUES('NCC0001','VT0002','CN2');
INSERT INTO ProviderMaterial(provider_id,spicimen_id,branch_id) VALUES('NCC0002','VT0001','CN1');
INSERT INTO ProviderMaterial(provider_id,spicimen_id,branch_id) VALUES('NCC0003','VT0003','CN3');
INSERT INTO ProviderMaterial(provider_id,spicimen_id,branch_id) VALUES('NCC0004','VT0004','CN4');
INSERT INTO ProviderMaterial(provider_id,spicimen_id,branch_id) VALUES('NCC0004','VT0005','CN5');
---------------------13---------------------
INSERT INTO Customer(customer_id,cccd_cmnd,customer_name,customer_phone, customer_email,username,cus_password,points)
VALUES('KH000001','029301230123','Maria Olala','839483943849','oalal@gmail.com','olala231','122345','7');
INSERT INTO Customer(customer_id,cccd_cmnd,customer_name,customer_phone, customer_email,username,cus_password,points)
VALUES('KH000002','024534601293','Alo Hihi','354345453432','hihi@gmail.com','hihi1','32325','10');
INSERT INTO Customer(customer_id,cccd_cmnd,customer_name,customer_phone, customer_email,username,cus_password,points)
VALUES('KH000003','078673012933','Bu Haha','565768943849','haha@gmail.com','ohaha2','15675','13');
INSERT INTO Customer(customer_id,cccd_cmnd,customer_name,customer_phone, customer_email,username,cus_password,points)
VALUES('KH000005','076453301293','Alex Sqel','433463464366','ssdqel@gmail.com','ssdql21','75445','50');
INSERT INTO Customer(customer_id,cccd_cmnd,customer_name,customer_phone, customer_email,username,cus_password,points)
VALUES('KH000004','023455432688','Mario Viple','123455678901','vipl@gmail.com','vip231','0987','110');
INSERT INTO Customer(customer_id,cccd_cmnd,customer_name,customer_phone, customer_email,username,cus_password,points)
VALUES('KH000006','342434534533','Runan Tyx','453453453533','runanl@gmail.com','runan1','14212','5');
INSERT INTO Customer(customer_id,cccd_cmnd,customer_name,customer_phone, customer_email,username,cus_password,points)
VALUES('KH000007','152325234123','Panamaex R','124242423454','rl@gmail.com','raaa1','24323','2');
INSERT INTO Customer(customer_id,cccd_cmnd,customer_name,customer_phone, customer_email,username,cus_password,points)
VALUES('KH000008','134234534533','Nuno Alex','421321343454','nunol@gmail.com','nuno31','7412','0');
INSERT INTO Customer(customer_id,cccd_cmnd,customer_name,customer_phone, customer_email,username,cus_password,points)
VALUES('KH000009','121122341353','Pananal Extra','526943443454','extral@gmail.com','panadol31','7411','32');
INSERT INTO Customer(customer_id,cccd_cmnd,customer_name,customer_phone, customer_email,username,cus_password,points)
VALUES('KH000010','741369121353','Hapacol Ex','032513443454','exhapa@gmail.com','hapacol31','96325','51');
---------------------14---------------------
INSERT INTO ServicePackage(package_name,num_days,num_guests,price) VALUES('SweetHoliday','10','2','2000');
INSERT INTO ServicePackage(package_name,num_days,num_guests,price) VALUES('Romantic','8','2','5000');
INSERT INTO ServicePackage(package_name,num_days,num_guests,price) VALUES('ChillDays','5','2','1500');
INSERT INTO ServicePackage(package_name,num_days,num_guests,price) VALUES('PeaceDays','10','1','10000');
INSERT INTO ServicePackage(package_name,num_days,num_guests,price) VALUES('AnotherDays','5','2','7000');
INSERT INTO ServicePackage(package_name,num_days,num_guests,price) VALUES('NormalDays','30','2','15000');
---------------------15---------------------
INSERT INTO TypeForDiscount(customer_type,discount,point_type) VALUES('1','0','0');
INSERT INTO TypeForDiscount(customer_type,discount,point_type) VALUES('2','0.1','30');
INSERT INTO TypeForDiscount(customer_type,discount,point_type) VALUES('3','0.15','50');
INSERT INTO TypeForDiscount(customer_type,discount,point_type) VALUES('4','0.20','100');
	
INSERT INTO BillService(customer_id,package_name,time_buying,time_starting,total_price)
VALUES('KH000001','SweetHoliday','05-May-2022 08:10','06-May-2022','2000');
INSERT INTO BillService(customer_id,package_name,time_buying,time_starting,total_price)
VALUES('KH000003','Romantic','12-Apr-2022 14:20','15-Apr-2022','5000');
INSERT INTO BillService(customer_id,package_name,time_buying,time_starting,total_price)
VALUES('KH000002','ChillDays','25-Aug-2022 09:15','26-Aug-2022','1500');
INSERT INTO BillService(customer_id,package_name,time_buying,time_starting,total_price)
VALUES('KH000004','PeaceDays','07-Feb-2022 08:30','01-Mar-2022','10000');
INSERT INTO BillService(customer_id,package_name,time_buying,time_starting,total_price)
VALUES('KH000005','SweetHoliday','05-May-2022 12:10','06-Jun-2022','2000');
INSERT INTO BillService(customer_id,package_name,time_buying,time_starting,total_price)
VALUES('KH000006','NormalDays','01-Jan-2022 12:00','03-Jan-2022','15000');
INSERT INTO BillService(customer_id,package_name,time_buying,time_starting,total_price)
VALUES('KH000007','SweetHoliday','01-Feb-2022 12:10','02-Feb-2022','2000');
INSERT INTO BillService(customer_id,package_name,time_buying,time_starting,total_price)
VALUES('KH000008','AnotherDays','03-Jul-2022 13:10','06-Jul-2022','7000');
INSERT INTO BillService(customer_id,package_name,time_buying,time_starting,total_price)
VALUES('KH000009','AnotherDays','03-Sep-2022 14:10','10-Sep-2022','7000');
INSERT INTO BillService(customer_id,package_name,time_buying,time_starting,total_price)
VALUES('KH000010','ChillDays','01-Nov-2022 14:10','11-Nov-2022','1500');
---------------------16---------------------
INSERT INTO BillBooking(time_booking,time_checkin,time_checkout,bill_status,bill_price,customer_id,package_name)
VALUES('18-May-2022 08:19','25-May-2022','28-May-2022','1','2000','KH000001','SweetHoliday');
INSERT INTO BillBooking(time_booking,time_checkin,time_checkout,bill_status,bill_price,customer_id,package_name)
VALUES('25-Aug-2022 10:31','26-Aug-2022','29-Aug-2022','1','1500','KH000002','ChillDays');
INSERT INTO BillBooking(time_booking,time_checkin,time_checkout,bill_status,bill_price,customer_id,package_name)
VALUES('18-Apr-2022 14:21','20-Apr-2022','22-Apr-2022','1','5000','KH000003','Romantic');
INSERT INTO BillBooking(time_booking,time_checkin,time_checkout,bill_status,bill_price,customer_id,package_name)
VALUES('05-Mar-2022 21:30','06-Mar-2022','16-Mar-2022','1','10000','KH000004','PeaceDays');
INSERT INTO BillBooking(time_booking,time_checkin,time_checkout,bill_status,bill_price,customer_id,package_name)
VALUES('18-May-2022 12:19','25-May-2022','28-May-2022','1','2000','KH000005','SweetHoliday');
INSERT INTO BillBooking(time_booking,time_checkin,time_checkout,bill_status,bill_price,customer_id,package_name)
VALUES('05-Jan-2022 06:19','06-Jan-2022','10-Jan-2022','1','15000','KH000006','NormalDays');
INSERT INTO BillBooking(time_booking,time_checkin,time_checkout,bill_status,bill_price,customer_id,package_name)
VALUES('10-Jun-2022 09:17','12-Jun-2022','15-Jun-2022','1','2000','KH000007','SweetHoliday');
INSERT INTO BillBooking(time_booking,time_checkin,time_checkout,bill_status,bill_price,customer_id,package_name)
VALUES('15-Jul-2022 10:13','20-Jul-2022','22-Jul-2022','1','7000','KH000008','AnotherDays');
INSERT INTO BillBooking(time_booking,time_checkin,time_checkout,bill_status,bill_price,customer_id,package_name)
VALUES('08-Sep-2022 11:19','10-Sep-2022','12-Sep-2022','1','7000','KH000009','AnotherDays');
INSERT INTO BillBooking(time_booking,time_checkin,time_checkout,bill_status,bill_price,customer_id,package_name)
VALUES('15-Nov-2022 15:14','20-Nov-2022','21-Nov-2022','1','1500','KH000010','ChillDays');
---------------------17---------------------
INSERT INTO RentingRoom(booking_id,branch_id,num_room) VALUES('DP05032022000004','CN1','103');
INSERT INTO RentingRoom(booking_id,branch_id,num_room) VALUES('DP18052022000005','CN1','503');
INSERT INTO RentingRoom(booking_id,branch_id,num_room) VALUES('DP18052022000001','CN2','303');
INSERT INTO RentingRoom(booking_id,branch_id,num_room) VALUES('DP05012022000006','CN1','403');
INSERT INTO RentingRoom(booking_id,branch_id,num_room) VALUES('DP25082022000002','CN1','203');
INSERT INTO RentingRoom(booking_id,branch_id,num_room) VALUES('DP18042022000003','CN1','303');
INSERT INTO RentingRoom(booking_id,branch_id,num_room) VALUES('DP10062022000007','CN3','203');
INSERT INTO RentingRoom(booking_id,branch_id,num_room) VALUES('DP15072022000008','CN1','403');
INSERT INTO RentingRoom(booking_id,branch_id,num_room) VALUES('DP08092022000009','CN1','503');
INSERT INTO RentingRoom(booking_id,branch_id,num_room) VALUES('DP15112022000010','CN1','203');
---------------------18---------------------
INSERT INTO PaymentBill(timer_checkin,timer_checkout,booking_id) VALUES('25-May-2022 17:20','28-May-2022 11:12','DP18052022000001');
INSERT INTO PaymentBill(timer_checkin,timer_checkout,booking_id) VALUES('26-Aug-2022 20:10','29-Aug-2022 08:43','DP25082022000002');
INSERT INTO PaymentBill(timer_checkin,timer_checkout,booking_id) VALUES('20-Apr-2022 21:49','22-Apr-2022 07:11','DP18042022000003');
INSERT INTO PaymentBill(timer_checkin,timer_checkout,booking_id) VALUES('06-Mar-2022 17:20','16-Mar-2022 06:12','DP05032022000004');
INSERT INTO PaymentBill(timer_checkin,timer_checkout,booking_id) VALUES('25-May-2022 15:20','28-May-2022 11:12','DP18052022000005');
INSERT INTO PaymentBill(timer_checkin,timer_checkout,booking_id) VALUES('06-Jan-2022 13:20','10-Jan-2022 09:12','DP05012022000006');
INSERT INTO PaymentBill(timer_checkin,timer_checkout,booking_id) VALUES('12-Jun-2022 14:40','15-Jun-2022 07:12','DP10062022000007');
INSERT INTO PaymentBill(timer_checkin,timer_checkout,booking_id) VALUES('20-Jul-2022 13:20','22-Jul-2022 09:12','DP15072022000008');
INSERT INTO PaymentBill(timer_checkin,timer_checkout,booking_id) VALUES('10-Sep-2022 16:10','12-Sep-2022 07:12','DP08092022000009');
INSERT INTO PaymentBill(timer_checkin,timer_checkout,booking_id) VALUES('20-Nov-2022 13:20','21-Nov-2022 09:12','DP15112022000010');

---------------------19---------------------
INSERT INTO Company(company_id,company_name) VALUES('DN0001','Blue Ocean');
INSERT INTO Company(company_id,company_name) VALUES('DN0002','Hot Summer');
INSERT INTO Company(company_id,company_name) VALUES('DN0003','Mountain Dew');
INSERT INTO Company(company_id,company_name) VALUES('DN0004','Red Bull');
---------------------20---------------------
INSERT INTO Service(service_id,service_type,num_guests,stype,company_id) VALUES('DVR001','R','2','Romantic','DN0001');
INSERT INTO Service(service_id,service_type,num_guests,stype,company_id) VALUES('DVS002','S','1','Peace','DN0002');
INSERT INTO Service(service_id,service_type,num_guests,stype,company_id) VALUES('DVC003','C','5','','DN0003');
INSERT INTO Service(service_id,service_type,num_guests,stype,company_id) VALUES('DVM004','M','2','','DN0004');
INSERT INTO Service(service_id,service_type,num_guests,stype,company_id) VALUES('DVB005','B','10','Excited','DN0003');
INSERT INTO Service(service_id,service_type,num_guests,stype,company_id) VALUES('DVR002','R','2','Vip','DN0001');
INSERT INTO Service(service_id,service_type,num_guests,stype,company_id) VALUES('DVS001','S','1','Cool','DN0002');
INSERT INTO Service(service_id,service_type,num_guests,stype,company_id) VALUES('DVC001','C','5','Full','DN0003');
INSERT INTO Service(service_id,service_type,num_guests,stype,company_id) VALUES('DVM005','M','2','American','DN0004');
INSERT INTO Service(service_id,service_type,num_guests,stype,company_id) VALUES('DVB004','B','10','Excited','DN0003');
---------------------21---------------------
INSERT INTO ServiceSpa(service_id,spa_type) VALUES('DVS002','Peace');
INSERT INTO ServiceSpa(service_id,spa_type) VALUES('DVS001','Hot');
---------------------22---------------------
INSERT INTO TypeSouvenir(service_id,souv_type) VALUES('DVM004','Full');
INSERT INTO TypeSouvenir(service_id,souv_type) VALUES('DVM005','Small');
---------------------23---------------------
INSERT INTO BrandSouvenir(service_id,souv_brand) VALUES('DVM004','Olala');
INSERT INTO BrandSouvenir(service_id,souv_brand) VALUES('DVM005','Hihila');
---------------------24---------------------
INSERT INTO AreaPlace(branch_id,stt_num,area_length,area_width,area_price,description,service_id,name_shop,logo_shop)
VALUES('CN1','1','18 m2','10 m2','10000','','DVM004','Olala','Smile');
INSERT INTO AreaPlace(branch_id,stt_num,area_length,area_width,area_price,description,service_id,name_shop,logo_shop)
VALUES('CN2','2','10 m2','10 m2','20000','','DVR002','SanVuon','Delicous');
INSERT INTO AreaPlace(branch_id,stt_num,area_length,area_width,area_price,description,service_id,name_shop,logo_shop)
VALUES('CN3','3','30 m2','10 m2','35000','','DVS002','Comfortable','Happy');
INSERT INTO AreaPlace(branch_id,stt_num,area_length,area_width,area_price,description,service_id,name_shop,logo_shop)
VALUES('CN4','4','25 m2','15 m2','40000','','DVB004','HotBar','Kool');
---------------------25---------------------
INSERT INTO ShopPicture(branch_id,stt_num,picture) VALUES('CN1','1','www.google-picture');
INSERT INTO ShopPicture(branch_id,stt_num,picture) VALUES('CN2','2','www.restaurent-picture');
INSERT INTO ShopPicture(branch_id,stt_num,picture) VALUES('CN3','3','www.spa-picture');
INSERT INTO ShopPicture(branch_id,stt_num,picture) VALUES('CN4','4','www.hotbar-picture');
---------------------26---------------------
INSERT INTO TimelineShop(branch_id,stt_num,time_starting,time_closing) VALUES('CN1','1','08:00','18:00');
INSERT INTO TimelineShop(branch_id,stt_num,time_starting,time_closing) VALUES('CN2','2','14:00','23:00');
INSERT INTO TimelineShop(branch_id,stt_num,time_starting,time_closing) VALUES('CN3','3','11:00','20:00');
INSERT INTO TimelineShop(branch_id,stt_num,time_starting,time_closing) VALUES('CN4','4','19:00','04:00');
---------------------27---------------------
INSERT INTO login_users VALUES('postgres','123456'); 
INSERT INTO login_users VALUES('sManager','123456');