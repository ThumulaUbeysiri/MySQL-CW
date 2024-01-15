create database PawBay
create table Doctor
(
DID varchar(20) primary key check(DID like 'D%'),
FName varchar(60) not null,
MName varchar(60) not null,
LName varchar(60) not null,
Contact int not null,
Email varchar(200) not null,
DAddress varchar(200) not null
);

create table DoctorQualification
(
DID varchar(20) foreign key references Doctor(DID),
Qualification varchar(200) not null,
primary key(DID,Qualification)
);

create table PetOwner
(
POID varchar(20) primary key check(POID like 'PO%'),
FName varchar(60) not null,
MName varchar(60) not null,
LName varchar(60) not null,
Contact int not null,
Email varchar(200) not null,
POAddress varchar(200) not null
);

create table Pet
(
PID varchar(20) primary key check(PID like 'P%'),
PName varchar(30) not null,
DoB date not null,
Breed varchar(30) not null,
Sex varchar(15) not null,
Species varchar(30) not null,
POID varchar(20) foreign key references PetOwner(POID) not null,
);

create table Receptionist
(
RID varchar(20) primary key check(RID like 'R%'),
FName varchar(60) not null,
MName varchar(60) not null,
LName varchar(60) not null,
Contact int not null,
Email varchar(200) not null,
RAddress varchar(200) not null
);

create table ClinicBook
(
BID varchar(20) primary key check(BID like 'B%'),
IssueDate date not null,
IssueTime time not null,
RID varchar(20) foreign key references Receptionist(RID) not null,
PID varchar(20) foreign key references Pet(PID) not null
);

create table Appointment
(
AppointID varchar(20) primary key check(AppointID like 'A%'),
AppointDate date not null,
AppointTime time not null,
Recommendation varchar(200) not null,
Findings varchar(200) not null,
PID varchar(20) foreign key references Pet(PID) not null,
DID varchar(20) foreign key references Doctor(DID) not null,
POID varchar(20) foreign key references PetOwner(POID) not null
);

create table AppointPrescrip
(
AppointID varchar(20) foreign key references Appointment(AppointID),
Prescription varchar(50) not null,
primary key(AppointID,Prescription)
);

create table Surgery
(
SurgeryID varchar(20) primary key check(SurgeryID like 'S%'),
SDate date not null,
STime time not null,
AppointID varchar(20) foreign key references Appointment(AppointID) not null
);

create table Product
(
ProID varchar(20) primary key check(ProID like 'PR%'),
PName varchar(30) not null,
Price decimal(10,2) not null,
Quantity int not null
);

create table Purchase
(
POID varchar(20) foreign key references PetOwner(POID),
ProID varchar(20) foreign key references Product(ProID),
PurchaseQuantity int null,
PurchaseDate date not null,
PurchaseTime time not null,
Total decimal(10,2) not null,
primary key(POID,ProID)
);

create table Invoice
(
InvoiceID varchar(20) primary key check(InvoiceID like 'I%'),
InvDate date not null,
InvTime time not null,
Amount decimal(10,2) not null,
PaidAmount decimal(10,2) not null,
Balance decimal(10,2) not null,
AppointID varchar(20) foreign key references Appointment(AppointID) not null
);

insert into Doctor(DID,FName,MName,LName,Contact,Email,DAddress)
values('D001','Sunil','Sri','Wikramasinghe',0772345678,'sunil@gmail.com','Colombo'),
('D002','Kamal','Jayamina','Wijeweera',0772465378,'Kamal@gmail.com','Galle'),
('D003','Nimal','Narayan','Subhasinghe',0772345123,'Nimal@gmail.com','Colombo'),
('D004','Kumara','Hettige','Laksiri',0752345656,'Kumara@gmail.com','Colombo'),
('D005','Dinujaya','Delpa','Sumanasinghe',0712345365,'Dinujaya@gmail.com','Matara'),
('D006','Achala','Shri','Nanayakkara',0772335426,'Achala@gmail.com','Galle'),
('D007','Ajantha','Surinimal','Mendis',0771867589,'Ajantha@gmail.com','Colombo'),
('D008','Ajith','Kumara','Naarayana',0712341356,'Ajith@gmail.com','Hambantota'),
('D009','Amanthi','Shrima','Hewage',0751246789,'Amanthi@gmail.com','Hambantota'),
('D010','Anesha','Neela','Veeraman',0761324354,'Anesha@gmail.com','Galle'),
('D011','Chaminda','Sri','Mendis',0713549008,'Chaminda@gmail.com','Matara'),
('D012','Chathurika','Neranjani','Prematunga',0702345666,'Chathurika@gmail.com','Galle'),
('D013','Sandali','Amaya','Kulatunga',0701234567,'Sandali@gmail.com','Galle'),
('D014','Isuri','Tharumini','Akaasha',0772345678,'Isuri@gmail.com','Hambantota'),
('D015','Lakmini','Neranjani','Hedaweera',0700035478,'Lakmini@gmail.com','Galle');

insert into DoctorQualification(DID,Qualification)
values('D001','Anesthesia and analgesia'),
('D001','Animal welfare'),
('D002','Behavioral medicine'),
('D003','Clinical pharmacology'),
('D004','Dentistry'),
('D005','Dentistry'),
('D005','Dermatology'),
('D006','Emergency and critical care'),
('D007','Internal medicine'),
('D008','Emergency and critical care'),
('D008','Laboratory animal medicine'),
('D009','Microbiology'),
('D010','Nutrition'),
('D011','Ophthalmology'),
('D011','Surgery'),
('D012','Surgery'),
('D013','Zoological medicine'),
('D013','Sports medicine and rehabilitation'),
('D014','Radiology'),
('D015','Preventive medicine');

insert into PetOwner(POID,FName,MName,LName,Contact,Email,POAddress)
values('PO001','Dulasi','Hewage','DeSilva',0719992345,'Dulasi@gmail.com','Galle'),
('PO002','Sandali','Tharushika','Abeynayaka',0713056798,'Sandali@gmail.com','Galle'),
('PO003','Nimesh','Sri','Kolombage',0775648900,'Nimesh@gmail.com','Colombo'),
('PO004','Lakshitha','Lashith','Mendis',0111234567,'Lakshitha@gmail.com','Colombo'),
('PO005','Charu','Manila','DeSilva',0912244567,'Charu@gmail.com','Galle'),
('PO006','Saaranya','Kiwi','Mendis',0112341234,'Saaranya@gmail.com','Colombo'),
('PO007','Nimali','Kawya','Deesha',0719992322,'Nimali@gmail.com','Matara'),
('PO008','Hiruni','Pavani','Divyanga',0722332345,'Hiruni@gmail.com','Hambantota'),
('PO009','Amara','Nimali','wijesooriya',0700992345,'Amara@gmail.com','Hambantota'),
('PO010','Sara','Amandi','wijesinghe',0712223310,'Sara@gmail.com','Colombo'),
('PO011','Kasun','Jaye','Malabe',0719994478,'Kasun@gmail.com','Ratnapura'),
('PO012','Kaveen','Hewage','Silva',0719988997,'Kaveen@gmail.com','Ratnapura'),
('PO013','Lasindu','Wageesha','Seneviratne',0700023654,'Lasindu@gmail.com','Galle'),
('PO014','Navindu','Keshara','Mendis',0719222314,'Navindu@gmail.com','Ratnapura'),
('PO015','Kethmini','Sheela','Wijesiri',0715667500,'Kethmini@gmail.com','Colombo');

insert into Pet(PID,PName,DoB,Breed,Sex,Species,POID)
values('P001', 'Leesa', '2019-02-14', 'Golden Retriever', 'Female', 'Dog','PO001'),
('P002', 'Ollie', '2020-07-10', 'Siamese', 'Female', 'Cat','PO001'),
('P003', 'Buddy', '2018-12-05', 'German Shepherd', 'Male', 'Dog','PO002'),
('P004', 'Misty', '2017-04-22', 'Persian', 'Male', 'Cat','PO003'),
('P005', 'Rocky', '2021-01-30', 'Labrador Retriever', 'Male', 'Dog','PO004'),
('P006', 'Cleo', '2020-11-18', 'Bengal', 'Male', 'Cat','PO004'),
('P007', 'Charlie', '2019-09-25', 'French Bulldog', 'Male', 'Dog','PO005'),
('P008', 'Sophie', '2020-03-17', 'Maine Coon', 'Female', 'Cat','PO006'),
('P009', 'Bailey', '2018-08-08', 'Beagle', 'Male', 'Dog','PO007'),
('P010', 'Chloe', '2022-02-28', 'Ragdoll', 'Male', 'Cat','PO007'),
('P011', 'Buster', '2017-06-12', 'Dachshund', 'Male', 'Dog','PO008'),
('P012', 'Zoe', '2019-11-01', 'Sphynx', 'Male', 'Cat','PO009'),
('P013', 'Sam', '2020-04-20', 'Poodle', 'Male', 'Dog','PO010'),
('P014', 'Mia', '2018-10-15', 'Scottish Fold', 'Female', 'Cat','PO011'),
('P015', 'Maximus', '2021-07-08', 'Husky', 'Female', 'Dog','PO012'),
('P016', 'Lola', '2019-05-05', 'Boxer', 'Female', 'Dog','PO013'),
('P017', 'Jack', '2018-03-20', 'Ragdoll', 'Male', 'Cat','PO014'),
('P018', 'Lucy', '2020-10-10', 'Siamese', 'Female', 'Cat','PO014'),
('P019', 'Oscar', '2017-08-25', 'Bulldog', 'Female', 'Dog','PO015'),
('P020', 'Lily', '2022-01-12', 'Maine Coon', 'Female', 'Cat','PO015');

insert into Receptionist(RID,FName,MName,LName,Contact,Email,RAddress)
values('R001','Ajith','Mapriya','Mendis',0912244555,'RAjith@gmail.com','Galle'),
('R002','Manil','Kaawya','Silva',0912241234,'RManil@gmail.com','Galle'),
('R003','Kalan','Kithmuka','Abeynayaka',0912233333,'RKalan@gmail.com','Hambantota'),
('R004','Jay','Sri','Kamal',0912111155,'RJay@gmail.com','Colombo'),
('R005','Nimala','Haris','Wijey',0988884555,'RNimala@gmail.com','Colombo'),
('R006','Warsha','Mehini','Desilva',0925544555,'RWarsha@gmail.com','Hambantota'),
('R007','Amari','Faathima','Muhamma',0705678995,'RAmari@gmail.com','Ratnapura'),
('R008','Safra','Fathima','Hasri',0770044555,'RSafra@gmail.com','Ratnapura'),
('R009','Divya','Neranjani','Kumari',0772222222,'RDivya@gmail.com','Galle'),
('R010','Lasantha','Kumara','Mendis',0912000005,'RLasantha@gmail.com','Ratnapura'),
('R011','Lasith','Kumara','Mepitiya',0912111155,'RLasith@gmail.com','Hambantota'),
('R012','Saman','Udaya','Kumara',0912255555,'RSaman@gmail.com','Galle');

insert into ClinicBook(BID,IssueDate,IssueTime,RID,PID)
values('B001', '2029-08-15', '09:00:00','R001','P001'),
('B002', '2020-12-16', '10:30:00','R001','P002'),
('B003', '2018-07-17', '11:45:00','R002','P003'),
('B004', '2017-08-18', '13:15:00','R003','P004'),
('B005', '2021-10-19', '14:00:00','R004','P005'),
('B006', '2020-11-20', '15:30:00','R005','P006'),
('B007', '2019-11-21', '16:45:00','R010','P007'),
('B008', '2020-11-22', '17:00:00','R010','P008'),
('B009', '2018-12-23', '09:30:00','R010','P009'),
('B010', '2022-09-24', '10:45:00','R001','P010'),
('B011', '2017-09-25', '12:00:00','R001','P011'),
('B012', '2019-09-26', '13:30:00','R006','P012'),
('B013', '2020-10-27', '14:45:00','R006','P013'),
('B014', '2018-08-28', '16:00:00','R007','P014'),
('B015', '2021-12-29', '17:15:00','R008','P015'),
('B016', '2019-12-30', '09:45:00','R005','P016'),
('B017', '2018-12-01', '11:00:00','R005','P017'),
('B018', '2020-12-02', '12:15:00','R004','P018'),
('B019', '2017-10-03', '13:45:00','R004','P019'),
('B020', '2022-09-04', '15:00:00','R003','P020');

insert into Appointment(AppointID,AppointDate,AppointTime,Recommendation,Findings,PID,DID,POID)
values('A001', '2023-01-15', '09:00:00', 'Regular checkup', 'Healthy', 'P001', 'D001', 'PO001'),
('A002', '2023-02-03', '11:30:00', 'Vaccination', 'No issues found', 'P002', 'D002', 'PO002'),
('A003', '2023-02-20', '14:15:00', 'Follow-up visit', 'Recovered well', 'P003', 'D003', 'PO003'),
('A004', '2023-03-05', '10:00:00', 'Dental cleaning', 'Mild tartar buildup', 'P004', 'D004', 'PO004'),
('A005', '2023-04-10', '13:45:00', 'Blood test', 'Normal results', 'P005', 'D005', 'PO005'),
('A006', '2023-05-18', '16:30:00', 'X-ray examination', 'Fracture detected', 'P006', 'D006', 'PO006'),
('A007', '2023-06-22', '09:30:00', 'Spaying procedure', 'Successful surgery', 'P007', 'D007', 'PO007'),
('A008', '2023-07-07', '12:00:00', 'Skin allergy check', 'Slight irritation observed', 'P008', 'D008', 'PO008'),
('A009', '2023-08-14', '15:20:00', 'Eye examination', 'Clear vision', 'P009', 'D009', 'PO009'),
('A010', '2023-09-02', '08:45:00', 'Flea treatment', 'No signs of infestation', 'P010', 'D010', 'PO010'),
('A011', '2023-09-19', '11:00:00', 'Check for joint pain', 'Mild discomfort noted', 'P011', 'D011', 'PO011'),
('A012', '2023-10-25', '14:50:00', 'Ear infection check', 'Inflammation present', 'P012', 'D012', 'PO012'),
('A013', '2023-11-11', '16:00:00', 'Annual vaccination', 'No adverse reactions', 'P013', 'D013', 'PO013'),
('A014', '2023-12-08', '10:30:00', 'Deworming', 'Infestation cleared', 'P014', 'D014', 'PO014'),
('A015', '2023-12-29', '13:00:00', 'Heartworm test', 'Negative for heartworms', 'P015', 'D015', 'PO015'),
('A016', '2024-01-07', '15:40:00', 'Ultrasound scan', 'Healthy organs', 'P011', 'D015', 'PO001'),
('A017', '2024-02-14', '09:20:00', 'Follow-up for surgery', 'Good recovery progress', 'P019', 'D010', 'PO002'),
('A018', '2024-03-22', '11:10:00', 'Dietary consultation', 'Recommendations provided', 'P019', 'D009', 'PO004'),
('A019', '2024-04-30', '14:00:00', 'Behavioral assessment', 'No concerns observed', 'P018', 'D006', 'PO010'),
('A020', '2024-05-16', '16:20:00', 'Nail trimming', 'Completed without issues', 'P020', 'D015', 'PO007');

insert into AppointPrescrip (AppointID, Prescription)
values('A001', 'Penicillin'),
('A001', 'Nimbex'),
('A002', 'Penicillin'),
('A002', 'Nimbex'),
('A003', 'Zofran'),
('A003', 'Zoe'),
('A004', 'Penicillin'),
('A004', 'Pawxlovid'),
('A005', 'Amphoterrier B'),
('A005', 'Pawxlovid'),
('A006', 'Pawxlovid'),
('A006', 'Peni'),
('A007', 'Amphoterrier B'),
('A007', 'Nimbex'),
('A008', 'Verapawmil'),
('A008', 'Nimbex'),
('A009', 'Lidocaine'),
('A009', 'Peni'),
('A010', 'Lidocaine'),
('A010', 'Nimbex');

insert into Surgery (SurgeryID, SDate, STime, AppointID)
values('S001', '2023-01-15', '09:00:00', 'A001'),
('S002', '2023-02-03', '11:30:00', 'A002'),
('S003', '2023-02-20', '14:15:00', 'A003'),
('S004', '2023-03-05', '10:00:00', 'A004'),
('S005', '2023-04-10', '13:45:00', 'A005'),
('S006', '2023-05-18', '16:30:00', 'A006'),
('S007', '2023-06-22', '09:30:00', 'A007'),
('S008', '2023-07-07', '12:00:00', 'A008'),
('S009', '2023-08-14', '15:20:00', 'A009'),
('S010', '2023-09-02', '08:45:00', 'A010'),
('S011', '2023-09-19', '11:00:00', 'A011'),
('S012', '2023-10-25', '14:50:00', 'A012');

insert into Product (ProID, PName, Price, Quantity)
values('PR001', 'Dog Food', 4500.00, 100),
('PR002', 'Cat Litter', 3200.00, 80),
('PR003', 'Fish Tank', 9500.00, 25),
('PR004', 'Bird Cage', 5500.00, 40),
('PR005', 'Hamster Wheel', 1800.00, 30),
('PR006', 'Rabbit Hutch', 10500.00, 20),
('PR007', 'Pet Shampoo', 1200.00, 70),
('PR008', 'Treats Assortment', 3900.00, 60),
('PR009', 'Reptile Heat Lamp', 5200.00, 15),
('PR010', 'Small Animal Bedding', 2300.00, 50),
('PR011', 'Aquarium Decor', 4500.00, 45),
('PR012', 'Dog Collar', 1500.00, 90),
('PR013', 'Cat Scratching Post', 4800.00, 35),
('PR014', 'Bird Feeder', 3000.00, 55),
('PR015', 'Pet Carrier', 7800.00, 10);

insert into Purchase (POID, ProID, PurchaseQuantity, PurchaseDate, PurchaseTime, Total)
values('PO001', 'PR001', 2, '2023-01-15', '09:00:00', 6400.00),
('PO002', 'PR003', 1, '2023-02-03', '11:30:00', 9500.00),
('PO003', 'PR006', 1, '2023-02-20', '14:15:00', 10500.00),
('PO001', 'PR008', 3, '2023-03-05', '10:00:00', 11700.00),
('PO002', 'PR009', 2, '2023-04-10', '13:45:00', 10400.00),
('PO003', 'PR012', 4, '2023-05-18', '16:30:00', 6000.00),
('PO001', 'PR014', 1, '2023-06-22', '09:30:00', 3000.00),
('PO002', 'PR015', 2, '2023-07-07', '12:00:00', 15600.00),
('PO003', 'PR011', 1, '2023-08-14', '15:20:00', 4500.00),
('PO001', 'PR005', 2, '2023-09-02', '08:45:00', 3600.00),
('PO002', 'PR007', 3, '2023-09-19', '11:00:00', 3600.00),
('PO003', 'PR002', 1, '2023-10-25', '14:50:00', 3200.00),
('PO001', 'PR010', 2, '2023-11-11', '16:00:00', 4600.00),
('PO002', 'PR004', 1, '2023-12-08', '10:30:00', 5500.00),
('PO003', 'PR013', 3, '2023-12-29', '13:00:00', 14400.00);

insert into Invoice (InvoiceID, InvDate, InvTime, Amount, PaidAmount, Balance, AppointID)
values('I001', '2023-01-15', '09:00:00', 4500.00, 4500.00, 0.00, 'A001'),
('I002', '2023-02-03', '11:30:00', 8500.00, 8500.00, 0.00, 'A002'),
('I003', '2023-02-20', '14:15:00', 10500.00, 9500.00, 1000.00, 'A003'),
('I004', '2023-03-05', '10:00:00', 2500.00, 2500.00, 0.00, 'A004'),
('I005', '2023-04-10', '13:45:00', 4200.00, 4200.00, 0.00, 'A005'),
('I006', '2023-05-18', '16:30:00', 6000.00, 6000.00, 0.00, 'A006'),
('I007', '2023-06-22', '09:30:00', 3000.00, 2700.00, 300.00, 'A007'),
('I008', '2023-07-07', '12:00:00', 1000.00, 1000.00, 0.00, 'A008'),
('I009', '2023-08-14', '15:20:00', 4500.00, 4000.00, 500.00, 'A009'),
('I010', '2023-09-02', '08:45:00', 1000.00, 1000.00, 0.00, 'A010'),
('I011', '2023-09-19', '11:00:00', 3200.00, 3200.00, 0.00, 'A011'),
('I012', '2023-10-25', '14:50:00', 1500.00, 1500.00, 0.00, 'A012'),
('I013', '2023-11-11', '16:00:00', 2000.00, 2000.00, 0.00, 'A013'),
('I014', '2023-12-08', '10:30:00', 3800.00, 3800.00, 0.00, 'A014'),
('I015', '2023-12-29', '13:00:00', 5000.00, 5000.00, 0.00, 'A015');

--Select queries

select * from Pet

select * from PetOwner

select POID,ProID,PurchaseQuantity,Total from Purchase
where Total>10000

--joining tables

select Pet.PID,Pet.PName,PetOwner.POID,PetOwner.LName from
Pet inner join PetOwner on PetOwner.POID=Pet.POID

select Appointment.AppointID,PetOwner.POID,PetOwner.LName as PetOwner_Name,Appointment.DID from
Appointment inner join PetOwner on Appointment.POID=PetOwner.POID
where Appointment.DID = 'D006'

--group by and having

select PetOwner.POID,PetOwner.LName,count(*) as PetCount from 
pet inner join PetOwner on pet.POID=PetOwner.POID
group by PetOwner.LName,PetOwner.POID
having count(*)>1

select PetOwner.POID,PetOwner.LName,Count(*) as No_of_products from
Purchase inner join PetOwner on Purchase.POID=PetOwner.POID
group by PetOwner.LName,PetOwner.POID
having count(*)>2

--creating procedures & executing them

create procedure Pet_PetOWner
as
begin
select Pet.PID,Pet.PName,PetOwner.POID,PetOwner.LName from
Pet inner join PetOwner on Pet.POID=PetOwner.POID
group by Pet.PID,Pet.PName,PetOwner.POID,PetOwner.LName
end

exec Pet_PetOWner

create procedure DrDetails
as
begin 
select * from Doctor
end

exec DrDetails

--sub queries

select ProID,Pname,Price from Product
where Price > (select avg(Price) from Product)

select * from Appointment where pid in 
(select PID from Appointment where Recommendation = 'Follow-up visit')

--updating table

update Appointment
set Recommendation = 'Follow-up visit' where
AppointID = 'A002'

--creating views

create view  DR_Attendence as
select DID,Lname from Doctor

create view PO_Emails as
select POID,Contact,Email from PetOwner

select * from DR_Attendence

select * from PO_Emails




















