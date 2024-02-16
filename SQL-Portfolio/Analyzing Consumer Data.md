# Fictional Consumer Data
Consumer financial data may be analzed for several purposes, whether it be to organize civilians in different categories such as through a government database or for marketing reasons. Companies, whether they be financial, healthcare, technology, or retail, use consumer data for a multitude of reasons such as to better understand their customers, improve products and services, and enhance marketing strategies. 

In this notebook, we are going to analyze consumer data from the finctional business, Aurora Technologies in order to assist stakeholders in finding answers to questions for the purpose of a marketing strategy. The dataset contains information about customers, ranging from personal information (age, gender, annual income, debt) to demographical information (demographics and country of residency). Below I will find the answers to questions such as:

- What is the average age of our consumers? 
- What is the least common and most common gender present? What is the numerical amount of each gender? 
- What is the average time spent on each social media platform by age? 
- What is the average income and debt of individuals based on their desired social media platform?
- Do homeowners tend to spend more or less time on social media compared to non-homeowners?
- How does location and demographics affect the choice of social media platform?

After importing the ```customer_database```, the table ```consumer_database``` is in our SQL Database. To start off I will ``` SELECT ``` all of the data from ```consumer_database``` to answer the questions above and help my stakeholders develop a sharper marketing plan based off location and income data. 

-- IN
```
SELECT *
FROM Customer_Database cd 
```


