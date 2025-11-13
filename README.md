Here’s a complete **README.md** file for your MySQL database project — covering all four tables (**Customers**, **Orders**, **Products**, and **OrderDetails**) with structure, objectives, and query descriptions 👇

---

# 🧾 SQL E-Commerce Database Project

## 📘 Overview

This project demonstrates a mini **E-Commerce Database System** built using **MySQL**.
It includes tables for managing **customers**, **orders**, **products**, and **order details** — along with practical SQL queries for CRUD operations and analytical insights using aggregate functions.

---

## 🧱 Database Structure

### 1️⃣ Customers Table

**Fields:**

* `CustomerID` (Primary Key)
* `Name`
* `Email`
* `Address`

**Queries to Perform:**

* Insert 5 sample customers
* Retrieve all customer details
* Update a customer's address
* Delete a customer using their `CustomerID`
* Display customers whose name is `'Alice'`

---

### 2️⃣ Orders Table

**Fields:**

* `OrderID` (Primary Key)
* `CustomerID` (Foreign Key → Customers.CustomerID)
* `OrderDate`
* `TotalAmount`

**Queries to Perform:**

* Insert 5 sample orders
* Retrieve all orders by a specific customer
* Update an order’s total amount
* Delete an order using `OrderID`
* Retrieve orders placed in the last 30 days
* Retrieve highest, lowest, and average order amount using aggregate functions

---

### 3️⃣ Products Table

**Fields:**

* `ProductID` (Primary Key)
* `ProductName`
* `Price`
* `Stock`

**Queries to Perform:**

* Insert 5 sample products
* Retrieve all products sorted by price (descending)
* Update a product’s price
* Delete a product if it’s out of stock
* Retrieve products priced between ₹500 and ₹2000
* Retrieve most expensive and cheapest product using `MAX()` and `MIN()`

---

### 4️⃣ OrderDetails Table

**Fields:**

* `OrderDetailID` (Primary Key)
* `OrderID` (Foreign Key → Orders.OrderID)
* `ProductID` (Foreign Key → Products.ProductID)
* `Quantity`
* `SubTotal`

**Queries to Perform:**

* Insert 5 sample order details
* Retrieve all order details for a specific order
* Calculate total revenue using `SUM()`
* Retrieve top 3 most ordered products
* Count how many times a product has been sold using `COUNT()`

---

## ⚙️ Relationships Between Tables

```
Customers (1) ───< Orders (M)
Orders (1) ───< OrderDetails (M)
Products (1) ───< OrderDetails (M)
```

This structure forms a relational model:

* One customer can place many orders.
* Each order can have multiple products.
* Each product can appear in multiple order details.

---

## 💻 How to Use

1. **Create Database**

   ```sql
   CREATE DATABASE ecommerce_db;
   USE ecommerce_db;
   ```

2. **Create Tables**

   * Run the SQL scripts for **Customers**, **Orders**, **Products**, and **OrderDetails** (in that order).

3. **Insert Sample Data**

   * Use the provided `INSERT INTO` statements to add mock data.

4. **Execute Queries**

   * Run the listed `SELECT`, `UPDATE`, `DELETE`, and aggregate queries to explore database functionalities.

---

## 📊 Sample Analysis Queries

* Total number of customers:

  ```sql
  SELECT COUNT(*) FROM Customers;
  ```
* Total revenue generated:

  ```sql
  SELECT SUM(SubTotal) AS TotalRevenue FROM OrderDetails;
  ```
* Most popular product:

  ```sql
  SELECT ProductID, SUM(Quantity) AS TotalSold 
  FROM OrderDetails 
  GROUP BY ProductID 
  ORDER BY TotalSold DESC 
  LIMIT 1;
  ```

---

## 🧩 Project Highlights

✅ Demonstrates CRUD operations (Create, Read, Update, Delete)
✅ Uses **foreign keys** for relational integrity
✅ Includes **aggregate functions** (`SUM`, `COUNT`, `MAX`, `MIN`, `AVG`)
✅ Perfect for **SQL beginners** and **database mini-projects**

---

## 📁 Files Included

* `customers.sql` – Table and queries for Customers
* `orders.sql` – Table and queries for Orders
* `products.sql` – Table and queries for Products
* `orderdetails.sql` – Table and queries for Order Details
* `README.md` – Project documentation

---

## 🧠 Author

**Created by SkillBuddy**
*A simple and practical SQL mini-project for learning relational database concepts.*

---

Would you like me to create this README as a downloadable **`README.md` file** (for GitHub or project submission)?
