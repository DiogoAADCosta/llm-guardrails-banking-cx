-- schema_en.sql

-- Clients Table: Stores registration and sensitive information (Protected)
CREATE TABLE tbl_clients (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    cpf TEXT NOT NULL UNIQUE,          -- Formatted CPF or numbers only
    email TEXT NOT NULL UNIQUE,
    account TEXT NOT NULL,             -- Checking account number
    segment TEXT CHECK(segment IN ('Retail', 'Exclusive', 'Prime'))
);

-- Feedbacks Table: Stores only the interaction, without repeating sensitive data
CREATE TABLE tbl_feedbacks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    client_id INTEGER,
    comment_date TEXT NOT NULL,    -- YYYY-MM-DD format
    channel TEXT NOT NULL CHECK(channel IN ('App', 'Chat', 'Branch', 'Ombudsman')),
    product TEXT NOT NULL CHECK(product IN ('Pix', 'Credit Card', 'Loan', 'Customer Service')),
    rating INTEGER CHECK(rating BETWEEN 1 AND 5),
    feedback_text TEXT NOT NULL,     -- The free-text field where clients might write sensitive info (like their CPF again)
    FOREIGN KEY(client_id) REFERENCES tbl_clients(id)
);
