-- Create a new database in mysql
CREATE DATABASE hospital_database;

-- Use the new created database.
USE hospital_database;

-- To create a table for hospitals
CREATE TABLE 'hospitals' (
  'hospitalID' int NOT NULL ,                        -- Unique identifier for each hospital
  'hospital_name' varchar(255) NOT NULL,                      -- Name of the hospital
  'address' TEXT NOT NULL,                                    -- Address of the hospital
  'size_beds' int NOT NULL,                                   -- Number of beds in the hospital
  'Type' enum('General', 'Teaching', 'Specialist', 'Children''s', 'Clinic') NOT NULL,  -- Type of the hospital 
  'emergency_services enum'('Yes', 'No') NOT NULL,             -- Whether the hospital provides emergency services
  'year_of_accreditation' year NOT NULL,                      -- Year the hospital was accredited
  PRIMARY KEY (hospital_name)                                  -- Set hospital name as the primary key
);

-- To create a table for doctors.
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,           -- Unique identifier for each doctor
    doctor_name VARCHAR(255) NOT NULL,                   -- Surname of the doctor
    doctor_prename VARCHAR(255) NOT NULL,                -- First name of the doctor
    doctor_address TEXT NOT NULL,                        -- Address of the doctor
    hospital_name VARCHAR(255) NOT NULL,                 -- Foreign key referencing hospital_name from hospitals table
    disease_id INT,                                     -- Disease ID
    DoB DATE NOT NULL,                                  -- Date of birth of the doctor
    FOREIGN KEY (hospital_name) REFERENCES hospitals(hospital_name)  -- Foreign key referencing hospital_name in hospitals table   
);

-- To create a table for Patients.
CREATE TABLE Patients (
    nhs_number INT PRIMARY KEY,  -- Unique identifier for each patient
    patient_name VARCHAR(255) NOT NULL,          -- Name of the patient
    patient_prename VARCHAR(255) NOT NULL,       -- Prename of the patient
    patient_address TEXT NOT NULL,               -- Address of the patient
    DoB DATE NOT NULL,                          -- Date of birth (format: YYYY-MM-DD)
    gender ENUM('male', 'female', 'other') NOT NULL,  -- Gender of the patient
    doctor_id INT NOT NULL,                     -- Foreign key linking to a doctor
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id) -- Foreign key referencing doctor_id in doctors table.
);

-- To create a table for medications.
CREATE TABLE medications (
    medication_id INT PRIMARY KEY,    -- Unique identifier for the medicaition
    api VARCHAR(255),                --  active pharmaceutical ingredient of the medicine
    dosage INT,                      -- dosage of the drug
    dosage_unit VARCHAR(10),         -- dosage unit of the drug in mg or gm etc
    dosage_form VARCHAR(50),         --  dosage form of the drug given like tablets,capsule, suspension etc
    route VARCHAR(50),               -- route by which drug is given like oral etc
    manufacturer VARCHAR(255)        -- manufacturer of the drug.
);

-- To create a table for Diseases.
CREATE TABLE Diseases (
    disease_id INT PRIMARY KEY,         -- Unique identifier for each disease
    disease_name VARCHAR(255) NOT NULL,  -- Name of the disease
    medication_id INT,                  -- Foreign key linking to the Medications table
    doctor_id INT,                      -- Foreign key linking to the Doctors table
    FOREIGN KEY (medication_id) REFERENCES medications(medication_id), -- Foreign key referencing medication_id in medications table
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id) -- Foreign key referencing doctor_id in doctors table
);

-- To create a table for lab tests.
CREATE TABLE labtests (
    test_id INT PRIMARY KEY,                 -- Unique identifier for each lab test
    nhs_number BIGINT NOT NULL,              -- Foreign key referencing Patients table
    doctor_id INT,                           -- Foreign key referencing Doctors table
    hospital_name VARCHAR(255) NOT NULL,     -- Name of the hospital where the test was conducted
    test_date DATETIME NOT NULL,             -- Date and time when the test was conducted
    test_result TEXT,                        -- Result of the lab test
    FOREIGN KEY (nhs_number) REFERENCES Patients(nhs_number), -- Foreign key referencing nhs_number in Patients table
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),   --Foreign key referencing doctor_id in doctors table
    FOREIGN KEY (hospital_name) REFERENCES hospitals(hospital_name) -- Foreign key referencing hospital_name in hospitals table  
);

-- To create a table for prescriptions.
CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY,                -- Unique identifier for each prescription
    nhs_number BIGINT NOT NULL,                     -- Patient's NHS number
    doctor_id INT NOT NULL,                          -- Foreign key linking to a doctor
    medication_id INT NOT NULL,                      -- Foreign key linking to a medication
    disease_id INT NOT NULL,                         -- Disease ID 
    prescription_date DATE NOT NULL,                -- Date the prescription was made
    FOREIGN KEY (nhs_number) REFERENCES Patients(nhs_number),  -- Linking to Patient's NHS number
    FOREIGN KEY (medication_id) REFERENCES medications(medication_id), -- Linking to medications table
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)         -- Linking to doctors table
);

-- To create a table for appointments.
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,   -- Unique identifier for each appointment
    hospital_name VARCHAR(255) NOT NULL,            -- Foreign key: Name of the hospital
    nhs_number BIGINT NOT NULL,                     -- Foreign key linking to a patient
    doctor_id INT,                                  -- Foreign key referencing Doctors table (nullable)
    appointment_date DATETIME NOT NULL,             -- Scheduled date and time of the appointment
    FOREIGN KEY (hospital_name) REFERENCES hospitals(hospital_name),-- Foreign key referencing hospital_name in hospitals table  
    FOREIGN KEY (nhs_number) REFERENCES Patients(nhs_number),  -- Foreign key referencing nhs_number in Patients table
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)    --Foreign key referencing doctor_id in doctors table
);
