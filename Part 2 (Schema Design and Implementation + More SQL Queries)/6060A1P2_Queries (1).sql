SELECT DISTINCT
    u.User_FN AS User_FirstName,
    u.User_LN AS User_LastName,
    u.Email AS User_Email,
    uc.User_FirstName AS Connection_FirstName,
    uc.User_LastName AS Connection_LastName,
    uc.Email AS Connection_Email
FROM 
    Users u
JOIN 
    Connections c ON u.URL = c.URL
JOIN 
    (
        SELECT 
            u2.User_FN AS User_FirstName,
            u2.User_LN AS User_LastName,
            u2.Email,
            c2.Connection_URL
        FROM 
            Users u2
        JOIN 
            Connections c2 ON u2.URL = c2.Connection_URL
    ) uc ON c.Connection_URL = uc.Connection_URL;
    
/*
Analyzing work experience by industry allows for the orginization for potential group people together and
offer people potential connections based off of industry.
*/
SELECT 
    u.User_FN AS User_FirstName,
    u.User_LN AS User_LastName,
    cw.Company_Title,
    cw.Job_Title,
    cw.Start_Date,
    cw.Industry
FROM 
    Users u
JOIN 
    Current_work cw ON u.URL = cw.URL
ORDER BY 
    User_LastName, User_FirstName, Start_Date;

/*
By looking at the locations of users who buy premium trends could be uncovered where certain locations are 
more likely to purchase premium memeberships. And if the reasoning behind these trends can be uncovered
more effective marketing could take place to increase sales on premium memberships.
*/
SELECT 
    u.User_FN AS User_FirstName,
    u.User_LN AS User_LastName,
    ul.City,
    ul.State,
    ul.Country
FROM 
    Users u
JOIN 
    Account a ON u.URL = a.URL
JOIN 
    User_Location ul ON u.Zip = ul.Zip
WHERE 
    a.Account_Type = 'Premium'
ORDER BY 
    User_LastName, User_FirstName;



