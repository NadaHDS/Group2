# Hospital Database Project
## Overview
This project involved the creation of a hospital database for managing information about hospitals, doctors, patients, medications, prescriptions, diseases, appointments and lab results. The database was developed by our team using both MySQL and MS Access.
## Repository Contents
- **MySQL Platform/**: Contains all SQL scripts for creating the database, inserting data, and querying.
  - `hospital_database_backup.sql`: Script to create the hospital database.
  - `Code_tables_hospital_database.sql`: Script that creates all the tables and populates them with data, including random data generated for doctors, patients, prescriptions, etc.
  - `querycode_hospital_database.sql`: Script that contains all SQL queries.

- **MS Access Platform/**: Includes all tables and '.accdb' files, with the database created in Microsoft Access.

- **Entity Relationship Diagram/**: Planning documents, including two versions of the ERD.
  
- **Team Portfolio/**: Contains information on teamwork, including:
  - Meeting agendas and minutes.
  - Action plan with milestones.

- **README.md**: This file summarises our project and the key components.
  
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
### Entity Relationship Diagram (ERD)

![Entity Relationship Diagram](Entity%20Relationship%20Diagram/Hospital%20DataBase_Entity%20Relationship%20Diagram.png)
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
## How to Use the Files
1. Use the following command to clone the repository to your local machine:
```bash
git clone https://github.com/NadaHDS/Group2.git
```
2. Import the provided .sql file into your MySQL environment using:
```bash
mysql -u [username] -p < hospital_database_backup.sql
```
3. Open the .accdb file in Microsoft Access to explore the database.
4. Run the SQL scripts to interact with and analyse the dataset.
## Team members
List of contributors:
1. Chetak Chahal
2. Dhia Dali
3. Nick Aveyard
4. Jiaqi Li
5. Nada Bin Sebayel

This system was collaboratively developed by our team through regular meetings and coordinated version control on GitHub. Each member contributed to different aspects of the project, such as database design, table creation, query development and documentation/ webpage production, etc.
## Acknowledgements
This project was developed under Group2 of the 'Computational Skills for Health and Life Sciences' module as part of the MSc Health Data Science programme at the University of Exeter. With special thanks to the module convenor, Professor Neil Vaughan, for his guidance and support.
