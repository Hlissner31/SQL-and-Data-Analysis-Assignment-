CREATE TABLE Users (
    URL VARCHAR(255) PRIMARY KEY,
    User_FN VARCHAR(100),
    User_LN VARCHAR(100),
    DOB DATE,
    Phone VARCHAR(20),
    Email VARCHAR(255),
    Zip VARCHAR(10),
    FOREIGN KEY (Zip) REFERENCES User_Location(Zip)
);
CREATE TABLE User_Location (
    Zip VARCHAR(10) PRIMARY KEY,
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100)
);
CREATE TABLE Current_work (
    URL VARCHAR(255) PRIMARY KEY,
    Company_Title VARCHAR(255),
    Job_Title VARCHAR(255),
    Start_Date DATE,
    Industry VARCHAR(255)
);
CREATE TABLE Previous_Work (
    PWorkID INT PRIMARY KEY,
    PCompany_Name VARCHAR(255),
    PJob_Title VARCHAR(255),
    PEnd_Date DATE,
    Pindustry VARCHAR(255),
    URL VARCHAR(255),
    FOREIGN KEY (URL) REFERENCES Users(URL)
);
CREATE TABLE Connections (
    ConnectionID INT PRIMARY KEY,
    Connection_URL VARCHAR(255),
    Connection_Date DATE,
    Connection_Mutuals INT,
    URL VARCHAR(255),
    FOREIGN KEY (URL) REFERENCES Users(URL)
);
CREATE TABLE Education (
    EducationID INT PRIMARY KEY,
    Highschool VARCHAR(255),
    University VARCHAR(255),
    Graduate_University VARCHAR(255),
    URL VARCHAR(255),
    FOREIGN KEY (URL) REFERENCES Users(URL)
);
CREATE TABLE User_Skills (
    Skill_ID INT,
    URL VARCHAR(255),
    FOREIGN KEY (Skill_ID) REFERENCES Skills(Skill_ID),
    FOREIGN KEY (URL) REFERENCES Users(URL)
);
CREATE TABLE Skills (
    Skill_ID INT PRIMARY KEY,
    Skill_Name VARCHAR(255)
);
CREATE TABLE Account (
    URL VARCHAR(255) PRIMARY KEY,
    Account_Type VARCHAR(100),
    Account_Creation_Date DATE,
    Premium_EXP_Date DATE
);
CREATE TABLE Monthly_Charge (
    ChargeID INT PRIMARY KEY,
    Month_Year DATE,
    Monthly_Charge DECIMAL(10, 2),
    URL VARCHAR(255),
    FOREIGN KEY (URL) REFERENCES Account(URL)
);

