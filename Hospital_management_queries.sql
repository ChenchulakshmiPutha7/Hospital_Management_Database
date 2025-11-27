-- BASIC TO ADVANCED SQL QUERIES FOR HOSPITAL DATABASE

-- 1. List all patients
SELECT * FROM patients;

-- 2. List all doctors
SELECT * FROM doctors;

-- 3. Count total patients
SELECT COUNT(*) AS total_patients FROM patients;

-- 4. Count doctors by specialization
SELECT specialization, COUNT(*) AS count
FROM doctors
GROUP BY specialization;

-- 5. Show all appointments with patient & doctor names
SELECT a.appointment_id, p.full_name AS patient, d.full_name AS doctor, a.appointment_date
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;

-- 6. Patients who have appointments today
SELECT p.full_name
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
WHERE a.appointment_date = CURDATE();

-- 7. Doctors with no appointments
SELECT d.*
FROM doctors d
LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
WHERE a.appointment_id IS NULL;

-- 8. Most frequently visiting patients
SELECT p.full_name, COUNT(*) AS total_visits
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
GROUP BY p.full_name
ORDER BY total_visits DESC;

-- 9. Total revenue
SELECT SUM(amount) AS revenue FROM billing;

-- 10. Revenue by patient
SELECT p.full_name, SUM(b.amount) AS total
FROM billing b
JOIN patients p ON b.patient_id = p.patient_id
GROUP BY p.full_name
ORDER BY total DESC;

-- 11. Medication count per patient
SELECT p.full_name, COUNT(*) AS medicines
FROM medications m
JOIN patients p ON m.patient_id = p.patient_id
GROUP BY p.full_name;

-- 12. Treatments performed by each doctor
SELECT d.full_name, COUNT(*) AS total_treatments
FROM treatments t
JOIN doctors d ON t.doctor_id = d.doctor_id
GROUP BY d.full_name;

-- 13. Patients currently under medication
SELECT p.full_name, m.medicine_name
FROM medications m
JOIN patients p ON m.patient_id = p.patient_id
WHERE CURDATE() BETWEEN m.start_date AND m.end_date;

-- 14. Daily appointment count
SELECT appointment_date, COUNT(*) AS total
FROM appointments
GROUP BY appointment_date
ORDER BY appointment_date;

-- 15. Peak appointment day of the week
SELECT DAYNAME(appointment_date) AS day_of_week, COUNT(*) AS total
FROM appointments
GROUP BY day_of_week
ORDER BY total DESC;

-- 16. Top 5 expensive treatments
SELECT t.treatment_id, t.description, b.amount
FROM billing b
JOIN treatments t ON b.treatment_id = t.treatment_id
ORDER BY b.amount DESC
LIMIT 5;

-- 17. List patients treated by a specific doctor (doctor_id = 1)
SELECT p.full_name, t.description, t.treatment_date
FROM treatments t
JOIN patients p ON t.patient_id = p.patient_id
WHERE t.doctor_id = 1;

-- 18. Appointments count per doctor
SELECT d.full_name, COUNT(*) AS total
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.full_name;

-- 19. Last 10 appointments
SELECT *
FROM appointments
ORDER BY appointment_date DESC
LIMIT 10;

-- 20. Patients who spent above average
SELECT p.full_name, SUM(b.amount) AS total_bill
FROM billing b
JOIN patients p ON b.patient_id = p.patient_id
GROUP BY p.full_name
HAVING SUM(b.amount) > (SELECT AVG(amount) FROM billing);

-- 21. Doctors with more than 5 treatments
SELECT d.full_name, COUNT(*) AS total
FROM treatments t
JOIN doctors d ON t.doctor_id = d.doctor_id
GROUP BY d.full_name
HAVING total > 5;

-- 22. Patients with no billing records
SELECT p.*
FROM patients p
LEFT JOIN billing b ON p.patient_id = b.patient_id
WHERE b.bill_id IS NULL;

-- 23. Most prescribed medication
SELECT medicine_name, COUNT(*) AS freq
FROM medications
GROUP BY medicine_name
ORDER BY freq DESC
LIMIT 1;

-- 24. Monthly revenue
SELECT DATE_FORMAT(bill_date, '%Y-%m') AS month, SUM(amount) AS total
FROM billing
GROUP BY month;

-- 25. Total treatments per day
SELECT treatment_date, COUNT(*) AS count
FROM treatments
GROUP BY treatment_date
ORDER BY treatment_date;

-- 26. Total number of appointments per status
SELECT status, COUNT(*) AS total
FROM appointments
GROUP BY status;

-- 27. Patients with more than 3 appointments
SELECT p.full_name, COUNT(a.appointment_id) AS total_appointments
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
GROUP BY p.full_name
HAVING COUNT(a.appointment_id) > 3;

-- 28. Doctors who treated more than 10 patients
SELECT d.full_name, COUNT(t.treatment_id) AS total_treatments
FROM treatments t
JOIN doctors d ON t.doctor_id = d.doctor_id
GROUP BY d.full_name
HAVING total_treatments > 10;

-- 29. Highest bill paid by each patient
SELECT p.full_name, MAX(b.amount) AS highest_bill
FROM billing b
JOIN patients p ON b.patient_id = p.patient_id
GROUP BY p.full_name;

-- 30. Earliest appointment per patient
SELECT a.patient_id, p.full_name, MIN(a.appointment_date) AS first_appointment
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
GROUP BY a.patient_id, p.full_name;

-- 31. Count medications each doctor prescribed
SELECT d.full_name, COUNT(m.medication_id) AS total_medications
FROM medications m
JOIN doctors d ON m.doctor_id = d.doctor_id
GROUP BY d.full_name
ORDER BY total_medications DESC;

-- 32. Patients with treatments but no medications
SELECT DISTINCT p.full_name
FROM treatments t
JOIN patients p ON t.patient_id = p.patient_id
LEFT JOIN medications m ON p.patient_id = m.patient_id
WHERE m.medication_id IS NULL;

-- 33. Total income per doctor
SELECT d.full_name, SUM(b.amount) AS doctor_revenue
FROM billing b
JOIN treatments t ON b.treatment_id = t.treatment_id
JOIN doctors d ON t.doctor_id = d.doctor_id
GROUP BY d.full_name
ORDER BY doctor_revenue DESC;

-- 34. Patients who visited more than 5 different doctors
SELECT p.full_name, COUNT(DISTINCT a.doctor_id) AS different_doctors
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
GROUP BY p.full_name
HAVING different_doctors > 5;

-- 35. Top 10 patients who spent the most money
SELECT p.full_name, SUM(b.amount) AS total_spent
FROM billing b
JOIN patients p ON b.patient_id = p.patient_id
GROUP BY p.full_name
ORDER BY total_spent DESC
LIMIT 10;

-- 36. Days with more than 15 appointments
SELECT appointment_date, COUNT(*) AS total_appointments
FROM appointments
GROUP BY appointment_date
HAVING total_appointments > 15
ORDER BY appointment_date;

-- 37. Doctors whose average treatment bill exceeds 3000
SELECT d.full_name, AVG(b.amount) AS avg_bill
FROM billing b
JOIN treatments t ON b.treatment_id = t.treatment_id
JOIN doctors d ON t.doctor_id = d.doctor_id
GROUP BY d.full_name
HAVING AVG(b.amount) > 3000;

-- 38. Patients whose treatments and billing dates mismatch
SELECT p.full_name, t.treatment_date, b.bill_date
FROM treatments t
JOIN billing b ON t.treatment_id = b.treatment_id
JOIN patients p ON b.patient_id = p.patient_id
WHERE b.bill_date <> t.treatment_date;

-- 39. Count pending vs paid bills
SELECT payment_status, COUNT(*) AS total
FROM billing
GROUP BY payment_status;

-- 40. Longest-running medication duration
SELECT m.medication_id, p.full_name,
DATEDIFF(m.end_date, m.start_date) AS days_duration
FROM medications m
JOIN patients p ON m.patient_id = p.patient_id
ORDER BY days_duration DESC
LIMIT 1;
