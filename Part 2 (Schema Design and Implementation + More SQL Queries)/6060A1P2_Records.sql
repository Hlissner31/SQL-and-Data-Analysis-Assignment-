INSERT INTO Users (URL, User_FN, User_LN, DOB, Phone, Email, Zip) 
VALUES 
('user1_url', 'John', 'Doe', '1990-05-15', '123-456-7890', 'john@example.com', '12345'),
('user2_url', 'Jane', 'Smith', '1985-10-20', '987-654-3210', 'jane@example.com', '54321'),
('user3_url', 'Michael', 'Johnson', '1988-03-25', '111-222-3333', 'michael@example.com', '67890'),
('user4_url', 'Emily', 'Brown', '1995-07-12', '444-555-6666', 'emily@example.com', '45678'),
('user5_url', 'David', 'Taylor', '1992-11-30', '777-888-9999', 'david@example.com', '98765');

INSERT INTO User_Location (Zip, City, State, Country) 
VALUES 
('12345', 'New York', 'NY', 'USA'),
('54321', 'Los Angeles', 'CA', 'USA'),
('67890', 'Chicago', 'IL', 'USA'),
('45678', 'Houston', 'TX', 'USA'),
('98765', 'Miami', 'FL', 'USA');

INSERT INTO Current_work (URL, Company_Title, Job_Title, Start_Date, Industry) 
VALUES 
('user1_url', 'ABC Corp', 'Software Engineer', '2020-01-01', 'Technology'),
('user2_url', 'XYZ Inc', 'Marketing Manager', '2018-05-15', 'Marketing'),
('user3_url', '123 Company', 'Financial Analyst', '2019-08-20', 'Finance'),
('user4_url', 'Acme Corporation', 'HR Manager', '2017-03-10', 'Human Resources'),
('user5_url', 'Tech Solutions', 'Data Scientist', '2021-02-28', 'Technology');

INSERT INTO Previous_Work (PWorkID, PCompany_Name, PJob_Title, PEnd_Date, Pindustry, URL) 
VALUES 
(1, 'XYZ Corp', 'Software Developer', '2019-12-31', 'Technology', 'user1_url'),
(2, '123 Marketing', 'Sales Representative', '2018-03-15', 'Marketing', 'user2_url'),
(3, 'Finance Solutions', 'Accountant', '2020-06-30', 'Finance', 'user3_url'),
(4, 'HR Experts', 'Recruiter', '2018-09-25', 'Human Resources', 'user4_url'),
(5, 'Data Analytics Inc', 'Data Analyst', '2021-01-15', 'Technology', 'user5_url');

INSERT INTO Connections (ConnectionID, Connection_URL, Connection_Date, Connection_Mutuals, URL) 
VALUES 
(1, 'user2_url', '2021-03-01', 10, 'user1_url'),
(2, 'user3_url', '2020-12-15', 15, 'user2_url'),
(3, 'user4_url', '2019-07-20', 5, 'user3_url'),
(4, 'user5_url', '2021-02-10', 8, 'user4_url'),
(5, 'user1_url', '2021-01-05', 12, 'user5_url'),
(6, 'user3_url', '2022-01-10', 7, 'user1_url'),
(7, 'user4_url', '2022-01-12', 3, 'user2_url'),
(8, 'user5_url', '2022-01-15', 6, 'user3_url'),
(9, 'user1_url', '2022-01-18', 4, 'user4_url'),
(10, 'user2_url', '2022-01-20', 8, 'user5_url');

INSERT INTO Education (EducationID, Highschool, University, Graduate_University, URL) 
VALUES 
(1, 'High School A', 'University X', 'Graduate School M', 'user1_url'),
(2, 'High School B', 'University Y', 'Graduate School N', 'user2_url'),
(3, 'High School C', 'University Z', 'Graduate School O', 'user3_url'),
(4, 'High School D', 'University W', 'Graduate School P', 'user4_url'),
(5, 'High School E', 'University V', 'Graduate School Q', 'user5_url');

INSERT INTO Skills (Skill_ID, Skill_Name) 
VALUES 
(1, 'Programming'),
(2, 'Marketing'),
(3, 'Finance'),
(4, 'Human Resources'),
(5, 'Data Analysis');

INSERT INTO Account (URL, Account_Type, Account_Creation_Date, Premium_EXP_Date) 
VALUES 
('user1_url', 'Free', '2020-01-01', '2022-01-01'),
('user2_url', 'Premium', '2018-05-15', '2023-05-15'),
('user3_url', 'Free', '2019-08-20', '2021-08-20'),
('user4_url', 'Premium', '2017-03-10', '2022-03-10'),
('user5_url', 'Free', '2021-02-28', '2023-02-28');

INSERT INTO Monthly_Charge (ChargeID, Month_Year, Monthly_Charge, URL) 
VALUES 
(1, '2022-01-01', 0.00, 'user1_url'),
(2, '2022-01-01', 15.00, 'user2_url'),
(3, '2022-01-01', 0.00, 'user3_url'),
(4, '2022-01-01', 15.00, 'user4_url'),
(5, '2022-01-01', 0.00, 'user5_url');
