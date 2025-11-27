-- INSERT PATIENTS (20)
INSERT INTO patients (full_name, gender, age, phone, address) VALUES
('Suresh Kumar', 'Male', 52, '9876501111', 'Hyderabad'),
('Lakshmi Devi', 'Female', 43, '9876502222', 'Chennai'),
('Rohan Das', 'Male', 29, '9876503333', 'Kolkata'),
('Sneha Reddy', 'Female', 34, '9876504444', 'Pune'),
('Anil Joshi', 'Male', 48, '9876505555', 'Delhi'),
('Divya Menon', 'Female', 38, '9876506666', 'Kerala'),
('Vinod Kumar', 'Male', 55, '9876507777', 'Mumbai'),
('Sana Khan', 'Female', 26, '9876508888', 'Lucknow'),
('Harish Gupta', 'Male', 31, '9876509999', 'Jaipur'),
('Pooja Patel', 'Female', 22, '9876510000', 'Surat'),
('Ajay Pandey', 'Male', 41, '9876511111', 'Varanasi'),
('Meera Shah', 'Female', 47, '9876512222', 'Ahmedabad'),
('Ravi Prasad', 'Male', 37, '9876513333', 'Bhopal'),
('Neha Jain', 'Female', 30, '9876514444', 'Indore'),
('Sunil Kulkarni', 'Male', 60, '9876515555', 'Nagpur'),
('Shalini Rao', 'Female', 33, '9876516666', 'Mysore'),
('Akhil Kapoor', 'Male', 28, '9876517777', 'Gurgaon'),
('Lalitha N', 'Female', 52, '9876518888', 'Vijayawada'),
('Manish Yadav', 'Male', 46, '9876519999', 'Patna'),
('Soniya Arora', 'Female', 25, '9876520000', 'Noida');

-- INSERT DOCTORS (10)
INSERT INTO doctors (full_name, specialization, phone, experience_years) VALUES
('Dr. Sharma', 'Orthopedic', '9812341111', 14),
('Dr. Kapoor', 'Pediatrician', '9812342222', 8),
('Dr. Singh', 'Oncologist', '9812343333', 16),
('Dr. Roy', 'Cardiologist', '9812344444', 22),
('Dr. Thomas', 'General Physician', '9812345555', 10),
('Dr. Aditi Rao', 'Gynecologist', '9812346666', 12),
('Dr. Mohan', 'ENT Specialist', '9812347777', 9),
('Dr. Nair', 'Dermatologist', '9812348888', 7),
('Dr. Gupta', 'Neurologist', '9812349999', 18),
('Dr. Farhan Ali', 'Psychiatrist', '9812340000', 6);

-- INSERT APPOINTMENTS (all IDs corrected)
INSERT INTO appointments (patient_id, doctor_id, appointment_date, status) VALUES
(4, 5, '2025-02-01', 'Completed'),
(7, 3, '2025-02-02', 'Completed'),
(10, 6, '2025-02-05', 'Scheduled'),
(15, 1, '2025-02-07', 'Completed'),
(12, 4, '2025-02-08', 'Cancelled'),
(18, 7, '2025-02-10', 'Completed'),
(20, 9, '2025-02-11', 'Scheduled'),
(8, 2, '2025-02-12', 'Completed'),
(9, 5, '2025-02-12', 'Completed'),
(19, 10, '2025-02-14', 'Scheduled'),
(5, 8, '2025-02-15', 'Completed'),
(16, 10, '2025-02-16', 'Completed'),
(17, 9, '2025-02-17', 'Completed'),
(11, 4, '2025-02-18', 'Scheduled'),
(3, 4, '2025-02-18', 'Completed'),
(2, 1, '2025-02-19', 'Completed'),
(13, 3, '2025-02-19', 'Completed'),
(6, 7, '2025-02-20', 'Scheduled'),
(14, 9, '2025-02-21', 'Completed'),
(1, 5, '2025-02-22', 'Completed');

-- INSERT TREATMENTS (correct IDs)
INSERT INTO treatments (patient_id, doctor_id, description, treatment_date) VALUES
(4, 5, 'Fracture checkup', '2025-02-01'),
(7, 3, 'Migraine treatment', '2025-02-02'),
(10, 6, 'Gynecology consultation', '2025-02-05'),
(15, 1, 'Heart follow-up', '2025-02-07'),
(18, 7, 'ENT infection treatment', '2025-02-10'),
(8, 2, 'Skin rash analysis', '2025-02-12'),
(16, 10, 'Mental health session', '2025-02-16'),
(17, 9, 'Neurological evaluation', '2025-02-17'),
(3, 4, 'Blood pressure evaluation', '2025-02-18'),
(1, 5, 'Joint pain therapy', '2025-02-22');

-- INSERT MEDICATIONS (correct IDs)
INSERT INTO medications (patient_id, doctor_id, medicine_name, dosage, start_date, end_date) VALUES
(4, 5, 'Calcium', '500mg', '2025-02-01', '2025-02-10'),
(7, 3, 'Pain Relief', '50mg', '2025-02-02', '2025-02-05'),
(10, 6, 'Folic Acid', '10mg', '2025-02-05', '2025-02-15'),
(15, 1, 'Aspirin', '75mg', '2025-02-07', '2025-02-14'),
(18, 7, 'Antibiotic', '100mg', '2025-02-10', '2025-02-17'),
(8, 2, 'Cetirizine', '10mg', '2025-02-12', '2025-02-16'),
(16, 10, 'Vitamin D', '20mg', '2025-02-16', '2025-02-26'),
(17, 9, 'Nootropic', '25mg', '2025-02-17', '2025-03-01'),
(3, 4, 'BP Tablet', '5mg', '2025-02-18', '2025-02-28'),
(1, 5, 'Joint Supplement', '500mg', '2025-02-22', '2025-03-05');

-- INSERT BILLING (fixed treatment_id range 1–10)
INSERT INTO billing (patient_id, treatment_id, amount, bill_date, payment_status) VALUES
(4, 1, 2200, '2025-02-01', 'Paid'),
(7, 2, 1800, '2025-02-02', 'Pending'),
(10, 3, 3000, '2025-02-05', 'Paid'),
(15, 4, 4500, '2025-02-07', 'Paid'),
(18, 5, 2600, '2025-02-10', 'Pending'),
(8, 6, 1400, '2025-02-12', 'Paid'),
(16, 7, 5000, '2025-02-16', 'Paid'),
(17, 8, 3500, '2025-02-17', 'Pending'),
(3, 9, 2100, '2025-02-18', 'Paid'),
(1, 10, 2700, '2025-02-22', 'Paid');
