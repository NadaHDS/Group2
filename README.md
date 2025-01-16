# Hospital Database Project

[[_TOC_]]

## Overview
This project involved the creation of a hospital database for managing information about hospitals, doctors, patients, medications, prescriptions, diseases, appointments and lab results. The database was developed by our team using both MySQL and MS Access.
## Repository Contents
- **SQL Scripts/**: Contains all SQL scripts for creating the database, inserting data, and querying.
  - `hospital_database_backup.sql`: Script to create the hospital database.
  - `Code_tables_hospital_database.sql`: Script that creates all the tables and populates them with data, including random data generated for doctors, patients, prescriptions, etc.
  - `querycode_hospital_database.sql`: Script that contains all SQL queries.

- **MS Access/**: Includes ‘.accdb’ file, with the database being created in Microsoft Access.

- **ERD Plan/**: Planning Document - Entity Relationship Diagram (ERD).
  
- **Team Portfolio/**: Contains information on teamwork, including:
  - Meeting agendas and minutes.
  - Action plan with milestones.

- **GitHub Pages/**: File for a project page hosted on GitHub Pages.
## Features
### Database Structure
The database consists of the following tables:
1. **hospitals**: Stores information about 38 hospitals, including name, address, size (number of beds), type, and accreditation status.
2. **doctors**: Holds details of 100 doctors, including the names of the hospitals they belong to.
3. **Patients**: Maintains patient information where each patient is assigned a specific doctor (total of 600 patients).
4. **medications**: Contains a list of medications that can be prescribed for patients.
5. **Diseases**: Contains the names of diseases along with their associated medications and the specialised doctors.
6. **Labtests**: Stores the lab results for individual patients, with each lab test being requested by a specific doctor.
7. **prescriptions**: Stores 500 prescriptions that are associated with doctors, patients, medications and prescription dates.
8. **appointments**: Records information about appointments scheduled between patients and doctors.
### Key SQL Queries
The database can support the following functions through SQL queries:
- List all doctors based at a specific hospital.
- List all prescriptions for a specific patient, ordered by the prescription date.
- List all prescriptions written by a specific doctor.
- Generate a table of all prescriptions ordered by patient name.
- Add a new customer to the database and register them with a doctor.
- Modify the address details of an existing customer
- List all patient names and addresses for a specific hospital.
- List all doctors who specialise in a particular disease
- List all lab results for all patients over 60 years old.
- List all appointments for a specific patient/doctor.
## GitHub Pages
The GitHub webpage provides an overview of the project, including a description of relevant features and usage. Visit the page [here](https://nadahds.github.io/Group2/).


