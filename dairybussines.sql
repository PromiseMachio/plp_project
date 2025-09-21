/*
=== FINAL PROJECT ===
Designer; Machio Promise.
About the PROJECT.
 The project is an inventory tracking db system on a dairy farm.
 Here I have designed tracking strategies on the PRODUCTION SECTOR and THE SALES SECTOR
 What to expect on each section.
 *** PRODUCTION SECTION ***
 1. Source of production: 
    Track the number of animals in the farm. Cows like jersey etc
    sheds with animals 
 2. Feeds:
    Track the usage of feeds. With dates of being bought and consumption rate.
 3. Medication:
    Tracking animals welfare, sick animals. Under dosage and tracking the usage of the medication
 4. Equipments:
    Tracking the equipments under usage and those spoiled. This include a variaty 
 5: Production:
    Tracking of the raw materials in the production. 

 *** SALES SECTION ***
 1. Customers:
   The customer who are to get the produce details.
 2. Orders:
    Tracking the orders in place.
 3. Employees:
    Tracking the employees details on where they are supposed to be.
 4. Customers remarks:
    Track the remarks of the customers for future rectifications and advancing of the services.
*/
CREATE DATABASE dairysalesDB;
USE dairysalesDB;
-- *************************************////////////////// ____________PRODUCTION SECTION___________________\\\\\\\\\\\\\\\\********************************

/*
TABLES:
      farm.
      feeds. 
      medication. 
      equipments.
*/
# Creating tables.
/*
Farm :
Table will track type of breeds and their numbers in the farm:
1. breeds: We will see the different type of breeds and their numbers
2. sheds the number of sheds and employees responsible. 
*/
CREATE TABLE breed(
animalID INT  AUTO_INCREMENT PRIMARY KEY ,
animalType VARCHAR(50),
animalQuantity INT
);

CREATE TABLE sheds(
shedID VARCHAR(200) UNIQUE,
animalbreed VARCHAR(200),
Capacity INT NOT NULL
);

CREATE TABLE shedEmployees(
employeesID VARCHAR(200) UNIQUE,
employeeName VARCHAR(200) NOT NULL,
employeePHoneNo VARCHAR(200) NOT NULL UNIQUE,
employeeShed  VARCHAR(200)  REFERENCES shedID
);

/*
Feeds:
Tables to record the feeds and track there usage
1. Tables will record the feeds usage , specific breeds of cows being given
*/

CREATE TABLE feeds(
feedID INT AUTO_INCREMENT PRIMARY KEY,
feedType VARCHAR(100),
feed_name VARCHAR(100) UNIQUE,
dateIn DATE NOT NULL,
animalType VARCHAR(50)NOT NULL,
feedQuantity VARCHAR(200) NULL,
date_disposal DATE NULL,
feedsstatus ENUM('In store', 'Used up')
DEFAULT 'In store'
);
/*
Treatment :
Tables to track the way animals are being treated.
1. medication table: Contains types of meds and how to  administer.
2. Animal reg number under observation
3. Treatment record, Doctor who treated the cow, date and note.
*/
CREATE TABLE medication(
med_ID INT UNIQUE,
med_name VARCHAR(700) NOT NULL,
med_type VARCHAR(500) ,
targetGroup ENUM('Calves', 'Heifers', 'Adult Cows', 'ALL'),
med_typeID VARCHAR(200) UNIQUE,
med_Administration VARCHAR(500)
);
CREATE TABLE AnimalTraked(
animaltag_no VARCHAR(300) UNIQUE,
medicationtypeID VARCHAR(200) UNIQUE,
animalbreed VARCHAR(100) ,
animalSex VARCHAR(100),
agegroup VARCHAR(100),
doctorAdministering VARCHAR(200),
FirstDOSE date NOT NULL,
prescription VARCHAR(1000) NOT NULL,
note VARCHAR(600)
);
/*
Farm Equipments:
Tables will record the tracking and number of equipments in the farm.
1. Tables will show damaged and which sheds are the equipments in.
*/
CREATE TABLE equipments(
equipmentID INT AUTO_INCREMENT PRIMARY KEY,
equipmentName VARCHAR(200),
Cartegory VARCHAR(200),
PurchaseDate DATE,
Condition_Status ENUM('Good', 'Bad', 'Need repair') DEFAULT 'Good',
Quantity INT DEFAULT 1,
Location VARCHAR(200),
Last_serviseDate DATE NULL,
next_serviseDate DATE NULL
);

CREATE TABLE ShedEqipSupply(
shedEquipID INT AUTO_INCREMENT PRIMARY KEY,
shed_ToSupply  VARCHAR(200)  REFERENCES shedID,
equipmentName VARCHAR(200),
equipNumbers INT NOT NULL
);
-- ====================================================*******DATA INPUT*******========================================================================================
-- Inserting data in tables.

-- ***************************************************____________FARM SECTION___________******************************************************************
/*
Farm records:
Data records on farm
*/
INSERT INTO breed( animalType,  animalQuantity)
VALUES 
('Dairy cattle', 120),
('Holstein Friesian', 50),
('Ayrshire cattle', 12),
('Guernsey cattle', 10);

INSERT INTO sheds(shedID, animalbreed, Capacity)
VALUES
("#PKGH2343", "Dairy cattle", 30),
("#PLTK2345",  "Ayrshire cattle", 15),
("#PJKK1113", "Dairy cattle", 50),
("#LKFH234", "Guernsey cattle", 40),
("#JYUI567", 'Holstein Friesian', 25);

INSERT INTO shedEmployees(employeesID, employeeName, employeePHoneNo, employeeShed)
VALUES 
("@UJK123", "Oduor Dancan", "0714923456", "#PLTK2345"),
("@SEG456", "Mercy Akinyi", "0716543789", "#JYUI567"),
("@SAER34", "Andrew Pendera","0716234801", "#PJKK1113"),
("@WSER44", "Safira Nakali", "0712789902", "#PKGH2343"),
("@ASF213", "Patera Jamviju", "0756483921", "#JYUI567"),
("@DFT123", "Lilian Mativo", "0716463214", "#LKFH234"),
("@UTYM23", "Famire Auma", "0777778456", "#PKGH2343"),
("@SNCV46", "Pendo Himelda", "0790909089", "#JYUI567"),
("@SQML34", "Petre Johnson","0716909899", "#PJKK1113"),
("@WHIO34", "Malkia Zubeda", "0714456902", "#PLTK2345"),
("@AVL213", "Jimmy Godan", "0700065781", "#JYUI567"),
("@DWR123", "Fakilia Wambui", "0719896574", "#LKFH234"),
("@VHY123", "Joan Kalimo", "0790435667", "#PLTK2345"),
("@SDF456", "Wilfred Asulwa", "0711212129", "#JYUI567"),
("@MMMR34", "Travis Karilimu","0710943781", "#PKGH2343"),
("@GHJR44", "Gakuli Favian", "0732322202", "#PLTK2345"),
("@BNM213", "Peter Jahaom", "0750003234", "#JYUI567"),
("@PLK123", "Anita Favilen", "0712334567", "#PKGH2343"),
("@SBXM23", "Kaveri Felix", "0770006787", "#PLTK2345"),
("@QCDV46", "Nakumu Salim", "0767332266", "#JYUI567"),
("@NMXL34", "Paketri Gevian ","0755574357", "#PJKK1113"),
("@VVCO34", "Machio Samuel", "0714000008", "#PLTK2345"),
("@ZCX213", "Jimmy Greg", "0701119870", "#JYUI567"),
("@KLR123", "Amiline Wambui", "0719665439", "#LKFH234");
-- **************************************__________FEEDS SECTION_______________***********************************************
/*
Feeds records:
Data records on feeds
*/

INSERT INTO feeds(feedType, feed_name, dateIn, animalType, feedQuantity, date_disposal, feedsstatus)
VALUES 
("Roughages", "grass", "2025-09-12", "Guernsey cattle", "1OO Filled Sacks", "2025-10-18", "Used up"),
("Roughages", "Legumes", "2025-09-13", "Ayrshire cattle", "200 bales", "2025-10-17", "In store"),
("Roughages", "Hay", "2025-10-12", "Guernsey cattle", "50 bales", "2026-05-11", "In store"),
("Roughages", "Silage", "2025-03-12", "Holstein Friesian", "2 silos", "2025-09-12", "Used up"),
("Roughages", "Napier grass", "2025-11-12", "Dairy cattle", "300 heads", "2025-12-27", "In store"),
("Concentrates", "Corn meal", "2025-06-01", "Guernsey cattle", "50 bags", "2025-10-22", "In store"),
("Concentrates", "Barley", "2025-01-12", "Holstein Friesian", "2 silos", "2025-09-11", "Used up"),
("Concentrates", "Oats", "2025-02-11", "Dairy cattle", "300 bags", "2026-09-12", "In store"),
("Concentrates", "White bran", "2024-11-21", "Guernsey cattle", "1OO Filled Sacks", "2025-05-12", "Used up"),
("Concentrates", "Molasses", "2025-06-19", "All breeds", "40 jericans", "2026-12-01", "In store"),
("Proten suppliments", "Soybean meal", "2025-06-19", "All breeds", "50 bags", "2026-12-01", "In store"),
("Proten suppliments", "Cottonseed cake", "2025-06-19", "All breeds", "50 bags", "2026-12-01", "In store"),
("Proten suppliments", "Sunflower cake", "2025-06-19", "All breeds", "300 bags", "2026-12-01", "In store"),
("Proten suppliments", "Fish meal", "2025-01-12", "All breeds", "50 bags", "2026-12-01", "In store"),
("Proten suppliments", "Blood meal", "2025-01-12", "All breeds", "50 bags", "2026-12-01", "In store");

-- ***********************************__________________TREATEMENT SECTION________________________***********************************
/*
Treatment records:
Data records on treatment/ Medication
*/
INSERT INTO medication( med_ID ,med_name, med_type, targetGroup, med_typeID, med_Administration )
VALUES
(101,"Penicillin","Antibiotics","ALL", "$QWE12321","Injection" ),
(102,"Oxytetracyline","Antibiotics","ALL","$QWE4567", "Injection"),
(103,"Tylosin", "Antibiotics", "ALL", "$QWE44456", "Injection"),
(104,"Ceftiofur", "Antibiotics", "ALL","$QWE21122","Injection"),
(105,"Levamisole", "Dewormers", "ALL","$AWWD12234", "Oral"),
(106,"FMD injection", "Vaccine", "Calves", "$REWD2213","Injection"),
(107,"LSD injection", "Vaccine", "Heifers", "$REWD2234","Injection"),
(108,"Blackquarter", "Vaccine", "Calves", "$REWD6787", "Injection"),
(109,"MultiVitamins", "Suppliments", "Calves", "$FFF5675", "Oral"),
(110,"Calcium Borogluconate", "Suppliments", "Adult Cows","$FFF89757", "Injection"),
(111,"Prostagladins", "Repproductive drugs", "Adult Cows","$WCC1323", "Injection");


INSERT INTO AnimalTraked(animaltag_no, medicationtypeID, animalbreed, animalSex, agegroup, doctorAdministering, FirstDOSE, prescription, note)
VALUES
("COW #23", "$QWE12321", "Ayrshire cattle", "Female", "Adult cow", "Dr Kamau Ndongu'", "2025-09-12", "Injection Neck after 2weeks For 5 months", "Pheomonia"),
("COW #233", "$FFF5675" , "Guernsey cattle", "Female", "Calf", "Dr Anita Pendo", "2025-09-18", "Oral administration oonce after 3 months for 1 yr", "Immunity Boosting");


-- ******************************************________________FARM EQUIPMENTS SECTION ___________________________________**************************************
/*
Equipments:
Tables created will track numbers of equpments in sheds and production units.
1. The equipments will be recorded by numbers and shed where they are.
*/
INSERT INTO equipments(equipmentName,  Cartegory, PurchaseDate, Condition_Status, Quantity, Location, Last_serviseDate, next_serviseDate)
VALUES
("Milking Machine", "Milking Equipments", "2023-01-11", "Need repair", 3, "Milkiing Unit", "2024-07-12", "2025-12-10"),
("Water troughs", "Feeding Equipments", "2023-01-09", "Good", 50, "Field", "2024-07-18", "2025-12-13"),
("Water troughs", "Feeding Equipments", "2023-01-09", "Good", 100, "Sheds", "2024-07-18", "2025-12-13"),
("Feed Mixer", "Feeding Equipments", "2023-01-06", "Good", 212, "Sheds", "2024-07-18", "2025-12-13"),
("Milk cooler", "Milking Equipments", "2024-04-19", "Bad", 12, "Milking Unit", "2025-01-10", "2025-12-27"),
("Wheelbarrow", "Gen Farm Tools", "2023-01-11", "Need repair", 59, 'Field', "2024-07-18", "2025-12-13") ,
("Wheelbarrow", "Gen Farm Tools", "2023-01-11", "Need repair", 59, 'Sheds', "2024-07-18", "2025-12-13"),
("Feeding troughs", "Feeding Equipments", "2023-01-09", "Good", 300, "Sheds", "2024-07-18", "2025-12-13"),
("Silage choppers", "Field Equipments", "2024-02-16", "Good", 12, "Field", "2025-12-30", "2026-12-13");

INSERT INTO ShedEqipSupply(shed_ToSupply, equipmentName, equipNumbers)
VALUES 
("#PKGH2343", "Water troughs", 40),
("#PLTK2345", "Water troughs", 20),
("#PJKK1113", "Water troughs", 10),
("#LKFH234", "Water troughs", 15),
("#JYUI567", "Water troughs", 15),
("#PKGH2343", "Feeding troughs", 40),
("#PLTK2345", "Feeding troughs", 20),
("#PJKK1113", "Feeding troughs", 10),
("#LKFH234", "Feeding troughs", 15),
("#JYUI567", "Feeding troughs", 15);



-- **************************************////////////____________________SALES SECTION____________________\\\\\\\\\\\*******************************
/*
This section of the farm inventory tracking system will monitor the sales to customers.
Tables under this section will include:
1. Raw Material:
   This table will show the amount of milk the farm produces.
2. Employees in Sales Depertment:
   This tables will show employees in different sales depertment and milk production.
3. Customer orders:
   Tables will have big companies and small coustomers and there set amounts or rather regulatories in sales
4. Customers remerks:
   This are stored feedbacks from the customers to help improve the services and milking productions.
5. The farms sales records and bank statements and the few who can access the data. 
*/

CREATE TABLE milkProduction(
milkproductionID INT AUTO_INCREMENT PRIMARY KEY,
animal_breed VARCHAR(200),
production_date DATE,
milking_session ENUM('Morning', 'Afternoon', 'Evening') NOT NULL,
Milk_liters DECIMAL(6, 2),
Fat_percentage DECIMAL(6, 2),
Collected_by VARCHAR(200),
Storage_Tank VARCHAR(100)
);

CREATE TABLE SalesEmployees(
EmployeesID INT AUTO_INCREMENT PRIMARY KEY,
Employee_WorkID VARCHAR(200) UNIQUE,
EmployeeName VARCHAR(200) NOT NULL,
EmployeePhone_No VARCHAR(200) UNIQUE,
EmployeesEmail VARCHAR(200) UNIQUE,
Employee_WorkDept ENUM('Milk sales Dept', 'Animal sales Dept', 'Feeds & By-products sales Dept', 'Equipment services Dept', 'Farm Finance Dept'),
Work_Descriprion VARCHAR(300)
);

CREATE TABLE Customer(
    CustomerID VARCHAR(200) PRIMARY KEY,
    CustomerName VARCHAR(200) NOT NULL,
    CustomerEmail VARCHAR(200) UNIQUE
);

CREATE TABLE orders(
orderID INT AUTO_INCREMENT PRIMARY KEY,
orderUnqID VARCHAR(200) UNIQUE,
CustomerUniqID VARCHAR(200) UNIQUE REFERENCES CustomerID
);

CREATE TABLE orderdetails(
orderDetailsID INT AUTO_INCREMENT PRIMARY KEY,
orderUnqID VARCHAR(200) UNIQUE REFERENCES orderUnqID,
orderDescription VARCHAR(700) NOT NULL,
order_bill VARCHAR(200) NOT NULL,
order_placedDate DATE,
order_expiringDate DATE,
note ENUM('Done', 'Not Done') DEFAULT 'Done'
);

-- ************************************************_________________DATA INPUTS_____________________**************************************************
/*
The data ...
Input in the sales table  
*/
INSERT INTO milkProduction(animal_breed, production_date, milking_session, Milk_liters, Fat_percentage, Collected_by,Storage_Tank)
VALUES
("Dairy cattle", "2025-11-12", 'Morning', 200.00, 17.00, "Lilian Mativo", "Tank A"),
("Ayrshire cattle", "2025-11-17", 'Morning', 51.00, 40.00, "Andrew Pendera", "Tank B"),
("Dairy cattle ", "2025-11-1", 'Afternoon', 100.00, 17.00, "Mercy Akinyi", "Tank E"),
('Holstein Friesian', "2025-11-12", 'Afternoon', 50.00, 13.00, "Joan Kalimo", "Tank A"),
("Dairy cattle", "2025-11-12", 'Afternoon', 50.00, 17.00,  "Kaveri Felix", "Tank C"),
("Guernsey cattle", "2025-11-12", 'Evening', 70.00, 13.00, "Gakuli Favian", "Tank B"),
("Ayrshire cattle", "2025-11-12", 'Evening', 40.00, 30.12, "Machio Samuel", "Tank E"),
("Guernsey cattle", "2025-11-12", 'Evening', 90.00, 09.12, "Amiline Wambui", "Tank D");

INSERT INTO SalesEmployees(Employee_WorkID, EmployeeName, EmployeePhone_No, EmployeesEmail, Employee_WorkDept, Work_Descriprion)
VALUES
("@HUL567", "Dancan Kevin", "0756771234", "kevindan@gmail.com", "Feeds & By-products sales Dept", "Seeling excess by-product"),
("@HUL777", "Joy Mulindi", "0756700000", "mulindi90@gmail.com", "Feeds & By-products sales Dept", "Seeling excess by-product"),
("@TYU456", "Agustine Joshua", "0700987644", "joshuaaguistine20@gmail.com", "Equipment services Dept", "Hiring to other farms"),
("@TYU321", "Anjie Wakuli", "0722116578", "ajelawakuli@gmail.com", "Equipment services Dept", "Hiring to other farms"),
("@JKL700", "Bonke Reinhard", "0700978911", "bonkereinhard878@gmail.com", "Animal sales Dept", "Selling animal products and cows"),
("@JKL709", "Quinerta Apundi", "0733111234", "quinny09@gmail.com", "Animal sales Dept", "Selling animal products and cows"),
("@SEQ543", "Sam Mberu", "0700401278", "sammberu09@gmail.com", "Farm Finance Dept", "Sales and finances "),
("@SEQ987", "Sofia Kiltra", "0744128893", "sofiakiltra@gmail.com", "Milk sales Dept", "Selling milk products"),
("@DFG213", "Chester Telaviv", "0700123494", "chestertelaviv@gmail.com", "Milk sales Dept", "Selling milk products"),
("@DFG456", "Safira Sonny", "0777789876", "safiraSonny@gmail.com", "Farm Finance Dept", "Sales and finances");


INSERT INTO Customer(CustomerName, CustomerEmail, CustomerID)
VALUES
("Promise Machio", "promisemachio05@gmail.com", "#6567GHH"),
("Florida Mbeu", "floridambeu09@gmail.com", "#789JHKL"),
("Godwell Awiti", "godwellawiti09@gmail.com", "#778HRTE"),
("Joshua Willy", "joshuawilly@gmail.com", "#899HRTQ"),
("Shadrack Himan", "shadrackhimm890@gmail.com", "#765UKLH");

INSERT INTO orders(orderUnqID, CustomerUniqID)
VALUES
("#6567GHH", "@QQQW345566754"),
("#789JHKL", "@GHTYU56677886"),
("#778HRTE", "@JHHUK89908654"),
("#899HRTQ", "@LKUYR45567785"),
("#765UKLH", "@KKLOP45567890");

INSERT INTO orderdetails(orderUnqID, orderDescription, order_bill, order_placedDate, order_expiringDate, note)
VALUES
("@QQQW345566754", "100 Litre", "ksh 21,000", "2025-10-09", "2025-12-18", 'Not Done'),
("@GHTYU56677886", "90 Litre", "ksh 18,000", "2025-10-19", "2025-01-27", 'Not Done'),
("@JHHUK89908654", "12000 Litre", "ksh 100,000", "2025-10-17", "2026-01-30", 'Not Done'),
("@HJJGFD6799865", "1000 Litre", "ksh 31,0000", "2025-10-20", "2025-12-30", 'Not Done'),
("@LKUYR45567785", "200 Litre", "ksh 50,000", "2025-10-16", "2026-02-14", 'Not Done'),
("@KKLOP45567890", "560 Litre", "ksh 40,000", "2025-10-23", "2026-02-11", 'Not Done');





























