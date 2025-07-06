USE LIBRARYDB;

-- 1) View for Active Loans (Books not returned yet)

CREATE VIEW ActiveLoans AS
SELECT 
    L.LoanID,
    M.FullName AS MemberName,
    B.Title AS BookTitle,
    L.LoanDate,
    L.DueDate
FROM Loans L
JOIN Members M ON L.MemberID = M.MemberID
JOIN Books B ON L.BookID = B.BookID
WHERE L.ReturnDate IS NULL;

-- 2) Book Availability Summary

CREATE VIEW BOOKAVAILABILITY AS 
SELECT TITLE, QUANTITYAVAILABLE,
CASE WHEN QUANTITYAVAILABLE > 5 THEN 'AVAILABLE'
     WHEN QUANTITYAVAILABLE BETWEEN 1 AND 5 THEN 'LOW STOCK'
     ELSE 'NO STOCK'
END AS STATUS 
FROM BOOKS;     

SELECT * FROM BOOKAVAILABILITY;

-- 3) Member Loan History
-- A) full loan history (returned + pending)

CREATE VIEW MemberLoanHistory AS
SELECT 
    M.MemberID,
    M.FullName,
    B.Title,
    L.LoanDate,
    L.ReturnDate
FROM Members M
JOIN Loans L ON M.MemberID = L.MemberID
JOIN Books B ON L.BookID = B.BookID;

-- B) Shows only completed loan records (book has been returned)

CREATE VIEW MemberLoanHistory AS
SELECT 
    M.MemberID,
    M.FullName,
    B.Title,
    L.LoanDate,
    L.ReturnDate
FROM Members M
JOIN Loans L ON M.MemberID = L.MemberID
JOIN Books B ON L.BookID = B.BookID
WHERE L.ReturnDate IS NOT NULL;

-- 4) Staff Performance Summary

CREATE VIEW StaffLoanCount AS
SELECT 
    S.StaffID,
    S.StaffName,
    COUNT(L.LoanID) AS TotalLoansHandled
FROM Staff S
LEFT JOIN Loans L ON S.StaffID = L.StaffID
GROUP BY S.StaffID, S.StaffName;

 SELECT * FROM StaffLoanCount;
 
 -- 5) Category-wise Book Count
 
 CREATE VIEW CategoryWiseBooks AS
SELECT 
    C.CategoryName,
    COUNT(B.BookID) AS BookCount
FROM Categories C
JOIN Books B ON C.CategoryID = B.CategoryID
GROUP BY C.CategoryName;

 SELECT * FROM CategoryWiseBooks;
 
