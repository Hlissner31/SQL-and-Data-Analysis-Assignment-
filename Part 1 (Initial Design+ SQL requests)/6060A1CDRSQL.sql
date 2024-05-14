/*
# Data Request 8
Question
Find customer emails and the associated order dates

Business Justification
By obtaining a list of customer emails and their order dates, Basket Craft can effectively target these customers 
with personalized emails, promotions, or follow-up communication to enhance customer engagement and satisfaction.
*/
# 8.0 (3 points)
/*
INNER JOIN (JOIN)
Basket Craft wants to send a targeted email to customers who have placed an order.
Create a list of customer emails and the dates they placed an order.
*/
SELECT u.email AS customer_email, o.created_at AS order_date
FROM orders o
INNER JOIN users u ON o.user_id = u.user_id;


/*
# Data Request 9
Question
find unique user id's then list the first and last name followed by the total amount of orders by that individual.

Business Justification
A manager could use this data to discover who the top customers are and take greater care
to appease them and or on the other end focus on those who are not frequent customers and look for trends to
get them to become more frequent customers. 

Generate a report showing the number of orders placed by each customer.
This will help us identify our most active customers for targeted marketing efforts.
*/
select u.user_id, u.first_name, u.last_name, sum(o.order_id) as Total_Orders
from users u
join orders o
	on u.user_id = o.user_id
group by u.user_id;



/*
# Data Request 10
Question
Display user Id along with where the user is find the website (utm_source), what utm_campaign was envolved,
and what device time was used in the connection.

Business Justification
Understanding where user traffic is coming from allows for business leaders to optimize their marketing efforts
as well as improve user experiences.
*/
/*
Top Traffic Sources
From: Kara (CEO)
Subject: Site Traffic Breakdown
Date: April 12, 2021
We've been in business for nearly a month and have started to make sales. 
Could you assist me in understanding the primary sources of our website traffic up until yesterday (April 12, 2021)?
Business Question: A manager could use this information to better identify who their buyers are as well as where the buyers
are finding the website and wether they are on mobile or desktop. Which is relevant to the opimization of the website.
for instance if more desktop visits end in a purchase maybe the mobile website needs to be improved.
Expected Output: The complete traffic sources and the users associated with that traffic
*/
select user_id, utm_source, utm_campaign, device_type from sessions;
SELECT utm_source, utm_campaign, SUM(1) AS total 
FROM sessions
GROUP BY utm_source, utm_campaign;

/*
Insight: The data contains a large amount of null values but also, the clear major source of web traffic
is from google and nonbrand campaigns. this is followed by brand google traffic.
Recommendation: Based on the output, facebook is clearly not worth investing into as the current traffic
generated from it is very low. It would be recommened to focus on google and focus on nonbrand campaigns
as those two sources are bringing in the most web traffic.
*/



/*
# Data Request 11
Question
Find the rate to which users visiting the website make a purchase

Business Justification
Analyzing the conversation rates allows for evaluating the effectiveness of marketing efforts and optimizing
advertising strategies. The conversion rate could be used in something such as calculating the ROI of add campaigns.

*/
/*
Traffic Source Conversion Rates
From: Robert (Marketing Director)
Subject: Google Conversion Rate
Date: April 14, 2021
It appears that google nonbrand is the primary source of our website traffic,  but we need to assess whether these sessions are 
resulting in actual sales. To do this, please calculate the Conversion Rate (CVR) from sessions to orders. Our target minimum CVR 
is 4% to ensure our advertising expenses are justified. If our CVR falls below this threshold, we will consider reducing our 
advertising bids. Conversely, if the CVR exceeds 4%, we can consider increasing our bids to generate more traffic and potential sales.
Business Question: The question is to evaluate the effectivness of specifically google nonbrand campaigns.
Expected Output: a simple percentage that stand for how much traffic results in a sale.
*/
SELECT (COUNT(o.order_id) / COUNT(DISTINCT s.website_session_id)) * 100 AS conversion_rate
FROM sessions s
LEFT JOIN orders o 
	ON s.website_session_id = o.website_session_id;
#WHERE s.utm_source = 'google' and s.utm_campaign = 'nonbrand';

/*
Insight: 6.8334% is our conversion rate which is above our minimum CVR.
Recommendation: Go forward with increasing bids in an attempt to increase web traffic and sales as a result.
Prediction: Given the actual conversion rate is almost 3% higher than the cut off point, it would be expected that
an increase in advertising bids should lead to more web traffic which should lead to more sales.
*/

/*
# Data Request 12
Question
Find the conversion rate of web traffic to sale seperated by device type.

Business Justification
By seperating out the device types all the previous justification remains true but on top of that we gain
insight into if one device type is out preforming the other.
*/
/*
Traffic Source Bid Optimization
From: Robert (Marketing Director)
Subject: gsearch device-level performance
Date: May 11, 2021
While testing our website on my mobile device, I noticed that the user experience was suboptimal. 
Could you kindly retrieve the Conversion Rates (CVR) from sessions to orders categorized by device type? 
If we find that desktop performance surpasses mobile performance, we may consider increasing our bids for desktop to generate more traffic.
Business Question: What are the different conversion rates for all device types.
Expected Output: A percentage for desktop users and a percentage for mobile users.
*/
SELECT s.device_type, (COUNT(o.order_id) / COUNT(DISTINCT s.website_session_id)) * 100 AS conversion_rate
FROM sessions s
LEFT JOIN orders o 
	ON s.website_session_id = o.website_session_id
group by s.device_type;


/*
Insight: THe conversion rate for desktop web traffic is 5.5% higher than that of mobile traffic.
Recommendation: The mobile web app should be looked at and possibly overhauled. Clearly something within the mobile web app 
is causing large amounts of users to not complete orders.
Prediction: If a problem(s) can be indentified in the mobile app, web traffic that converts into orders should increase greatly
on the mobile device type.
*/


/*
# Data Request 13
Question
List all orders by orderid and place all orders into 3 categories being price of low, medium, or high.

Business Justification
By spliting up the sales distribution, businesses can better identify trends, sales distribution, and 
tailor strategies accordingly.
*/
/*
CASE to Categorize Data
Determine whether the total price of an order falls into the high, medium, or low category.
high: >= 100
medium: 50 - 99
low: < 50
*/
SELECT 
    order_id,
    CASE 
        WHEN price_usd >= 100 THEN 'high'
        WHEN price_usd >= 50 AND price_usd < 100 THEN 'medium'
        ELSE 'low'
    END AS price_category
FROM orders;


/*
# Data Request 14
Question
Display the different page urls and the view counts associated with those pages.
Business Justification
Identifying the most frequently visited entry pages on a website is 
crucial for understanding user behavior and optimizing website performance.
*/
/*
Top Landing Pages
From: Cheryl (Website Manager)
Subject: Top Entry Pages
Date: June 12, 2021
Can you pull a list of the most frequently visited entry pages on our website? I'd like to verify where our users
are first landing when they visit the site.
Business Question:
what specific web pages on our website are generating the most traffic?
Expected Output:
A table containing all the different urls and the associated view counts for those pages
Concepts:
GROUP BY
Aggregate functions
CTE
*/
WITH EntryPageViews AS (
    SELECT pageview_url, COUNT(*) AS pageview_count
    FROM pageviews
    GROUP BY pageview_url
)
SELECT pageview_url, pageview_count
FROM EntryPageViews
ORDER BY pageview_count DESC;
/*
Insight:
products, original-gift-basket, and home are the top 3 urls that are visted on the page. They are followed by lp-2
after which there is a significant gap between the next URL
Recommendation:
Businesses can prioritize optimization efforts, such as improving page load times, enhancing content relevance, and 
optimizing calls-to-action, to better cater to user needs and preferences. And these changes can be first applied to 
those specific URLs that are recieving the most traffic.
Prediction:
The highest proforming web pages will have higher preformance and generate more traffic. This will lead to a even further
increase to view counts in those URLs and the others by people exploring, all of which should lead to more sales
*/






