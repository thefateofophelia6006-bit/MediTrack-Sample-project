[README.md](https://github.com/user-attachments/files/34027906/README.md)
# MediTrack: Hospital Patient Management System

A MySQL database project for organising patient records, doctors, appointments, prescriptions and billing. It demonstrates relational database design and SQL reporting through a hospital-management example.

## Project overview

MediTrack connects five related tables to answer questions about appointments, prescribed medicines, consultation fees and billing. Patient and doctor details are stored separately and referenced by appointments, reducing repeated information.

This is an educational database project, not a production hospital application or a clinical decision-making tool.

## Tools and SQL skills

- **Database:** MySQL.
- **Schema design:** primary keys, foreign keys and related tables.
- **Data operations:** `CREATE DATABASE`, `CREATE TABLE`, `INSERT` and `SELECT`.
- **Queries:** filtering, sorting, joins, subqueries and `DISTINCT`.
- **Reporting:** `COUNT`, `SUM`, `AVG`, `MAX`, `GROUP BY` and `HAVING`.
- **Advanced SQL:** a window function for cumulative billing revenue.
- **Database objects:** indexes, a unique email index and reporting views.

## Database structure

| Table | Primary key | Purpose | Initial records |
| --- | --- | --- | ---: |
| `Patients` | `Patient_ID` | Patient details and contact information | 20 |
| `Doctors` | `Doctor_ID` | Specialization, consultation fee and experience | 15 |
| `Appointments` | `Appointment_ID` | Patient-doctor appointments, dates and status | 10 |
| `Prescriptions` | `Prescription_ID` | Medicines, dosage and duration per appointment | 13 |
| `Billing` | `Bill_ID` | Amount, payment method and payment status | 10 |

The record counts above refer to the initial inserts in the project report.

### Relationships

- `Appointments.Patient_ID` references `Patients.Patient_ID`.
- `Appointments.Doctor_ID` references `Doctors.Doctor_ID`.
- `Prescriptions.Appointment_ID` references `Appointments.Appointment_ID`.
- `Billing.Appointment_ID` references `Appointments.Appointment_ID`.

A patient or doctor can have multiple appointments. An appointment can have multiple prescription lines.

**Billing design note:** The report describes one bill per appointment, and the sample data follows that pattern. However, the supplied table definition does not make `Billing.Appointment_ID` unique, so the schema does not enforce a one-to-one relationship.

## What the queries cover

The report contains 26 SQL exercises, including:

- Finding appointments after a selected date and the most recent appointments.
- Finding doctors with the highest fees or no appointments.
- Listing medicines prescribed to a patient.
- Counting appointments and identifying appointments with multiple medicines.
- Comparing bills with the average billing amount.
- Summarising billing by patient, specialization and payment method.
- Calculating cumulative billing revenue by appointment date.
- Creating indexes and the `HighValueBills` and `RevenueSummary` views.

### Example: revenue by payment method

```sql
SELECT Payment_Method, SUM(Amount) AS Total_Revenue
FROM Billing
GROUP BY Payment_Method;
```

### Example: appointments with multiple medicines

```sql
SELECT Appointment_ID
FROM Prescriptions
GROUP BY Appointment_ID
HAVING COUNT(Prescription_ID) > 1;
```

### Example: cumulative billing revenue

```sql
SELECT
    a.Appointment_Date,
    SUM(b.Amount) OVER (
        ORDER BY a.Appointment_Date
    ) AS Cumulative_Revenue
FROM Appointments a
JOIN Billing b ON a.Appointment_ID = b.Appointment_ID;
```

This last query uses the report's sample data, which has one appointment per date. For multiple appointments on the same date, aggregate daily billing first if the intended output is one row per day.

## Results shown in the project report

The documented sample outputs show:

| Measure | Value |
| --- | ---: |
| Completed appointments | 10 |
| Total billed amount | 6,800.00 |
| Average bill | 680.00 |
| Credit Card billed amount | 3,500.00 |
| Cash billed amount | 1,200.00 |
| Debit Card billed amount | 850.00 |
| UPI billed amount | 1,250.00 |

Credit Card has the most transactions in the sample, with 4 payments. Oncology has the highest total billed amount among the listed specializations, at 1,000.00.

These are results documented in the Word report, not a new execution or a benchmark. Amounts are shown without a currency label because the schema does not define a currency.

## How to run

Use a MySQL installation with window-function support to run the full query set.

The project report lists these source files:

- `meditrack_schema.sql`: table definitions, sample data, indexes and views.
- `meditrack_queries.sql`: the report's questions-and-answers query set.

Make sure these SQL files are available before following the steps below. This README does not include them.

1. Open a MySQL client and connect to your local server.
2. Run `CREATE DATABASE MediTrack;` followed by `USE MediTrack;`. If the schema file already contains these statements, run them only once.

3. Create and populate the tables in this order: `Patients`, `Doctors`, `Appointments`, `Prescriptions`, then `Billing`.
4. Run the index and view statements after the base tables and sample records are created.
5. Select `MediTrack` and run the analysis queries.
6. Compare the initial record counts and query outputs with those in the report.

If working directly from the Word report, copy only SQL statements. Do not copy `mysql>` prompts, `Query OK` messages or output tables into the SQL editor. Use a fresh practice database to avoid overwriting existing work or encountering duplicate objects and primary keys.

## Scope and limitations

- The sample covers 10 appointments from 5 January to 14 January 2024; every appointment is marked `Completed` and every bill is marked `Paid`.
- The project is database-only. The report does not provide a web interface, authentication system or deployed application.
- General explanations of transactions and ACID appear in the report, but no transaction-handling implementation is demonstrated.
- Patient names, phone numbers, email addresses and prescription details appear in the source data. Confirm that all records are fictional or properly anonymised before publishing them in a public repository.

## Learning references

The project report lists:

- [W3Schools SQL](https://www.w3schools.com/sql/)
- [SQLBolt](https://sqlbolt.com/)
- [MySQL documentation](https://dev.mysql.com/doc/)
