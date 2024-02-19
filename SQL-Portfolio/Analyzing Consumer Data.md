# Fictional Consumer Data
Consumer financial data may be analzed for several purposes, whether it be to organize civilians in different categories such as through a government database or for marketing reasons. Companies, whether they be financial, healthcare, technology, or retail, use consumer data for a multitude of reasons such as to better understand their customers, improve products and services, and enhance marketing strategies. 

In this notebook, we are going to analyze consumer data from the finctional business, Aurora Technologies in order to assist stakeholders in finding answers to questions for the purpose of a marketing strategy. The dataset contains information about customers, ranging from personal information (age, gender, annual income, debt) to demographical information (demographics and country of residency). Below I will find the answers to questions such as:

- What is the average age of our consumers? 
- What is the least common and most common gender present? What is the numerical amount of each gender? 
- What is the average time spent on each social media platform by age? 
- What is the average income and debt of individuals based on their desired social media platform?
- Do homeowners tend to spend more or less time on social media compared to non-homeowners?
- How does location and demographics affect the choice of social media platform?

After importing the ```customer_database```, the table ```consumer_database``` is in our SQL Database. To start off I will ``` SELECT ``` all of the data from ```consumer_database``` to answer the questions above and help my stakeholders develop a sharper marketing plan based off location and income data. Due to the data being 1000 rows, I will limit the output to 15 rows for this example. However the rest of the queries will be executed without the ```LIMIT```.

[In]

```
SELECT *
FROM Customer_Database cd
LIMIT 15;
```
[Out]

Age	Gender | Time_Spent (Hrs)	| Platform | Interests | Location |	Demographics | Profession |	Annual_Income |	Indebt |	Debt Amount	| Is_Homeowner |	Owns_Car |
------------- | ------------- | ------------- | ------------- |------------- | ------------- |------------- | ------------- |------------- | ------------- |------------- | ------------- | 56|Male|3|Instagram|Sports|United Kingdom|Urban|Software-Engineer|108824|TRUE|133744|FALSE|FALSE
46|Female|2|Facebook|Travel|United Kingdom|Urban|Nurse|43350|TRUE|47803|TRUE|TRUE
32|Male|8|Instagram|Sports|Australia|Suburban|Teacher|51030|FALSE|161411|FALSE|FALSE
60|Female|5|Instagram|Travel|United Kingdom|Urban|Accountant|102545|FALSE|159572|TRUE|FALSE
25|Male|1|Instagram|Lifestlye|Australia|Urban|Graphic-Designer|63303|FALSE|52828|TRUE|TRUE
38|Female|3|Facebook|Travel|United States|Urban|Electrician|32224|TRUE|105808|TRUE|TRUE
56|Male|8|YouTube|Sports|France|Urban|Lawyer|67003|TRUE|62461|TRUE|TRUE
36|Male|4|Instagram|Sports|Japan|Urban|Chef|145554|TRUE|64707|FALSE|TRUE
40|Female|7|YouTube|Lifestlye|Mexico|Suburban|Sales-Representative|88726|FALSE|161868|FALSE|TRUE
28|Male|2|Instagram|Sports|Australia|Suburban|Marketing-Manager|54337|TRUE|181845|FALSE|TRUE
28|Male|7|YouTube|Lifestlye|Canada|Urban|Doctor|71499|TRUE|58095|TRUE|FALSE
41|Female|5|Facebook|Sports|Brazil|Suburban|Customer-Service-Representative|68242|FALSE|96316|FALSE|FALSE
53|Male|5|Facebook|Sports|South Africa|Rural|Web-Developer|124364|FALSE|78267|TRUE|TRUE
57|Male|6|Instagram|Lifestlye|Italy|Urban|Construction-Worker|99017|FALSE|33347|TRUE|FALSE
41|Female|9|YouTube|Travel|India|Rural|Financial-Analyst|102043|TRUE|154571|TRUE|FALSE
20|Female|6|Facebook|Sports|Germany|Suburban|Administrative-Assistant|48708|TRUE|42894|TRUE|FALSE


