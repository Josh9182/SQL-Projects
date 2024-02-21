# Aurora Technologies Consumer Data
Consumer financial data may be analzed for several purposes, whether it be to organize civilians in different categories such as through a government database or for marketing reasons. Companies, whether they be financial, healthcare, technology, or retail, use consumer data for a multitude of reasons such as to better understand their customers, improve products and services, and enhance marketing strategies. 

In this notebook, we are going to analyze consumer data from the finctional business, Aurora Technologies in order to assist stakeholders in finding answers to questions for the purpose of a marketing strategy. Aurora Technologies is a software company specializing in app developement. Our new app, Budget Buddy was released in order to help consumers budget better, track their credit score, and find the best personal, automotive, and mortgage loans for their income and area. However, we need help marketing our product, and to do that we wil use our customer database from our past applications. 

The dataset contains information about customers, ranging from personal information (age, gender, annual income, debt) to demographical information (demographics and country of residency). Below I will find the answers to questions such as:

  - [What is the average age of our consumers?](#What-is-the-average-age-of-our-consumers)
  - [What is the least common and most common gender present?](#What-is-the-least-common-and-most-common-gender-present)
  - [What is the average time spent on each social media platform by age?](#What-is-the-average-time-spent-on-each-social-media-platform-by-age)
  - [What is the average income and debt of individuals based on their desired social media platform?]()
  - [Do homeowners tend to spend more or less time on social media compared to non-homeowners?]()
  - [How does location and demographics affect the choice of social media platform?]()

###                                                             .
After importing the ```customer_database```, the table ```consumer_database``` is in our SQL Database. To start off I will ``` SELECT ``` all of the data from ```consumer_database``` to answer the questions above and help my stakeholders develop a sharper marketing plan based off location and income data. Due to the data being 1000 rows, I will limit the output to 5 rows to better visualize the example. However most of the queries will be executed without the ```LIMIT```.

[In]

``` sql //
SELECT *
FROM Customer_Database cd
LIMIT 5;
```
[Out]

| Age | Gender | Time_Spent (Hrs) | Platform | Interests | Location | Demographics | Profession | Annual_Income | Indebt | Debt Amount | Is_Homeowner | Owns_Car |
|-----|--------|------------------|----------|-----------|----------|--------------|------------|---------------|--------|-------------|---------------|----------|
| 56  | Male   | 3 | Instagram | Sports | United Kingdom | Urban | Software-Engineer | 108824 | TRUE | 133744 | FALSE | FALSE |
| 46  | Female | 2 | Facebook | Travel | United Kingdom | Urban | Nurse | 43350 | TRUE | 47803 | TRUE | TRUE |
| 32  | Male   | 8 | Instagram | Sports | Australia | Suburban | Teacher | 51030 | FALSE | 161411 | FALSE | FALSE |
| 60  | Female | 5 | Instagram | Travel | United Kingdom | Urban | Accountant | 102545 | FALSE | 159572 | TRUE | FALSE |
| 25  | Male   | 1 | Instagram | Lifestlye | Australia | Urban | Graphic-Designer | 63303 | FALSE | 52828 | TRUE | TRUE |

## What is the average age of our consumers?

After using the function above we can see the first 5 rows, which include the age of our consumers. With about 1000 rows, averaging the ```age``` column would not only take time but could lead to errors due to the massive amount of data available. 

While we can calculate the average manually, SQL can quickly, efficiently, and correctly analyze and calculate the query we provide it.

In the section below we will calculate the average rounded age of our consumers, and as a bonus, find the average age by profession. 

[In]

``` sql //
SELECT ROUND(AVG(Age)) AS Average_Age
FROM Customer_Database;
```
[Out]

**Average Rounded Age of Consumers:** ```41```

## What is the average age of our consumers by profession?

Due to the table having 179 unique professions, we will limit the results to just 5 rows to not cloud up the document.

[In]

``` sql //
SELECT Profession, ROUND(AVG(Age)) AS Average_Age
FROM Customer_Database
GROUP BY Profession
LIMIT 5;
```
[Out]

**Average Rounded Age By Profession:** 

```
Account-Executive: 32
Account-Manager: 37
Accountant: 39
Administrative-Assistant: 38
Advertising-Manager: 34
```

## What is the least common and most common gender present?

From the first five rows, we can see the average age of our consumers in general as well as by proffesion. This information allows us to answer some pivotal questions in regard to marketing and how we can develop a strategy based off of consumer data. Will billboards or social media ads be more benneficial to a 38yr old IT Technician? Will television or print mail be more successful for a 56yr old Police Detective?

While we know age and profession, we do not know which gender is the most common, which is the least, and what the count is for each. Finding this data will allow us to see why certain sexes are more attracted to this product and why some aren't. This data will allow us to better shape our marketing to be more versatile and equally accepted. 

In this section, we are going to discover the least common gender and the most common gender. Rather than creating several different queries, we will find the least/most common gender while also showing the count of each. 


## Least Common Gender

[In]

``` sql //
SELECT Gender, COUNT(*) AS Gender_Amount
FROM Customer_Database cd 
GROUP BY gender
ORDER BY Gender_Amount ASC 
LIMIT 1;
```  
[Out]

**Least Common Gender Present & Count:** ```Male, 488``` 

## Most Common Gender

[In]

``` sql //
SELECT Gender, COUNT(*) AS Gender_Amount
FROM Customer_Database cd 
GROUP BY Gender 
ORDER BY gender_Amount DESC 
LIMIT 1
```
[Out]

**Most Common Gender Present & Count:** ```Female, 522``` 

## What is the average time spent on each social media platform by age?

After implementing all of our queries we can see a total of 488 Males and 522 Females, with the average age of our consumers being 41 years old. In ```customer_database``` the column ```time_spent (hrs)``` can be seen, this will be our next destination. This column shows the daily time spent in hours on the desired social media app. 

The previous section provided tons of useful data for us to play around with! Obtaining the dominant/least dominant sex and the average age will be extremely useful, but how will we market ourselves to our consumers? Will Facebook ads be most successful for 19 year old females? Will Instagram ads in the form of short videos be most successful for 56 year old males? 

Using the data from previous sections will now help us find a suitable location for marketing based off the data gathered through calculating time spent based on age. 

**Due to the size of this chart, I will be grouping ages into their respective ranges.**

## Average Time Spent for Each Consumer Based Off of Platform ()

(describe what this query does, I.E. shows distinct values and averages them out so if having (3) 42 year olds it will average out that value, etc)












[In]

``` sql //
SELECT age, platform, ROUND(AVG("Time_Spent (Hrs)"),1) AS Average_Time 
FROM Customer_Database cd 
GROUP BY age, Platform 
ORDER BY Platform DESC 
```

## Average Time Spent on Youtube 18-64

This query is the exact same for every age range as well as platform, the only difference would be the ages or platforms requested. To see the different results, change the ```Youtube``` and ```18 AND 29``` to be any desired values. 

[In]

``` sql //
SELECT platform, ROUND(AVG("Time_Spent (Hrs)"),1) AS Average_Time
FROM Customer_Database cd 
WHERE Platform LIKE 'YouTube' 
AND Age BETWEEN 18 AND 29
```
[Out]

**Average Time Spent on Youtube by 18-29:** ```5.1 Hours```

**Average Time Spent on Youtube by 30-41:** ```4.8 Hours```

**Average Time Spent on Youtube by 42-53:** ```4.8 Hours```

**Average Time Spent on Youtube by 54-64:** ```4.8 Hours```

## AVG Time Spent on Youtube 18-64


