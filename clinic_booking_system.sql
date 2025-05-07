--Create a database clinicDB for the Clinic Booking System
CREATE DATABASE clinicDB;

-- Use the database
USE clinicDB;

-- Create a table for storing information about Patients
   CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    dob DATE,
    phone VARCHAR(20) UNIQUE,
    email VARCHAR(100)
);

--Insert sample data into Patients table
INSERT INTO Patients (Patient_id, name, gender, dob, phone, email) 
VALUES (1, 'Brian Otieno', 'Male',   '1980-12-15', '5550201', 'brian.atieno@yahoo.com'),
		(2, 'Jane Grace', 'Female', '1995-07-22', '5550202', 'jane.grace@yahoo.com'),
		(3, 'Alex Morgan', 'Male', '2001-03-10', '5550203', 'alex.morgan@yahoo.com'),
		(4, 'Wanjiku Johnson', 'Female', '1975-11-05', '5550204', 'wanjiku.johnson@yahoo.com'),
		(5, 'William Brown', 'Male', '1988-01-30', '5550205', 'william.brown@yahoo.com'),
		(6, 'Olivia Williams', 'Female', '1992-09-12', '5550206', 'oliver.wailliams@yahoo.com'),
        (7, 'James Jones', 'Male', '1965-04-20', '5550207', 'james.jones@yahoo.com'),
        (8, 'Sophia Davis', 'Female', '2010-02-14', '5550208', 'sophia.davis@yahoo.com'),
        (9, 'Mason Martinez', 'Male', '2000-06-01', '5550209', 'mason.martinez@yaho.com'),
        (10, 'Casey Taylor', 'Female', '1985-05-25', '5550210', 'casey.taylor@yahoo.com');


-- Create a table for storing information about Departments
CREATE TABLE Departments(
 department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

--Insert sample data into Departments table
INSERT INTO Departments (name)
VALUES
('General Medicine'),
('Pediatrics'),
('Cardiology'),
('Orthopedics'),
('Dermatology'),
('Gynecology'),
('Neurology'),
('Oncology'),
('Psychiatry'),
('Ophthalmology');


-- Create a table for storing information about Doctors
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

--Insert sample data into Doctors table
INSERT INTO Doctors (name, specialty, email, phone, department_id)
VALUES
('Dr. James Kariuki', 'Internal Medicine', 'j.kariuki@clinic.com', '0700111222', 1),  -- General Medicine
('Dr. Grace Wambui', 'Child Health', 'g.wambui@clinic.com', '0700222333', 2),        -- Pediatrics
('Dr. Kevin Mwangi', 'Heart Specialist', 'k.mwangi@clinic.com', '0700333444', 3),    -- Cardiology
('Dr. Diana Achieng', 'Bone & Joint Specialist', 'd.achieng@clinic.com', '0700444555', 4),  -- Orthopedics
('Dr. Samuel Njoroge', 'Skin Specialist', 's.njoroge@clinic.com', '0700555666', 5),  -- Dermatology
('Dr. Lydia Chebet', 'Women Health', 'l.chebet@clinic.com', '0700666777', 6),        -- Gynecology
('Dr. Brian Kiptoo', 'Brain & Nervous System', 'b.kiptoo@clinic.com', '0700777888', 7), -- Neurology
('Dr. Nancy Otieno', 'Cancer Specialist', 'n.otieno@clinic.com', '0700888999', 8),   -- Oncology
('Dr. Alex Musyoka', 'Mental Health', 'a.musyoka@clinic.com', '0700999000', 9),      -- Psychiatry
('Dr. Faith Muthoni', 'Eye Specialist', 'f.muthoni@clinic.com', '0710111222', 10);   -- Ophthalmology

    
-- Create a table for storing information about Appointments
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    reason TEXT,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

--Insert sample data into Appointments table
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, reason, status)
VALUES
(1, 3, '2025-05-10', '09:00:00', 'Routine heart checkup', 'Scheduled'),
(2, 1, '2025-05-08', '11:00:00', 'General fatigue and headache', 'Completed'),
(3, 6, '2025-05-09', '14:30:00', 'Prenatal consultation', 'Scheduled'),
(4, 4, '2025-05-07', '10:15:00', 'Knee pain after fall', 'Completed'),
(5, 2, '2025-05-10', '15:00:00', 'Child has fever and cough', 'Scheduled'),
(6, 9, '2025-05-06', '12:00:00', 'Anxiety and insomnia', 'Completed'),
(7, 7, '2025-05-12', '08:30:00', 'Frequent migraines', 'Scheduled'),
(8, 8, '2025-05-11', '13:45:00', 'Suspected tumor follow-up', 'Cancelled'),
(9, 10, '2025-05-10', '10:00:00', 'Blurry vision', 'Scheduled'),
(10, 5, '2025-05-09', '16:00:00', 'Skin rash spreading', 'Completed');


-- Create a table for storing information about Schedules 
CREATE TABLE Schedules (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT NOT NULL,
    available_day ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday') NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

--Insert sample data into Schedules table
INSERT INTO Schedules (doctor_id, available_day, start_time, end_time)
VALUES
(1, 'Monday', '09:00:00', '13:00:00'),     -- Dr. Kariuki
(2, 'Tuesday', '10:00:00', '14:00:00'),    -- Dr. Wambui
(3, 'Wednesday', '08:30:00', '12:30:00'),  -- Dr. Mwangi
(4, 'Thursday', '11:00:00', '15:00:00'),   -- Dr. Achieng
(5, 'Friday', '09:00:00', '13:00:00'),     -- Dr. Njoroge
(6, 'Monday', '10:00:00', '14:00:00'),     -- Dr. Chebet
(7, 'Tuesday', '08:00:00', '12:00:00'),    -- Dr. Kiptoo
(8, 'Wednesday', '09:30:00', '13:30:00'),  -- Dr. Otieno
(9, 'Thursday', '10:00:00', '14:00:00'),   -- Dr. Musyoka
(10, 'Friday', '08:30:00', '12:30:00');    -- Dr. Muthoni


-- Create a table for storing information about Payments
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT UNIQUE,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method ENUM('Cash', 'Card', 'Insurance') NOT NULL,
    status ENUM('Paid', 'Pending', 'Refunded') DEFAULT 'Paid',
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

--Insert sample data into Payments table
INSERT INTO Payments (appointment_id, amount, payment_date, payment_method, status)
VALUES
(1, 3500.00, '2025-05-10', 'Card', 'Pending'),
(2, 2000.00, '2025-05-08', 'Cash', 'Paid'),
(3, 2500.00, '2025-05-09', 'Insurance', 'Paid'),
(4, 3000.00, '2025-05-07', 'Card', 'Paid'),
(5, 2200.00, '2025-05-10', 'Cash', 'Paid'),
(6, 4000.00, '2025-05-06', 'Insurance', 'Paid'),
(7, 3300.00, '2025-05-12', 'Card', 'Pending'),
(8, 5000.00, '2025-05-11', 'Insurance', 'Refunded'),
(9, 1800.00, '2025-05-10', 'Cash', 'Paid'),
(10, 2700.00, '2025-05-09', 'Card', 'Paid');


-- Create a table for storing information about Medical Records
CREATE TABLE MedicalRecords (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL UNIQUE,
    doctor_id INT NOT NULL,
    appointment_id INT NOT NULL,
    diagnosis TEXT,
    treatment TEXT,
    prescription TEXT,
    record_date DATE NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

--Insert sample data into MedicalRecords table
INSERT INTO MedicalRecords (patient_id, doctor_id, appointment_id, diagnosis, treatment, prescription, record_date)
VALUES
(1, 3, 1, 'Mild arrhythmia detected', 'Lifestyle advice and ECG monitoring', 'Atenolol 25mg once daily', '2025-05-10'),
(2, 1, 2, 'General fatigue due to anemia', 'Iron supplements and dietary change', 'Ferrous sulfate 200mg', '2025-05-08'),
(3, 6, 3, 'Prenatal check – 2nd trimester normal', 'Routine prenatal care', 'Folic acid, iron supplements', '2025-05-09'),
(4, 4, 4, 'Sprained knee joint', 'Cold compress, physical therapy', 'Ibuprofen 400mg as needed', '2025-05-07'),
(5, 2, 5, 'Upper respiratory tract infection', 'Fluids, rest, and antipyretics', 'Paracetamol syrup 5ml x 3 daily', '2025-05-10'),
(6, 9, 6, 'Moderate anxiety disorder', 'Counseling and medication', 'Escitalopram 10mg daily', '2025-05-06'),
(7, 7, 7, 'Chronic migraines', 'Preventive medication and hydration advice', 'Propranolol 40mg daily', '2025-05-12'),
(8, 8, 8, 'Benign breast tumor (follow-up)', 'MRI scheduled, biopsy discussed', 'No prescription yet', '2025-05-11'),
(9, 10, 9, 'Myopia (short-sightedness)', 'Prescription glasses', 'None', '2025-05-10'),
(10, 5, 10, 'Allergic contact dermatitis', 'Topical steroids and avoid triggers', 'Hydrocortisone cream 1%', '2025-05-09');


-- Create a table for storing information about Feedback
CREATE TABLE Feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_id INT NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comments TEXT,
    feedback_date DATE NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

--Insert sample data into Feedback table
INSERT INTO Feedback (patient_id, doctor_id, appointment_id, rating, comments, feedback_date)
VALUES
(1, 3, 1, 4, 'Dr. Mwangi was attentive and explained everything clearly.', '2025-05-10'),
(2, 1, 2, 5, 'Very helpful and professional. I felt heard and cared for.', '2025-05-08'),
(3, 6, 3, 5, 'Excellent prenatal care. Would recommend to others.', '2025-05-09'),
(4, 4, 4, 3, 'Helpful advice but waiting time was long.', '2025-05-07'),
(5, 2, 5, 4, 'Dr. Wambui was kind to my child and provided good care.', '2025-05-10'),
(6, 9, 6, 5, 'Professional and understanding. Great mental health support.', '2025-05-06'),
(7, 7, 7, 4, 'Good diagnosis, but I wish more time was spent explaining options.', '2025-05-12'),
(8, 8, 8, 2, 'Disappointed that follow-up was not scheduled properly.', '2025-05-11'),
(9, 10, 9, 5, 'Quick and efficient eye test. Very satisfied.', '2025-05-10'),
(10, 5, 10, 4, 'Good treatment for my skin issue. Improvement noticed quickly.', '2025-05-09');


-- Create a table for storing information about Users (for authentication)
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,  -- Store hashed password for security
    role ENUM('Admin', 'Doctor', 'Patient', 'Staff') NOT NULL,  -- Role-based access
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


--Insert sample data into Users table
INSERT INTO Users (username, password_hash, role, email, phone)
VALUES
('admin', 'hashed_password_123', 'Admin', 'admin@clinic.com', '123-456-7890'),  -- Admin user
('drkariuki', 'hashed_password_234', 'Doctor', 'dr.kariuki@clinic.com', '234-567-8901'),  -- Doctor user
('drwambui', 'hashed_password_345', 'Doctor', 'dr.wambui@clinic.com', '345-678-9012'),  -- Doctor user
('brian_otieno', 'hashed_password_456', 'Patient', 'brian.otieno@yahoo.com', '456-789-0123'),  -- Patient user
('jane-grace', 'hashed_password_567', 'Patient', 'jane.grace@yahoo.com', '567-890-1234'),  -- Patient user
('nursejane', 'hashed_password_678', 'Staff', 'nurse.jane@climic.com', '678-901-2345'),  -- Staff user
('support_team', 'hashed_password_789', 'Staff', 'support@clinic.com', '789-012-3456'),  -- Staff user
('wanjiku_johnson', 'hashed_password_890', 'Patient', 'wanjiku.johnson@yahoo.com', '890-123-4567'),  -- Patient user
('drahmed', 'hashed_password_901', 'Doctor', 'dr.ahmed@clinic.com', '901-234-5678'),  -- Doctor user
('janedoe_staff', 'hashed_password_012', 'Staff', 'janedoe.staff@clinic.com', '012-345-6789');  -- Staff user

-- Create a table for storing information about Notifications
CREATE TABLE Notifications (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,  -- Links to the Users table
    message TEXT NOT NULL,  -- Notification content
    notification_type ENUM('Appointment', 'Reminder', 'System Update', 'Feedback', 'Other') NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,  -- Indicates if the notification has been read
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Timestamp for when the notification was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- Automatically updates when modified
    FOREIGN KEY (user_id) REFERENCES Users(user_id)  -- Foreign key linking to Users table
);

--Insert sample data into Notifications table
INSERT INTO Notifications (user_id, message, notification_type, is_read)
VALUES
(1, 'Your appointment with Dr. Kariuki has been confirmed for 2025-05-10 at 9:00 AM.', 'Appointment', FALSE),
(2, 'Reminder: Your upcoming appointment with Dr. Wambui is tomorrow at 3:00 PM.', 'Reminder', FALSE),
(3, 'System Update: The clinic’s portal will be down for maintenance from 2025-05-15 12:00 AM to 2:00 AM.', 'System Update', FALSE),
(4, 'You received a new feedback from your recent consultation with Dr. Ahmed. Please review.', 'Feedback', FALSE),
(5, 'Reminder: Your next prescription refill is due. Contact the clinic for more details.', 'Reminder', FALSE),
(6, 'Appointment Alert: Your consultation with Dr. Kariuki has been rescheduled to 2025-05-12 at 11:00 AM.', 'Appointment', TRUE),
(7, 'Your medical record has been updated. Please review the treatment plan.', 'System Update', FALSE),
(8, 'Reminder: Complete your patient feedback form for your appointment with Dr. Wambui.', 'Reminder', FALSE),
(9, 'New Appointment Scheduled: Your check-up with Dr. Ahmed is set for 2025-05-11 at 10:00 AM.', 'Appointment', FALSE),
(10, 'System Update: Your account has been successfully updated.', 'System Update', TRUE);


--Relationships 
-- One-to-Many Relationships
One-to-Many:

Users → Notifications

One Department → Many Doctors

One Patient → Many Appointments

One Doctor → Many Appointments

One Doctor → Many Schedules

Many Doctor → One Feedback

Many Doctors → One Department (One Department can have Many Doctors)


--One-to-One Relationships
One-to-One:

One Appointment → One Payment

One Appointment → One Feedback

One Patient → One Medical Record (enforced with UNIQUE)
