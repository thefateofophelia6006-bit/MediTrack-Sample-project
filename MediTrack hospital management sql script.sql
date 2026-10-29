CREATE DATABASE MediTrack;
USE MediTrack;
CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Contact VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(100)
  );
INSERT INTO Patients VALUES
(1, "Rohit Sharma", 34, "M", "9831000001", "rohit.sharma@gmail.com", "Kolkata"), (2, "Simran Kaur", 29, "F", "9831000002", "simran.kaur@yahoo.com", "Delhi"),
(3, "Amit Ghosh", 45, "M", "9831000003", "amit.ghosh@gmail.com", "Mumbai"), (4, "Nisha Patel", 51, "F", "9831000004", "nisha.patel@hotmail.com", "Ahmedabad"),
(5, "Suresh Reddy", 60, "M", "9831000005", "suresh.reddy@gmail.com", "Hyderabad"), (6, "Meera Nair", 38, "F", "9831000006", "meera.nair@yahoo.com", "Chennai"),
(7, "Vikas Yadav", 27, "M", "9831000007", "vikas.yadav@outlook.com", "Lucknow"), (8, "Anjali Gupta", 33, "F", "9831000008", "anjali.gupta@gmail.com", "Jaipur"),
(9, "Rajesh Kumar", 55, "M", "9831000009", "rajesh.kumar@yahoo.com", "Pune"), (10, "Pooja Singh", 41, "F", "9831000010", "pooja.singh@gmail.com", "Bhopal"),
(11, "Sanjay Verma", 48, "M", "9831000011", "sanjay.verma@outlook.com", "Kolkata"), (12, "Kiran Das", 36, "F", "9831000012", "kiran.das@gmail.com", "Delhi"),
(13, "Manoj Tiwari", 29, "M", "9831000013", "manoj.tiwari@yahoo.com", "Mumbai"), (14, "Ritu Chatterjee", 44, "F", "9831000014", "ritu.chatterjee@gmail.com", "Kolkata"),
(15, "Deepak Joshi", 52, "M", "9831000015", "deepak.joshi@outlook.com", "Ahmedabad"), (16, "Swati Bose", 31, "F", "9831000016", "swati.bose@gmail.com", "Hyderabad"),
(17, "Arvind Rao", 39, "M", "9831000017", "arvind.rao@yahoo.com", "Chennai"), (18, "Nandini Sen", 26, "F", "9831000018", "nandini.sen@gmail.com", "Lucknow"),
(19, "Harish Chandra", 58, "M", "9831000019", "harish.chandra@outlook.com", "Jaipur"), (20, "Lata Mishra", 47, "F", "9831000020", "lata.mishra@gmail.com", "Pune");
SELECT * FROM Patients;
CREATE TABLE Doctors (
    Doctor_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Specialization VARCHAR(50),
    Fee DECIMAL(10, 2),
    Experience_Years INT
  );
INSERT INTO Doctors VALUES
(201, "Dr. Rohan Mehta", "Cardiology", "800.00", 12), (202, "Dr. Ananya Roy", "Dermatology", "500.00", 8),
(203, "Dr. Vikram Singh", "Orthopedics", "700.00", 15), (204, "Dr. Priya Nair", "Pediatrics", "450.00", 10),
(205, "Dr. Arjun Kapoor", "Neurology", "900.00", 18), (206, "Dr. Sneha Iyer", "Gynecology", "600.00", 9),
(207, "Dr. Karan Malhotra", "ENT", "400.00", 7), (208, "Dr. Divya Menon", "Ophthalmology", "550.00", 11),
(209, "Dr. Rahul Verma", "General Medicine", "300.00", 6), (210, "Dr. Neha Joshi", "Psychiatry", "650.00", 13),
(211, "Dr. Sameer Khan", "Urology", "750.00", 14), (212, "Dr. Pooja Desai", "Endocrinology", "700.00", 10),
(213, "Dr. Aditya Rao", "Gastroenterology", "800.00", 16), (214, "Dr. Kavita Pillai", "Oncology", "1000.00", 20),
(215, "Dr. Manish Agarwal", "Nephrology", "850.00", 17);
SELECT * FROM Doctors;

CREATE TABLE Appointments (
    Appointment_ID INT PRIMARY KEY,
    Patient_ID INT,
    Doctor_ID INT,
    Appointment_Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
  );
INSERT INTO Appointments VALUES
(3001, 1, 201, "2024-01-05", "Completed"), (3002, 3, 205, "2024-01-06", "Completed"),
(3003, 5, 203, "2024-01-07", "Completed"), (3004, 7, 209, "2024-01-08", "Completed"),
(3005, 10, 214, "2024-01-09", "Completed"), (3006, 2, 206, "2024-01-10", "Completed"),
(3007, 4, 202, "2024-01-11", "Completed"), (3008, 6, 208, "2024-01-12", "Completed"),
(3009, 8, 213, "2024-01-13", "Completed"), (3010, 9, 210, "2024-01-14", "Completed");
SELECT * FROM Appointments;
CREATE TABLE Prescriptions (
    Prescription_ID INT PRIMARY KEY,
    Appointment_ID INT,
    Medicine VARCHAR(100),
    Dosage VARCHAR(20),
    Duration_Days INT,
    FOREIGN KEY (Appointment_ID) REFERENCES Appointments(Appointment_ID)
  );
INSERT INTO Prescriptions VALUES
(5001, 3001, "Aspirin", "75mg", 30), (5002, 3001, "Atorvastatin", "20mg", 30),
(5003, 3002, "Levetiracetam", "500mg", 60), (5004, 3002, "Gabapentin", "300mg", 30),
(5005, 3003, "Ibuprofen", "400mg", 10), (5006, 3003, "Calcium", "500mg", 30),
(5007, 3004, "Paracetamol", "500mg", 5), (5008, 3005, "Tamoxifen", "20mg", 90),
(5009, 3006, "Folic Acid", "5mg", 30), (5010, 3007, "Cetirizine", "10mg", 15),
(5011, 3008, "Timolol Eye Drops", "0.5%", 30), (5012, 3009, "Omeprazole", "20mg", 14),
(5013, 3010, "Sertraline", "50mg", 60);
SELECT * FROM Prescriptions;
CREATE TABLE Billing (
    Bill_ID INT PRIMARY KEY,
    Appointment_ID INT,
    Amount DECIMAL(10, 2),
    Payment_Method VARCHAR(50),
    Payment_Status VARCHAR(20),
    FOREIGN KEY (Appointment_ID) REFERENCES Appointments(Appointment_ID)
  );
INSERT INTO Billing VALUES
(4001, 3001, "800.00", "Credit Card", "Paid"), (4002, 3002, "900.00", "Credit Card", "Paid"),
(4003, 3003, "700.00", "Cash", "Paid"), (4004, 3004, "300.00", "Debit Card", "Paid"),
(4005, 3005, "1000.00", "Credit Card", "Paid"), (4006, 3006, "600.00", "UPI", "Paid"),
(4007, 3007, "500.00", "Cash", "Paid"), (4008, 3008, "550.00", "Debit Card", "Paid"),
(4009, 3009, "800.00", "Credit Card", "Paid"), (4010, 3010, "650.00", "UPI", "Paid");
SELECT * FROM Billing;
-- List all appointments scheduled after '2024-01-08'.
SELECT * FROM Appointments WHERE Appointment_Date > '2024-01-08';
-- Retrieve all payments made via Credit Card
SELECT * FROM Billing WHERE Payment_Method = 'Credit Card';
-- Display the 5 doctors with the highest consultation fees
SELECT * FROM Doctors ORDER BY Fee DESC LIMIT 5;
-- Show the 3 most recent appointments
SELECT * FROM Appointments ORDER BY Appointment_Date DESC LIMIT 3;
-- Find all medicines prescribed to 'Rohit Sharma'
SELECT pr.Medicine FROM Prescriptions pr
-- Display bills with an amount greater than the average billing amount
  JOIN Appointments a ON pr.Appointment_ID = a.Appointment_ID
  JOIN Patients p ON a.Patient_ID = p.Patient_ID
  WHERE p.Name = 'Rohit Sharma';
SELECT * FROM Billing WHERE Amount > (SELECT AVG(Amount) FROM Billing);
-- Find the total number of appointments booked by each patient
SELECT Patient_ID, COUNT(*) AS Total_Appointments FROM Appointments GROUP BY Patient_ID;
-- Find the average consultation fee for each specialization
SELECT Specialization, AVG(Fee) AS Avg_Fee FROM Doctors GROUP BY Specialization;
-- Show the number of completed appointments
SELECT COUNT(*) AS Completed_Appointments FROM Appointments WHERE Status = 'Completed';
-- Find the patient who has spent the most on medical bills
SELECT a.Patient_ID, SUM(b.Amount) AS Total_Spent
  FROM Appointments a JOIN Billing b ON a.Appointment_ID = b.Appointment_ID
  GROUP BY a.Patient_ID ORDER BY Total_Spent DESC LIMIT 1;
-- Identify doctors who have not attended any appointments
SELECT Name FROM Doctors
  WHERE Doctor_ID NOT IN (SELECT DISTINCT Doctor_ID FROM Appointments);
  -- Calculate the cumulative billing revenue per day
  SELECT a.Appointment_Date, SUM(b.Amount) OVER (ORDER BY a.Appointment_Date) AS Cumulative_Revenue
  FROM Appointments a JOIN Billing b ON a.Appointment_ID = b.Appointment_ID;
  -- Find the total revenue generated from each payment method
  SELECT Payment_Method, SUM(Amount) AS Total_Revenue FROM Billing GROUP BY Payment_Method;
  -- Display the total amount billed to each patient
  SELECT a.Patient_ID, SUM(b.Amount) AS Total_Billed
  FROM Appointments a JOIN Billing b ON a.Appointment_ID = b.Appointment_ID
  GROUP BY a.Patient_ID;
-- Retrieve appointments where more than one medicine was prescribed
SELECT Appointment_ID FROM Prescriptions
  GROUP BY Appointment_ID HAVING COUNT(Prescription_ID) > 1;
-- Show patients who have paid via 'UPI'
SELECT DISTINCT p.Name FROM Patients p
  JOIN Appointments a ON p.Patient_ID = a.Patient_ID
  JOIN Billing b ON a.Appointment_ID = b.Appointment_ID
  WHERE b.Payment_Method = 'UPI';
  -- Find the average billing amount per month
  SELECT MONTH(a.Appointment_Date) AS Month, AVG(b.Amount) AS Avg_Amount
  FROM Appointments a JOIN Billing b ON a.Appointment_ID = b.Appointment_ID
  GROUP BY Month;
-- Retrieve the specialization that generated the highest total revenue
SELECT d.Specialization, SUM(b.Amount) AS Total_Revenue
  FROM Doctors d JOIN Appointments a ON d.Doctor_ID = a.Doctor_ID
  JOIN Billing b ON a.Appointment_ID = b.Appointment_ID
  GROUP BY d.Specialization ORDER BY Total_Revenue DESC LIMIT 1;

-- Retrieve the top 3 patients with the highest total billing amounts
SELECT a.Patient_ID, SUM(b.Amount) AS Total_Spent
  FROM Appointments a JOIN Billing b ON a.Appointment_ID = b.Appointment_ID
  GROUP BY a.Patient_ID ORDER BY Total_Spent DESC LIMIT 3;
-- Find the payment method that has processed the most transactions
SELECT Payment_Method, COUNT(*) AS Transaction_Count FROM Billing
  GROUP BY Payment_Method ORDER BY Transaction_Count DESC LIMIT 1;
-- Show the total billing amount generated by each specialization
SELECT d.Specialization, SUM(b.Amount) AS Total_Revenue
  FROM Doctors d JOIN Appointments a ON d.Doctor_ID = a.Doctor_ID
  JOIN Billing b ON a.Appointment_ID = b.Appointment_ID
  GROUP BY d.Specialization;
-- List each specialization with its doctor's consultation fee
SELECT Specialization, MAX(Fee) AS Max_Fee FROM Doctors GROUP BY Specialization;
-- Create an index to search appointments by patient
CREATE INDEX idx_patient_id ON Appointments(Patient_ID);
DESC Appointments;
-- Create a unique index for patient emails
CREATE UNIQUE INDEX idx_email ON Patients(Email);
DESC Patients;
-- Create a view to show bills above $700
CREATE VIEW HighValueBills AS
  SELECT * FROM Billing WHERE Amount > 700;
 
SELECT * FROM HighValueBills;
-- Create a view for total revenue per payment method
CREATE VIEW RevenueSummary AS
  SELECT Payment_Method, SUM(Amount) AS Total_Revenue
  FROM Billing GROUP BY Payment_Method;
 
SELECT * FROM RevenueSummary;



  

