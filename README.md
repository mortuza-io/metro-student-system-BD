# Metro Student ID Verification & Ticket Management System

A SQL Server database project for managing student metro card verification, ticketing, trips, payments, passes, lost card reports, and fraud alerts.

## Features

- Student ID verification with institutions
- Metro card management
- Card top-up tracking
- Station and route management
- Trip history
- Student pass system
- Lost card reporting
- Fraud alert system
- Admin verification workflow

## Tables

1. Institutions
2. Students
3. Admins
4. VerificationRequests
5. MetroCards
6. CardTopUps
7. Stations
8. Routes
9. Trips
10. PassTypes
11. StudentPasses
12. LostCardReports
13. FraudAlerts

## How to Run

1. Open Microsoft SQL Server Management Studio.
2. Run `database/01_create_database.sql`.
3. Run `database/02_create_tables.sql`.
4. Run `database/03_insert_sample_data.sql`.
5. Run `database/04_queries.sql`.

## ER Diagram

The ER diagram source is available in:

```txt
er-diagram/dbdiagram.sql
````

## ⭐ Support

If you like this project:

- Star the repo
- Fork it
- Share it

💚 Built with passion for learning and real-world impact
