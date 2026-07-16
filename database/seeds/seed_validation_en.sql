-- seed_validation_en.sql

INSERT INTO tbl_clients (id, name, cpf, email, account, segment) VALUES 
(1, 'Mariana Silva Souza', '123.456.789-00', 'mari.silva99@email.com', '100234-5', 'Prime'),
(2, 'Roberto Carlos Santos', '987.654.321-11', 'roberto.carlos@email.com', '55432-1', 'Retail'),
(3, 'Ana Paula Ferreira', '456.123.789-22', 'anapaula.exclusive@email.com', '99887-2', 'Exclusive'),
(4, 'Carlos Eduardo Souza', '111.222.333-44', 'carlinhos_edu@email.com', '12345-6', 'Retail'),
(5, 'Beatriz de Oliveira', '555.666.777-88', 'bia.oliveira@email.com', '88776-5', 'Prime');

INSERT INTO tbl_feedbacks (id, client_id, comment_date, channel, product, rating, feedback_text) VALUES 
-- ID 1 (With sensitive data): Contains temporary password and account details
(1, 1, '2026-07-10', 'App', 'Pix', 1, 'The app glitched when I tried to transfer. A message popped up saying my temporary password 10203099 was incorrect. My account is branch 3421 account 100234-5. I need to make this Pix transfer today!'),

-- ID 2 (With sensitive data): Contains email and full credit card number
(2, 2, '2026-07-12', 'Chat', 'Credit Card', 1, 'My card ending in 4321 was cloned, full number 4532 8876 1234 4321. Purchases of $900 were made using my email roberto.carlos@email.com and I demand a chargeback on this amount right away.'),

-- ID 3 (CLEAN AND COMPLETE): Positive feedback regarding scheduling a manager
(3, 3, '2026-07-13', 'App', 'Customer Service', 5, 'Loved the new manager scheduling feature on the app. Exclusive customer service is flawless, extremely fast.'),

-- ID 4 (With sensitive data AND Vague/Incomplete): Contains contact number, but the feedback text is vague ("Did not work")
(4, 4, '2026-07-13', 'Branch', 'Loan', 1, 'The manager asked for my contact number (51) 99999-8888 but it did not work.'), 
-- ID 4 Test: The AI must sanitize the phone number but must NOT hallucinate or invent the reason why it did not work.

-- ID 5 (Missing Fields): Product is blank and Rating is NULL
(5, 5, '2026-07-14', 'Ombudsman', '', NULL, 'I tried to make an urgent, high-value Pix transfer ($15,000) and the transaction was blocked due to suspected fraud.');
-- ID 5 Test: The AI must point out that the product is missing and the satisfaction rating is null for this entry.
