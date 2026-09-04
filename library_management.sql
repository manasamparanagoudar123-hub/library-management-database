CREATE DATABASE library_management;

USE library_management;

-- Create Students table
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    email VARCHAR(100)
);

-- Create Books table
CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    book_name VARCHAR(100) NOT NULL,
    author VARCHAR(100),
    category VARCHAR(50),
    available BOOLEAN DEFAULT TRUE
);

-- Create Borrowing table
CREATE TABLE borrowing (
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Insert students
INSERT INTO students (student_name, department, email)
VALUES
('Manasa', 'CSE', 'manasa@gmail.com'),
('Kavya', 'CSE', 'kavya@gmail.com'),
('Priya', 'ISE', 'priya@gmail.com');

-- Insert books
INSERT INTO books (book_name, author, category)
VALUES
('Python Programming', 'Mark Lutz', 'Programming'),
('Database System Concepts', 'Abraham Silberschatz', 'Database'),
('HTML and CSS', 'Jon Duckett', 'Web Development'),
('Data Structures', 'Narasimha Karumanchi', 'DSA');

-- View all students
SELECT * FROM students;

-- View all books
SELECT * FROM books;

-- Search books by category
SELECT * FROM books
WHERE category = 'Programming';

-- Update book availability
UPDATE books
SET available = FALSE
WHERE book_id = 1;

-- View available books
SELECT * FROM books
WHERE available = TRUE;

-- Record a book borrowing
INSERT INTO borrowing (student_id, book_id, borrow_date)
VALUES (1, 1, CURDATE());

-- View borrowing details
SELECT
    borrowing.borrow_id,
    students.student_name,
    books.book_name,
    borrowing.borrow_date,
    borrowing.return_date
FROM borrowing
JOIN students
ON borrowing.student_id = students.student_id
JOIN books
ON borrowing.book_id = books.book_id;

-- Return a book
UPDATE borrowing
SET return_date = CURDATE()
WHERE borrow_id = 1;

-- Make the book available again
UPDATE books
SET available = TRUE
WHERE book_id = 1;

-- Delete a student
-- DELETE FROM students WHERE student_id = 3;
