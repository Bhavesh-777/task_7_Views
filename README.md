# task_7_Views
This task focuses on creating and using SQL Views in a Library Management System. Views are virtual tables that simplify complex queries, enhance security, and provide reusable logic.

🧠 What is a View?
A view is a virtual table based on a SQL query. It stores no data itself, but dynamically pulls data when queried.

✅ Why Use Views?
To simplify complex joins and calculations
To limit data exposure (e.g., hide sensitive columns)
For reusable business logic (like aggregations, filters)
To improve code readability and reusability

🧾 Rules & Best Practices When Using Views:
✅ Views must be created using a valid SELECT statement.
✅ You can JOIN multiple tables inside a view.
✅ You can use CASE, GROUP BY, HAVING, and subqueries.

⚠️ A view cannot use ORDER BY unless with TOP/LIMIT.
⚠️ Views cannot accept parameters.
⚠️ Update via view works only on simple views (1 table, no groupings).
❌ Views don’t store data — queries run live every time.

✅ Remove views using DROP VIEW view_name;.

📂 Views Created in This Task
1) ActiveLoans – Shows books currently on loan (not yet returned)
2) BookAvailability – Labels books as Available / Low Stock / Out of Stock
3) MemberLoanHistory – Shows books that have been returned
4) StaffLoanCount – Shows how many books each staff member issued
5) CategoryWiseBooks – Shows how many books are in each category

-- Use view
SELECT * FROM ViewName;

-- Drop view
DROP VIEW ViewName;


✍️ Created By
Bhavesh Rathod – Aspiring Data Analyst | Power BI & SQL Enthusiast

