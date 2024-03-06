# Aurora Technologies Consumer Data
Consumer financial data may be analyzed for several purposes, whether it be to obtain information from different categories such as through a government database or for marketing reasons. Companies, whether they be financial, healthcare, technology, or retail, use consumer data for a multitude of reasons such as to better understand their customers, improve products and services, and enhance marketing strategies. 

In this notebook, we are going to analyze consumer data from the fictional business, Aurora Technologies to assist stakeholders in finding answers to questions for the purpose of a marketing strategy. Aurora Technologies is a software company specializing in-app development. Our new app, Budget Buddy, was released to help consumers budget better, track their credit score, and find the best personal, automotive, and mortgage loans for their income and area. However, we need to help market our product, and to do that we will use our customer database from our past applications. 

The dataset contains information about customers, ranging from personal information (age, gender, annual income, debt) to demographic information (demographics and country of residency). Below I will find the answers to questions such as:

  - ### [What is the average age of our consumers?](#What-is-the-average-age-of-our-consumers)
    - [What is the average age of our consumers by profession?](#what-is-the-average-age-of-our-consumers-by-profession)
    - [What is the least common and the most common genders present?](#what-is-the-least-common-and-the-most-common-genders-present)
      - [Least Common Gender](#least-common-gender)
      - [Moderately Common Gender](#moderately-common-gender)
      - [Most Common Gender](#most-common-gender)
  - ### [What is the average time spent on each social media platform by age?](#What-is-the-average-time-spent-on-each-social-media-platform-by-age)
    - [Average Time Spent for Each Consumer Based off of Desired Platform](#average-time-spent-for-each-consumer-based-off-of-desired-platform-)
      - [Average Time Spent on YouTube 18–64](#average-time-spent-on-youtube-1864)
      - [Average Time Spent on Instagram 18–64](#average-time-spent-on-instagram-1864)
      - [Average Time Spent on Facebook 18-64](#average-time-spent-on-youtube-1864)
  - ### [What is the average income and debt based on the most used social media platforms?](#What-is-the-average-income-and-debt-based-on-the-most-used-social-media-platforms)
    - [What is the average income and debt of each individual based on their desired social media platform?](#what-is-the-average-income-and-debt-of-each-individual-based-on-their-desired-social-media-platform)
  - ### [Do homeowners tend to spend more or less time on social media compared to non-homeowners?](#Do-homeowners-tend-to-spend-more-or-less-time-on-social-media-compared-to-non-homeowners)
    - [The average time spent on platforms by homeowners vs. non-homeowners](#the-average-time-spent-on-each-platform-by-homeowners-vs-non-homeowners)
  - ### [How do location and demographics affect the choice of social media platform?](#How-do-location-and-demographics-affect-the-choice-of-social-media-platform-and-time-spent)
    - [How do location and demographics affect userbase, time spent on platforms, and average time spent on platforms by user?](#how-do-location-and-demographics-affect-userbase-time-spent-on-platforms-and-average-time-spent-on-platforms-by-user-)
  - ### [Marketing Plan](#Marketing-Plan)

###                                                             .
After importing the ```Customer_Database```, the table ```Customer_Database``` is in our SQL Database. To start off I will ``` SELECT ``` all of the data from ```Customer_Database``` to answer the questions above and help my stakeholders develop a sharper marketing plan based off location and income data. Due to the data being 1000 rows, I will limit the output to five rows to better visualize the example. However, most of the queries will be executed without the ```LIMIT```.

[In]

``` sql //
SELECT *
FROM 
    Customer_Database cd
LIMIT 5;
```
[Out]

| Age | Gender | Time_Spent_Hrs | Platform  | Interests |    Location    | Demographics |    Profession     | Annual_Income | Indebt | Debt_Amount | Is_Homeowner | Owns_Car |
|:---:|:------:|:--------------:|:---------:|:---------:|:--------------:|:------------:|:-----------------:|:-------------:|:------:|:-----------:|:------------:|:--------:|
| 56  |  Male  |       3        | Instagram |  Sports   | United Kingdom |    Urban     | Software Engineer |    108824     |  TRUE  |   133744    |    FALSE     |  FALSE   |
| 46  | Female |       2        | Facebook  |  Travel   | United Kingdom |    Urban     |       Nurse       |     43350     |  TRUE  |    47803    |     TRUE     |   TRUE   |
| 32  |  Male  |       7        | Instagram |  Sports   |   Australia    |   Suburban   |      Teacher      |     51030     | FALSE  |   161411    |    FALSE     |  FALSE   |
| 60  | Female |       4        | Instagram |  Travel   | United Kingdom |    Urban     |    Accountant     |    102545     | FALSE  |   159572    |     TRUE     |  FALSE   |
| 25  |  Male  |       6        | Instagram | Lifestyle |   Australia    |    Urban     | Graphic Designer  |     63303     | FALSE  |    52828    |     TRUE     |   TRUE   |

## What is the average age of our consumers?

After using the function above, we can see the first five rows, which include the age of our consumers. With about 1000 rows, averaging the ```age``` column would not only take time but could lead to errors due to the massive amount of data available. 

While we can calculate the average manually, SQL can quickly, efficiently, and correctly analyze and calculate the query we provide it.

In the section below, we will calculate the average rounded age of our consumers, and as a bonus, find the average age by profession. 

[In]

``` sql //
SELECT 
    ROUND(AVG(Age)) AS Average_Age
FROM 
    Customer_Database;
```
[Out]

**Average Rounded Age of Consumers:** ```41```

## What is the average age of our consumers by profession?

Due to the table having 179 unique professions, we will limit the results to just five random rows to not cloud up the document.

[In]

``` sql //
SELECT
    Profession,
    ROUND(AVG(Age)) AS Average_Age
FROM
    Customer_Database
GROUP BY
    Profession
ORDER BY
    RANDOM()
LIMIT 5;
```
[Out]

**Average Rounded Age By Profession:** 

|      Profession       | Average Age |
|:---------------------:|:-----------:|
| Insurance Underwriter |     33      |
| Financial Controller  |     27      |
|      Arbitrator       |     46      |
|      Accountant       |     43      |
|  Immigration Lawyer   |     35      |


## What is the least common and the most common genders present?

From the first five rows, we can see the average age of our consumers in general as well as by profession. This information allows us to answer some pivotal questions in regard to marketing and how we can develop a strategy based off of consumer data. Will billboards or social media ads be more beneficial to a 38th old IT Technician? Will television or print mail be more successful for a 56th old Police Detective?

While we know age and profession, we do not know which gender is the most common, which is the least, and what the count is for each. Finding this data will allow us to see why certain sexes are more attracted to this product and why some aren't. This data will allow us to better shape our marketing to be more versatile and equally accepted. 

In this section, we are going to discover the least common gender, moderately common, and the most common gender. Rather than creating several different queries, we will find the least/most common gender while also showing the count of each. 

## Least Common Gender

[In]

``` sql //
SELECT
    Gender,
    COUNT(*) AS Gender_Amount
FROM
    Customer_Database cd 
GROUP BY
    Gender
ORDER BY
    Gender_Amount ASC 
LIMIT 1;
```  
[Out]

**Least Common Gender Present & Count:** ```Non-Binary, 116``` 

## Moderately Common Gender 

[In]

``` sql //
SELECT
    Gender,
    COUNT(*) AS Gender_Amount
FROM
    Customer_Database cd 
GROUP BY
    Gender
ORDER BY
    Gender_Amount DESC
LIMIT 1 OFFSET 1;
```
[Out]

**Moderately Common Gender Present & Count:** ```Female, 398```

## Most Common Gender

[In]

``` sql //
SELECT
    Gender,
    COUNT(*) AS Gender_Amount
FROM
    Customer_Database cd
GROUP BY
    Gender
ORDER BY
    Gender_Amount DESC
LIMIT 1;
```
[Out]

**Most Common Gender Present & Count:** ```Male, 486``` 

## What is the average time spent on each social media platform by age?

After implementing all of our queries, we can see a total of 486 Males, 398 Females, and 116 Non-Binary individuals, with the average age of our consumers being 41 years old. In ```customer_database``` the column ```Time_Spent_Hrs``` can be seen, this will be our next destination. This column shows the daily time spent in the past hours on the desired social media app. 

The previous section provided tons of useful data for us to play around with! Obtaining the dominant as well as the least dominant sex and the average age will be extremely useful, but how will we market ourselves to our consumers? Will Facebook ads be most successful for 19-year-old women? Will Instagram ads in the form of short videos be most successful for 56-year-old men? 

Using the data from previous sections will now help us find a suitable location for marketing based off the data gathered through calculating time spent based on age. 

**Due to the size of this chart, I will be grouping ages into their respective ranges.**

## Average Time Spent for Each Consumer Based off of Desired Platform 

This first query will show the platform as well as the rounded average time spent on the desired platform. If we ```GROUP BY``` ```Age``` as well as ```Platform``` It will instead show 141 rows of unique information. 

Although there are 1000 rows, the ```GROUP BY``` function combines all duplicate values and averages them out as the ```Average_Time``` instead of showing 1000 rows of duplicate information. 

[In]

``` sql //
SELECT
    platform,
    ROUND(AVG(Time_Spent_Hrs), 1) AS Average_Time
FROM
    Customer_Database cd
GROUP BY
    platform
ORDER BY
    Average_Time DESC;
```
[Out]

| Platform  | Average_Time |
|:---------:|:------------:|
| Instagram |     4.1      |
|  Youtube  |      4       |
| Facebook  |     3.9      |

## Average Time Spent on YouTube 18–64

This query is the exact same for every age range as well as platform, the only difference would be the ages or platforms requested. To see the different results, change the ```Youtube``` and ```18 AND 29``` to be any desired values. 

[In]

``` sql //
SELECT
    platform,
    ROUND(AVG(Time_Spent_Hrs), 1) AS Average_Time
FROM
    Customer_Database cd 
WHERE
    Platform LIKE 'Youtube' 
    AND Age BETWEEN 18 AND 29;
```
[Out]

**Average Time Spent on YouTube by 18–29:** ```6.2 Hours```

**Average Time Spent on YouTube by 30–41:** ```4.8 Hours```

**Average Time Spent on YouTube by 42–53:** ```3.1 Hours```

**Average Time Spent on YouTube by 54–64:** ```2.4 Hours```

## Average Time Spent on Instagram 18–64

[In]

``` sql //
SELECT
    platform,
    ROUND(AVG(Time_Spent_Hrs), 1) AS Average_Time
FROM
    Customer_Database cd 
WHERE
    Platform LIKE 'Instagram' 
    AND Age BETWEEN 18 AND 29;
```
[Out]

**Average Time Spent on Instagram by 18–29:** ```6.2 Hours```

**Average Time Spent on Instagram by 30–41:** ```4.4 Hours```

**Average Time Spent on Instagram by 42–53:** ```3.0 Hours```

**Average Time Spent on Instagram by 54–64:** ```2.3 Hours```

## Average Time Spent on Facebook 18-64

[In]

``` sql //
SELECT
    platform,
    ROUND(AVG(Time_Spent_Hrs), 1) AS Average_Time
FROM
    Customer_Database cd
WHERE
    Platform LIKE 'Facebook'
    AND Age BETWEEN 18 AND 29;
```
[Out]

**Average Time Spent on Facebook by 18–29:** ```6.1 Hours```

**Average Time Spent on Facebook by 30–41:** ```4.6 Hours```

**Average Time Spent on Facebook by 42–53:** ```2.7 Hours```

**Average Time Spent on Facebook by 54–64:** ```2.4 Hours```

## What is the average income and debt based on the most used social media platforms?

Now that we have our individuals' general information as well as their preferred platform and statistics, the most important information regarding a finance app is the customer's financial information. 

Understanding a users' financial information will allow us to conduct a targeted marketing strategy which tailors to personal needs, such as saving for a property, managing investments, and creating financial goals. Studying both income amount and debt allows us to assess users' financial health, allowing us to track their risk assessment and spending habits. 

Using the data from previous sections will now help us see which app provides the greatest and worst spenders and help us engage in advertisements that tailor to the correct audience. 

[In]

``` sql //
SELECT
    Platform,
    ROUND(AVG(Annual_Income), 2) AS Average_Income,
    ROUND(AVG(Debt_Amount), 2) AS Average_Debt
FROM
    Customer_Database cd 
GROUP BY
    Platform;
```
[Out]

| Platform  | Average_Income | Average_Debt |
|:---------:|:--------------:|:------------:|
| Instagram |    90269.12    |   47458.14   |
| Facebook  |    88472.23    |   48892.71   |
|  YouTube  |    85879.72    |   50589.84   |

## What is the average income and debt of each individual based on their desired social media platform?

Differing from the question above, this query will show each consumer's age, desired platform, average income, and average debt while combining all duplicate values and averaging them out as both ```Average_Income``` and ```Average_Debt```. 

This result will show 141 rows organized by the ```Platform``` column in descending alphabetical order. However, for examples sake, the ```LIMIT``` function is applied to not cloud up the document.

[In]

``` sql //
SELECT
    Age,
    Platform,
    ROUND(AVG(Annual_Income), 2) AS Average_Income,
    ROUND(AVG(Debt_Amount), 2) AS Average_Debt
FROM
    Customer_Database cd 
GROUP BY
    Age,
    Platform 
ORDER BY
    Platform DESC
LIMIT 5;
```
[Out]

| Age | Platform | Average_Income | Average_Debt |
|:---:|:--------:|:--------------:|:------------:|
| 18  | YouTube  |   100019.73    |   15408.09   |
| 19  | YouTube  |   109678.63    |   15889.00   |
| 20  | YouTube  |    94897.83    |   14304.83   |
| 21  | YouTube  |    39128.50    |   12572.50   |
| 22  | YouTube  |    55615.00    |   15110.67   |

## Do homeowners tend to spend more or less time on social media compared to non-homeowners?

As we keep going further into our consumer information, we can now develop a stronger understanding of how we can advertise our app most successfully based off of age, platform, income, and debt. Understanding this information will allow a more tailored experience that will reach the right audiences and create a more personalized bond with those who are witnessing said advertisement. 

To further on with our marketing endeavor, asking questions in regard to a homeowner status would be most beneficial as we can calculate not only how much time homeowners spend on social media, but if they spend it more or less than those without one. Additionally, knowing homeowner statistics regarding our consumers will allow us to introduce features such as locating mortgage rates and payment information for those who are both in the midst of paying their mortgage and those who are saving for a home. 

In the section below we will see create a query that averages out the time spent on platforms by homeowners as well as non-homeowners, additionally, we will show the expanded view for each platform. 

## The average time spent on platforms by homeowners vs. non-homeowners 

[In]

``` sql //
SELECT
    Is_Homeowner,
    ROUND(AVG(Time_Spent_Hrs), 2) AS Avg_Time_Spent
FROM
    Customer_Database
GROUP BY
    Is_Homeowner
ORDER BY
    Is_Homeowner DESC;
```

[Out]

| Is_Homeowner | Avg_Time_Spent |
|:------------:|:--------------:|
|     TRUE     |      4.05      |
|    FALSE     |      3.97      |


## The average time spent on each platform by homeowners vs. non-homeowners

[In]

``` sql //
SELECT
    Is_Homeowner,
    Platform,
    ROUND(AVG(Time_Spent_Hrs), 2) AS Avg_Time_Spent
FROM
    Customer_Database
GROUP BY
    Is_Homeowner,
    Platform
ORDER BY
    Is_Homeowner DESC;
```

[Out]

| Is_Homeowner | Platform  | Avg_Time_Spent |
|:------------:|:---------:|:--------------:|
|     TRUE     | Facebook  |      4.03      |
|     TRUE     | Instagram |      4.13      |
|     TRUE     |  YouTube  |      3.99      |
|    FALSE     | Facebook  |      3.82      |
|    FALSE     | Instagram |      4.04      |
|    FALSE     |  YouTube  |      4.04      |

## How do location and demographics affect the choice of social media platform and time spent?

Our previous sections have shown a momentous amount of helpful data that we, Aurora Technologies, can use to better understand our customers while simultaneously allowing us to market ourselves correctly and advertise specific features to those who require them.

We have seen how our customers on average are about the age of 41 years old, and most are of the gender "Male." Our consumers use their technological devices on average about 4 hours a day, with Instagram being the most used social media platform at 4.1 hours. 

The most important data found was in regard to age, with those between the ages of 18–29 using social media platforms 3x as much as those in between the ages of 54–64. While our main customer age is between 41–50, we can now see how important social media ads are for the younger generation, while more traditional ads, whether they be billboards, commercials, or newspapers would be more beneficial for those who are older. 

Lastly, it was shown that Instagram holds on average the top earners with the least amount of debt, those who are making 9.4% more than the lesser earners of our consumers. Those who statistically make the least income and have the most debt of our consumers are shown to be using Facebook as their main platform. 

As we come to a close, the last stakeholder question follows suit as essential, does location matter? While we have our main plan for marketing to those in a higher / lower tax bracket and which apps to use. Location can make or break the success of our ad campaign. 

This section will examine the effects that location and demographics have on consumers' desired social media platform and the time spent on the said platform.

## How do location and demographics affect userbase, time spent on platforms, and average time spent on platforms by user? 

[In]

``` sql //
SELECT
    Locations.Location,
    Customer_Database.Demographics,
    Customer_Database.Platform,
    COUNT(Customer_Database.Location) AS Users,
    COALESCE(SUM(Customer_Database.Time_Spent_Hrs), 0) AS Total_Time_Spent,
    ROUND(AVG(Customer_Database.Time_Spent_Hrs), 1) AS Average_Time_Per_Location
FROM
   (SELECT DISTINCT Location
FROM Customer_Database) AS Locations
LEFT JOIN
    Customer_Database ON Locations.Location = Customer_Database.Location
GROUP BY
    Locations.Location,
    Customer_Database.Demographics,
    Customer_Database.Platform 
ORDER BY
    RANDOM(),
    Customer_Database.location,
    Customer_Database.Demographics DESC
LIMIT 10;
```
[Out]

|    Location     | Demographic |  Platform  | Users | Total_Time_Spent | Average_Time_Per_Location |
|:---------------:|:-----------:|:----------:|:-----:|:----------------:|:-------------------------:|
|      Malta      |  Suburban   |  YouTube   |   1   |        2         |            2.0            |
|     Germany     |    Urban    |  YouTube   |   1   |        8         |            8.0            |
|   South Korea   |    Rural    |  YouTube   |   1   |        6         |            6.0            |
|     Mexico      |  Suburban   |  Facebook  |   1   |        2         |            2.0            |
|     Germany     |    Rural    | Instagram  |   1   |        2         |            2.0            |
|  United States  |  Suburban   | Instagram  |  29   |       124        |            4.3            |
|     Russia      |    Rural    | Instagram  |   1   |        7         |            7.0            |
|    Australia    |  Suburban   |  YouTube   |  29   |       113        |            3.9            |
|     Denmark     |    Urban    |  Facebook  |   1   |        2         |            2.0            |
|     Canada      |    Rural    |  YouTube   |   3   |        18        |            6.0            |

## Marketing Plan

Using all the data from our countless queries, we can now create a plan to better market to our costumers. Based off of age data as well as demographic statistics, we can associate advertisement types as well as topics. We can create one last query that will gather all data and associate those in each environment with their desired platform and interest and mark each unique advertisement by the use of a new column, ```Advertisement_Type```. 

Below will be our final query that will organize our consumers by how we can and will market to them in the coming weeks. To simplify the data listed and not cloud up this document, a ```LIMIT``` of 10 will be assigned. 


[In]

``` sql //
SELECT Age, Platform, Time_Spent_Hrs, Interests, Location, Demographics,
        CASE
            WHEN age BETWEEN 18 AND 41
                AND Platform IN ('YouTube', 'Instagram', 'Facebook') 
                AND Interests IN (
                    'Sports', 'Travel', 'Lifestyle', 'Cooking', 'Photography', 'Hiking', 'Painting', 'Yoga', 'Reading', 'Gardening',
                    'Traveling', 'Playing musical instruments', 'Writing', 'Astronomy', 'Gaming', 'Birdwatching', 'Knitting', 'Fishing',
                    'Pottery', 'Cycling', 'Sculpting', 'Meditation', 'Dancing', 'DIY Projects', 'Film-making', 'Calligraphy', 'Surfing',
                    'Rock climbing', 'Collecting antiques', 'Woodworking', 'Stand-up comedy', 'Scuba diving', 'Horseback riding',
                    'Volunteer work', 'Martial arts', 'Baking', 'Urban exploration', 'Sewing', 'Home brewing', 'Archery', 'Graphic design',
                    'Interior decorating', 'Beekeeping', 'Geocaching', 'Model building', 'Parkour', 'Origami', 'Learning languages',
                    'Skydiving', 'Chess', 'Mountain biking', 'Cross-stitching', 'Creative writing', 'Urban gardening', 'Playing board games',
                    'Ice skating', 'Singing', 'DIY electronics', 'Genealogy research', 'Mountain climbing', 'Ballet', 'Salsa dancing',
                    'Wine tasting', 'Learning magic tricks', 'Kayaking', 'Historical reenactment', 'Cooking Japanese cuisine')
                THEN 'Ad through ' || Platform || ' featuring visuals regarding ' || Interests
            WHEN age BETWEEN 42 AND 64
                AND Platform IN ('YouTube', 'Instagram', 'Facebook') 
                AND Interests IN (
                    'Sports', 'Travel', 'Lifestyle', 'Cooking', 'Photography', 'Hiking', 'Painting', 'Yoga', 'Reading', 'Gardening',
                    'Traveling', 'Playing musical instruments', 'Writing', 'Astronomy', 'Gaming', 'Birdwatching', 'Knitting', 'Fishing',
                    'Pottery', 'Cycling', 'Sculpting', 'Meditation', 'Dancing', 'DIY Projects', 'Film-making', 'Calligraphy', 'Surfing',
                    'Rock climbing', 'Collecting antiques', 'Woodworking', 'Stand-up comedy', 'Scuba diving', 'Horseback riding',
                    'Volunteer work', 'Martial arts', 'Baking', 'Urban exploration', 'Sewing', 'Home brewing', 'Archery', 'Graphic design',
                    'Interior decorating', 'Beekeeping', 'Geocaching', 'Model building', 'Parkour', 'Origami', 'Learning languages',
                    'Skydiving', 'Chess', 'Mountain biking', 'Cross-stitching', 'Creative writing', 'Urban gardening', 'Playing board games',
                    'Ice skating', 'Singing', 'DIY electronics', 'Genealogy research', 'Mountain climbing', 'Ballet', 'Salsa dancing',
                    'Wine tasting', 'Learning magic tricks', 'Kayaking', 'Historical reenactment', 'Cooking Japanese cuisine')
                THEN 'Ad through physical mail and ' || Platform || ' featuring visuals regarding ' || Interests
            ELSE
                'Ad through ' || Platform || ' featuring visuals regarding ' || Interests
        END AS Advertisement_Type
FROM
    Customer_Database
WHERE
    ((age BETWEEN 18 AND 41 AND Demographics = 'Urban')
    OR
    (age BETWEEN 42 AND 64 AND Demographics = 'Urban')
    OR
    (age BETWEEN 18 AND 41 AND Demographics = 'Suburban')
    OR
    (age BETWEEN 42 AND 64 AND Demographics = 'Suburban')
    OR
    (age BETWEEN 18 AND 41 AND Demographics = 'Rural')
    OR
    (age BETWEEN 42 AND 64 AND Demographics = 'Rural'))
LIMIT 10;
```
[Out]

| Age | Platform  | Time_Spent_Hrs | Interests |    Location    | Demographics |                            Advertisement_type                             |
|:---:|:---------:|:--------------:|:---------:|:--------------:|:------------:|:-------------------------------------------------------------------------:|
| 56  | Instagram |       3        |  Sports   | United Kingdom |    Urban     | Ad through physical mail and Instagram featuring visuals regarding Sports |
| 46  | Facebook  |       2        |  Travel   | United Kingdom |    Urban     | Ad through physical mail and Facebook featuring visuals regarding Travel  |
| 32  | Instagram |       7        |  Sports   |   Australia    |   Suburban   |          Ad through Instagram featuring visuals regarding Sports          |
| 60  | Instagram |       4        |  Travel   | United Kingdom |    Urban     | Ad through physical mail and Instagram featuring visuals regarding Travel |
| 25  | Instagram |       6        | Lifestyle |   Australia    |    Urban     |        Ad through Instagram featuring visuals regarding Lifestyle         |
| 38  | Facebook  |       3        |  Travel   | United States  |    Urban     |          Ad through Facebook featuring visuals regarding Travel           |
| 56  |  YouTube  |       3        |  Sports   |     France     |    Urban     |  Ad through physical mail and YouTube featuring visuals regarding Sports  |
| 36  | Instagram |       2        |  Sports   |     Japan      |    Urban     |          Ad through Instagram featuring visuals regarding Sports          |
| 40  |  YouTube  |       4        | Lifestyle |     Mexico     |   Suburban   |         Ad through YouTube featuring visuals regarding Lifestyle          |
| 28  | Instagram |       3        |  Cooking  |   Australia    |   Suburban   |         Ad through Instagram featuring visuals regarding Cooking          |
