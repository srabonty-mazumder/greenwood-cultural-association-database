# Greenwood Cultural Association – Database System

## 📌 Project Overview
This project was developed as part of the Data Management course at Haaga-Helia University of Applied Sciences.

The system is a prototype database solution for the Greenwood Cultural Association, designed to manage:

- Cultural events
- Artists
- Venues
- Ticket bookings
- Buyers
- Ticket sales and refunds

The system supports online booking functionality without online payment, following specific business rules.

---

## 🏗 Database Design

The database includes the following core entities:

- Venue
- Event
- Artist
- Event_Artist (junction table)
- Buyer
- Booking

The design follows:
- Relational modelling principles
- BCNF normalization
- Proper primary and foreign key constraints
- No overbooking logic (based on venue capacity)

---

## 📊 Features Implemented

The database supports:

1. Booking tickets
2. Modifying ticket quantity
3. Marking bookings as sold
4. Cancelling bookings
5. Automatic removal of expired bookings (older than 3 days)
6. Event cancellation
7. Refund processing
8. Revenue calculation
9. Ticket availability tracking

---

## 🛠 Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- Relational Database Design
- ER Modeling
- Index Optimization

---

## 📂 Project Structure

- `/docs` → ER diagram, relational schema, database diagram
- `/sql` → SQL scripts (creation, indexing, test data, transactions)

---

## 🧠 Learning Outcomes

Through this project, I strengthened my skills in:

- Conceptual data modelling
- BCNF normalization
- SQL schema design
- Index optimization
- Query writing and testing
- Business rule implementation in databases

---

## 🚀 How to Run the Project

1. Execute `01_create_database.sql`
2. Execute `02_create_indexes.sql`
3. Execute `03_insert_test_data.sql`
4. Execute `04_test_transactions.sql`

All scripts are designed for Microsoft SQL Server.
