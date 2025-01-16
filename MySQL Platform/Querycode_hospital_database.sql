-- Print a list of all doctors based at a particular hospital
SELECT 
    doctor_id, 
    doctor_name, 
    doctor_prename, 
    doctor_address, 
    hospital_name, 
    DoB
FROM 
    doctors
WHERE 
    hospital_name = 'Hull Royal Infirmary';

--Print a list of all prescriptions for a particular patient, ordered by the prescription date
SELECT 
    p.prescription_id, 
    p.prescription_date, 
    m.api AS medication_name, 
    d.disease_name, 
    doc.doctor_name, 
    doc.doctor_prename
FROM 
    prescriptions p
JOIN 
    medications m ON p.medication_id = m.medication_id
JOIN 
    Diseases d ON p.disease_id = d.disease_id
JOIN 
    doctors doc ON p.doctor_id = doc.doctor_id
WHERE 
    p.nhs_number = 1059121755 -- specific patient's NHS number
ORDER BY 
    p.prescription_date ASC;

--Print a list of all prescriptions that a particular doctor has prescribed
SELECT 
    p.prescription_id, 
    p.prescription_date, 
    m.api AS medication_name, 
    d.disease_name, 
    pt.patient_name, 
    pt.patient_prename
FROM 
    prescriptions p
JOIN 
    medications m ON p.medication_id = m.medication_id
JOIN 
    Diseases d ON p.disease_id = d.disease_id
JOIN 
    Patients pt ON p.nhs_number = pt.nhs_number
WHERE 
    p.doctor_id = 14  -- Replace with the specific doctor's ID
ORDER BY 
    p.prescription_date DESC;

-- Print a table showing all prescriptions ordered by the patient name alphabetically
SELECT 
    pt.patient_name, 
    pt.patient_prename, 
    p.prescription_id, 
    p.prescription_date, 
    m.api AS medication_name, 
    d.disease_name, 
    doc.doctor_name, 
    doc.doctor_prename
FROM 
    prescriptions p
JOIN 
    Patients pt ON p.nhs_number = pt.nhs_number
JOIN 
    medications m ON p.medication_id = m.medication_id
JOIN 
    Diseases d ON p.disease_id = d.disease_id
JOIN 
    doctors doc ON p.doctor_id = doc.doctor_id
ORDER BY 
    pt.patient_name ASC, 
    pt.patient_prename ASC;

--Add a new customer to the database, including being registered with one of the doctors.
INSERT INTO Patients (
    nhs_number, 
    patient_name, 
    patient_prename, 
    patient_address, 
    DoB, 
    gender, 
    doctor_id
) VALUES (
    1059121114,             -- Replace with the new patient's NHS number
    'Walsh',                 -- Patient's last name
    'John',                -- Patient's first name
    '56 Fore Street',     -- Patient's address
    '1990-05-15',         -- Patient's date of birth (YYYY-MM-DD)
    'male',               -- Gender ('male', 'female', 'other')
    14                   -- Doctor ID (doctor the patient is registered with)
);

--Modify address details of an existing customer.
UPDATE Patients
SET 
    patient_address = '456 City Centre, Plymouth, PL1 1T, England'  -- New address
WHERE 
    nhs_number = 1059121755;                         -- Existing patient's NHS number

--Print a list of all patient names and addresses for patients registered to doctors based at one particular hospital 
-- that could be used for posting information mail to all of one hospital registered patients.
SELECT 
    pt.patient_name, 
    pt.patient_prename, 
    pt.patient_address
FROM 
    Patients pt
JOIN 
    doctors doc ON pt.doctor_id = doc.doctor_id
WHERE 
    doc.hospital_name = 'Derriford Hospital';  -- Replace with the hospital name

-- Print List All Doctors Based at Teaching Hospitals Accredited Between 2015–2024
SELECT 
    doc.doctor_id, 
    doc.doctor_name, 
    doc.doctor_prename, 
    doc.doctor_address, 
    doc.hospital_name
FROM 
    doctors doc
JOIN 
    hospitals hosp ON doc.hospital_name = hosp.hospital_name
WHERE 
    hosp.Type = 'Teaching' 
    AND hosp.year_of_accreditation BETWEEN 2015 AND 2024;

-- List all patients who may have a particular disease based on which medication they have been prescribed.
SELECT 
    pt.nhs_number, 
    pt.patient_name, 
    pt.patient_prename, 
    pt.patient_address, 
    d.disease_name, 
    m.api AS medication_name
FROM 
    Patients pt
JOIN 
    prescriptions p ON pt.nhs_number = p.nhs_number
JOIN 
    medications m ON p.medication_id = m.medication_id
JOIN 
    Diseases d ON p.disease_id = d.disease_id
WHERE 
    m.api = 'Amlodipine';  -- Replace with the specific medication's name

-- List All Doctors Who Specialize in a Particular Disease
SELECT 
    doc.doctor_id, 
    doc.doctor_name, 
    doc.doctor_prename, 
    doc.doctor_address, 
    doc.hospital_name, 
    d.disease_name
FROM 
    doctors doc
JOIN 
    Diseases d ON doc.doctor_id = d.doctor_id
WHERE 
    d.disease_name = 'Fibromyalgia';  -- Replace with the specific disease name

--List all Lab Results for All Patients Over the Age of 60
SELECT 
    lt.test_id, 
    lt.test_date, 
    lt.test_result, 
    pt.patient_name, 
    pt.patient_prename, 
    pt.DoB
FROM 
    labtests lt
JOIN 
    Patients pt ON lt.nhs_number = pt.nhs_number
WHERE 
    TIMESTAMPDIFF(YEAR, pt.DoB, CURDATE()) > 60;

--Print a List of All Appointments for a Given Patient
SELECT 
    ap.appointment_id, 
    ap.appointment_date, 
    ap.hospital_name, 
    doc.doctor_name, 
    doc.doctor_prename
FROM 
    appointments ap
LEFT JOIN 
    doctors doc ON ap.doctor_id = doc.doctor_id
WHERE 
    ap.nhs_number = 8957616841;  -- Replace with the patient's NHS number

--Print a list of all appointments for a given doctor.
SELECT 
    ap.appointment_id, 
    ap.appointment_date, 
    ap.hospital_name, 
    pt.patient_name, 
    pt.patient_prename
FROM 
    appointments ap
JOIN 
    Patients pt ON ap.nhs_number = pt.nhs_number
WHERE 
    ap.doctor_id = 30;  -- Replace with the doctor's ID

--Print All Prescriptions from a Particular Hospital Ordered by Medication Name
SELECT 
    m.api AS medication_name, 
    CONCAT(doc.doctor_prename, ' ', doc.doctor_name) AS doctor_name, 
    CONCAT(pt.patient_prename, ' ', pt.patient_name) AS patient_name, 
    doc.hospital_name
FROM 
    prescriptions p
JOIN 
    medications m ON p.medication_id = m.medication_id
JOIN 
    doctors doc ON p.doctor_id = doc.doctor_id
JOIN 
    Patients pt ON p.nhs_number = pt.nhs_number
WHERE 
    doc.hospital_name = 'Freeman Hospital'  -- Replace with the hospital name
ORDER BY 
    m.api ASC;

-- Print a List of All Lab Results from Hospitals Accredited Between 2013 & 2020
SELECT 
    lt.test_id, 
    lt.test_date, 
    lt.test_result, 
    pt.patient_name, 
    pt.patient_prename, 
    hosp.hospital_name
FROM 
    labtests lt
JOIN 
    Patients pt ON lt.nhs_number = pt.nhs_number
JOIN 
    hospitals hosp ON lt.hospital_name = hosp.hospital_name
WHERE 
    hosp.year_of_accreditation BETWEEN 2013 AND 2020;

-- Identify Which Doctor Has Made the Most Prescriptions
SELECT 
    doc.doctor_id, 
    CONCAT(doc.doctor_prename, ' ', doc.doctor_name) AS doctor_name, 
    COUNT(p.prescription_id) AS total_prescriptions
FROM 
    prescriptions p
JOIN 
    doctors doc ON p.doctor_id = doc.doctor_id
GROUP BY 
    doc.doctor_id
ORDER BY 
    total_prescriptions DESC
LIMIT 1;

-- Print a list of all doctors at the hospital with biggest size (number of beds).
SELECT 
    doc.doctor_id, 
    doc.doctor_name, 
    doc.doctor_prename, 
    doc.doctor_address, 
    doc.hospital_name
FROM 
    doctors doc
WHERE 
    doc.hospital_name = (
        SELECT 
            hospital_name
        FROM 
            hospitals
        ORDER BY 
            size_beds DESC
        LIMIT 1
    );

--Print list of all hospital names which were accredited prior to 2015 and do have Emergency Service facilities.
SELECT 
    hospital_name
FROM 
    hospitals
WHERE 
    year_of_accreditation < 2015 
    AND emergency_services = 'Yes';

--List of Patients Registered with Doctors Based at Hospitals with Fewer Than 400 Beds
SELECT 
    pt.nhs_number, 
    pt.patient_name, 
    pt.patient_prename, 
    pt.patient_address
FROM 
    Patients pt
JOIN 
    doctors doc ON pt.doctor_id = doc.doctor_id
JOIN 
    hospitals hosp ON doc.hospital_name = hosp.hospital_name
WHERE 
    hosp.size_beds < 400;




