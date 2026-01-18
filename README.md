# Little Lemon Booking System

This project implements a booking system for the Little Lemon restaurant using:
- MySQL
- Python (MySQL Connector)
- Tableau

## Project Contents
- ER Diagram and Star Schema
- MySQL database schema and stored procedures
- Python client to interact with the database
- Tableau dashboards for data analysis

## Database
The database was created using MySQL Workbench and deployed using Forward Engineering.

### Stored Procedures
- GetMaxQuantity()
- ManageBooking()
- AddBooking()
- UpdateBooking()
- CancelBooking()

## Python
The Python client connects to the MySQL database and calls stored procedures using mysql.connector.

## Tableau
The Tableau workbook contains sales and booking analysis dashboards.

## How to Run
1. Create the database using `schema.sql`
2. Create procedures using `procedures.sql`
3. Run `booking_client.py`
4. Open Tableau workbook `LittleLemon.twbx`
