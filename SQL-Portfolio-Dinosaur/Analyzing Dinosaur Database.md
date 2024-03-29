# Paleontological Data
Paleontological data is extremely important for the evolutionary history of the Earth, allowing scientists the 
ability to peer into the past and trace the journey of various species.
By examining changes created by history through the use of fossils,
paleontologists can analyze
and comprehend how life has slowly yet intensely adapted and diversify through the course of millions of years.

In this notebook, we are going to trim, clean,
and analyze dinosaur data
obtained from [Kaggle.com](https://www.kaggle.com/datasets/kjanjua/jurassic-park-the-exhaustive-dinosaur-dataset)
while 
simultaneously creating a simulated paleontological research project. 

After a recent expedition, several of our paleontologists came through with fantastic finds!
Returning home from their fieldwork and expeditions,
they have gathered an abundance of valuable prehistoric data from around the globe.
Along with the data gathered, our leadership of stakeholders,
consisting of senior palaeontologists, archaeologists, and lab analysts,
will guide and challenge us to find life's most curious prehistoric mysteries!
From trying to formulate the idea of regional gigantism to figuring out evolutionary traits influenced by diet,
we will uncover the truth about so many formerly ambiguous dinosaurs.

The dataset contains information about dinosaurs, ranging from biological information (name, diet, length, 
taxonomy, and species) to archaeological information (period, habitual country, type, discoverer).
Below I will find the answers to questions such as:

- ### Which geographical regions have the highest concentration of dinosaur fossils based on the dataset?
  - [Count of fossils ordered from greatest to least per region](#Count-of-fossils-ordered-from-greatest-to-least-per-region)
    - [Which region has the most number of fossils? What is the fossil concentration?](#Which-region-has-the-most-number-of-fossils-What-is-the-fossil-concentration)
    - [Which region has the least number of fossils? What is the fossil concentration?](#Which-region-has-the-least-number-of-fossils-What-is-the-fossil-concentration)
- ### What are the dietary patterns observed among the sampled dinosaurs, and how do they vary across different species and regions?
  - [What are the classification amounts found in our research? Which is most common, moderately common, and least common?](#What-are-the-classification-amounts-found-in-our-research-Which-is-most-common-moderately-common-and-least-common)
  - [Based on location, what are the dietary patterns observed among the sampled dinosaurs?](#Based-on-location-what-are-the-dietary-patterns-observed-among-the-sampled-dinosaurs)
    - [Does diet contribute to size?](#Does-diet-contribute-to-size)
    - [How does diet affect species?](#how-does-diet-affect-species-)
    - [Are all diet classifications the same size?](#are-all-diet-classifications-the-same-size)
    - [Does diet vary through region?](#does-diet-vary-through-region-)
    - [Do certain climates have a higher concentration of a specific diet classification?](#do-certain-climates-have-a-higher-concentration-of-a-specific-classification)
-  ### How does the length of dinosaurs vary across different taxonomic groups?
    - [Are there some identifications of any correlation between the length of a dinosaur and its taxonomy?](#are-there-some-identifications-of-any-correlation-between-the-length-of-a-dinosaur-and-its-taxonomy)
      - [Are there any differences between carnivorous and herbivorous dinosaurs regarding taxonomy?](#are-there-any-differences-between-carnivorous-and-herbivorous-dinosaurs-regarding-taxonomy)
- ### Who are the paleontologists credited with naming the most dinosaur species in the dataset?
  - [What is the count of dinosaur species ordered from greatest to least per paleontologist?](#what-is-the-count-of-dinosaur-species-ordered-from-greatest-to-least-per-paleontologist)
- ### Final Thoughts
  - [Project Summary](#Project-Summary)


###                                                             .
This dataset features two tables, ```dino_biological_info``` as well as ```dino_archaeological_info```. After importing
said data, we can join these two datasets to make our data analysis journey just a little bit easier! We will combine
these two tables with the ```JOIN``` function to create the ```dino_database``` table.  

Below will be the query that will combine our tables:

[In]
``` sql //
CREATE TABLE dino_database AS
SELECT
	bio.Name,
	bio.Diet,
	bio.Length,
	bio.Taxonomy,
	bio.Species,
	arch.Type,
	arch.Period,
	arch.Lived_In,
	arch.Named_By
FROM
	dino_biological_info bio
JOIN
	dino_archaeological_info arch ON bio.name = arch.name;
```

After creating the ```dino_database``` table, we can now start our paleontology research! To start off I will 
```SELECT``` all of the data from ```dino_database``` to answer the questions above and help my stakeholders uncover 
the mysteries of evolution from the Mezoziac Era. Due to this data being 291 rows, I will limit the output to five 
rows to better visualize the example. However, most of the queries will be executed without the ```LIMIT```.

[In]

```sql //
SELECT *
FROM
	dino_database dd 
ORDER BY
	RANDOM()
LIMIT 5;
```
[Out]

| Name             | Diet        | Length | Taxonomy                                                                                                                                                                                 | Species     | Type              | Period                                     | Lived_In | Named_By                                             | Year_Named |
|------------------|-------------|--------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|-------------------|--------------------------------------------|----------|------------------------------------------------------|------------|
| Ornithomimus     | Omnivorous  | 4.0M   | Dinosauria Saurischia Theropoda Neotheropoda Tetanurae Avetheropoda Coelurosauria Tyrannoraptora Maniraptoriformes Ornithomimosauria Ornithomimidae                                      | Velox       | Large Theropod    | Late Cretaceous 74-65 Million Years Ago    | Usa      | Marsh                                                | 1890       |
| Khaan            | Omnivorous  | 1.8M   | Dinosauria Saurischia Theropoda Neotheropoda Tetanurae Avetheropoda Coelurosauria Tyrannoraptora Maniraptoriformes Maniraptora Oviraptorosauria Caenagnathoidea Oviraptoridae Ingeniinae | Mckennai    | Small Theropod    | Late Cretaceous 81-75 Million Years Ago    | Mongolia | Clark Norell And Barsbold                            | 2001       |
| Nanshiungosaurus | Omnivorous  | 4.4M   | Dinosauria Saurischia Theropoda Neotheropoda Tetanurae Avetheropoda Coelurosauria Tyrannoraptora Maniraptoriformes Maniraptora Therizinosauroidea Therizinosauridae                      | Brevispinus | Large Theropod    | Late Cretaceous 84-71 Million Years Ago    | China    | Dong                                                 | 1979       |
| Silvisaurus      | Herbivorous | 4.0M   | Dinosauria Ornithischia Genasauria Thyreophora Ankylosauromorpha Ankylosauria Nodosauridae                                                                                               | Condrayi    | Armoured Dinosaur | Early Cretaceous 121-112 Million Years Ago | Usa      | Eaton                                                | 1960       |
| Guanlong         | Carnivorous | 3.0M   | Dinosauria Saurischia Theropoda Neotheropoda Tetanurae Avetheropoda Coelurosauria Tyrannoraptora Tyrannosauroidea                                                                        | Wucaii      | Small Theropod    | Late Jurassic 159-154 Million Years Ago    | China    | Xu Clark Forster Norell Erickson Eberth Jia And Zhao | 2006       |


## Which geographical regions have the highest concentration of dinosaur fossils based on the dataset?

### [Home](#Paleontological-Data)

After using the function above, we can see the first five rows of ```dino_database```, which include the geographical 
regions in which the fossils were found.

In the section below, we will isolate the geographical regions the fossils were found in, count how many times fossils 
were found in each country, and order them by greatest to least.

## Count of fossils ordered from greatest to least per region

[In]

``` sql //
SELECT
	Lived_In,
	COUNT(*) AS Fossil_Count
FROM
	dino_database dd 
GROUP BY
	Lived_In 
ORDER BY 
	Fossil_Count DESC 
LIMIT 5;
```
[Out]

|    Lived_In     | Fossil_Count |
|:---------------:|:------------:|
|       USA       |      75      |
|      China      |      43      |
|    Mongolia     |      41      |
|    Argentina    |      26      |
| United Kingdom  |      20      |

## Which region has the most number of fossils? What is the fossil concentration?

[In]

``` sql //
SELECT
	Lived_In,
	COUNT(*) AS Country_Count
FROM
	dino_database dd 
GROUP BY
	Lived_In 
ORDER BY 
	Fossil_Count DESC 
LIMIT 1;
```  
[Out]

| Lived_In | Fossil_Count |
|:--------:|:------------:|
|   USA    |      75      |


## Which region has the least number of fossils? What is the fossil concentration?

[In]

``` sql //
SELECT
	Lived_In,
	COUNT(*) AS Fossil_Count
FROM
	dino_database dd 
GROUP BY
	Lived_In
HAVING 
	Fossil_Count = 1
ORDER BY 
	Fossil_Count ASC;
```
[Out]

**It seems that several of our expeditions resulted in locations with the same number, ```1```. If wanting to see all locations with this amount, we can include the ```HAVING``` function. With this inclusion we will now see our minutely successful expeditions, which have the lowest fossil count we encountered!**

|   Lived_in    | Fossil_Count |
|:-------------:|:------------:|
|  Antarctica   |      1       |
|    Malawi     |      1       |
| North Africa  |      1       |
|    Russia     |      1       |
|  Switzerland  |      1       |
|    Tunisia    |      1       |
|    Uruguay    |      1       |
|     Wales     |      1       |

## What are the dietary patterns observed among the sampled dinosaurs, and how do they vary across different species and regions?

### [Home](#Paleontological-Data)

With location varying just as much as fossil count, analyzing our dinosaurs' dietary patterns can provide valuable 
insights related to paleontology. Understanding the diet diversity in certain regions, uncovering the population of 
dominant species or classifications, and revealing evolutionary adaptations due to climate or dinosaur population 
are just a few conclusions we can make based on this question.   

In the section below, we will isolate dinosaur dietary classifications as well use the previous data to infer how 
climate, vegetation, and population might have caused rapid evolutionary adaptations. 

## What are the classification amounts found in our research? Which is most common, moderately common, and least common?

Now that we have organized data which informs us about which locations have the highest concentration of fossils, 
it would be extremely helpful to see which classification these fossils would fall into!
This would be fantastic since
it would allow us to see what the concentration of carnivores, herbivores, and omnivores populated the spaces long 
ago.
With this information, we can infer what the climate as well as environment was like! 

[In]

``` sql //
SELECT 
	Diet,
	COUNT(*) AS Classification_Amount
FROM 	
	dino_database dd 
GROUP BY 
	Diet 
ORDER BY 
	Classification_Amount DESC;
```
[Out]

|     Diet     | Classification_Amount |
|:------------:|:---------------------:|
| Herbivorous  |          171          |
| Carnivorous  |          93           |
|  Omnivorous  |          26           |


## Based on location, what are the dietary patterns observed among the sampled dinosaurs?

After finding the total number of fossils per classification, we can further our research by 
advancing our query to show the concentration of fossils per location and per classification! 

[In]

``` sql //
SELECT 
	Lived_In,
	Diet,
	COUNT(*) AS Classification_Amount
FROM 	
	dino_database dd 
GROUP BY 
	Lived_In,
	Diet 
ORDER BY
	RANDOM(), 
	Diet,
	Lived_In ASC 
LIMIT 5;
```
[Out]

|   Lived_In   |     Diet     | Classification_Amount |
|:------------:|:------------:|:---------------------:|
| South Africa |  Omnivorous  |           1           |
|    Brazil    | Carnivorous  |           2           |
|  Argentina   | Herbivorous  |          13           |
|   Mongolia   | Carnivorous  |          12           |
|    Canada    |  Omnivorous  |           3           |

## Does diet contribute to size?

Now that we have an overview of fossil concentration per location as well as diet, we can answer a question that 
will lead us to our main goal, we can ask does diet contribute to size?

[In]

``` sql //
SELECT
    Diet,
    COUNT(*) AS Classification_Amount,
    ROUND(AVG(Length),2) AS Average_Length_By_Meters
FROM
    dino_database dd 
GROUP BY
    Diet
ORDER BY 
	Average_Length_By_Meters DESC;
```
[Out]

|    Diet     | Classification_Amount | Average_Length_By_Meters |
|:-----------:|:---------------------:|:------------------------:|
| Herbivorous |          171          |           8.88           |
| Carnivorous |          93           |           5.15           |
| Omnivorous  |          26           |           3.68           |

## How does diet affect species? 

As we can see above, interestingly, diet has a correlation to size!
On average, the fossils that were found, 
cleaned, and examined showed that those of herbivorous dietary patterns were 42% larger than the fossils of 
carnivorous dinosaurs.

Since we have a general overview on size, let's further our research and make it far more precise.
Can we see how 
diet affects the size of our dinosaurs?
Are all carnivores generally the same size or does it vary?

In the section below, we will explore how diet affects all of our dino's size based on species and understand 
if all classifications are usually the same size or if they differ greatly, possibly due to other factors.

**Normally this query would be simple to calculate as numerical values can easily be ordered by 
the ```ORDER BY``` function.
However, the data we have gathered on our fossils was written as a text,
or a ```VARCHAR``` because of the inclusion of "M" for meters.
Since a text value was involved with our numerical value the ```CAST``` is used
to change the column ```Length``` to go from a text value to an approximate numeric value or a "floating value"
by the use of the ```FLOAT``` function.**

[In]

``` sql //
SELECT
    Diet,
    Length,
    Species
FROM
    dino_database dd
ORDER BY
    Diet ASC,
    CAST(Length AS FLOAT) DESC
LIMIT 5;
```

[Out]

|    Diet     | Length |   Species   |
|:-----------:|:------:|:-----------:|
| Carnivorous | 18.0M  | Aegyptiacus |
| Carnivorous | 15.0M  |  Saharicus  |
| Carnivorous | 13.0M  |   Roseae    |
| Carnivorous | 12.5M  |  Carolinii  |
| Carnivorous | 12.0M  |  Atokensis  |



## Are all diet classifications the same size?

Although a ```LIMIT``` is employed, the query above shows every single species, their diet, and their length,
organized in greatest to least to better understand how species can vary in size depending on diet classification. 

Using this data, we can better understand how unique dinosaur species variation truly is.
No matter if the dinosaur is omnivorous, carnivorous, or herbivorous,
we can see the massive scale in which dinosaur length can measure.
From 0.5M all the way to 30.0M, dinosaur size can vary drastically, but is there any easier way to visualize this range?
How can we truly see how big our dinos can get?

In the section below,
we will isolate the largest dinosaurs found through fossil identification based on their diet classifications.

``` sql //
SELECT
    Diet,
    MAX(CAST(Length AS FLOAT)) AS Max_Length_Meters
FROM
    dino_database
WHERE
    Diet IN ('Carnivorous', 'Omnivorous', 'Herbivorous')
GROUP BY
    Diet
ORDER BY 
	max_length_meters DESC;
```

[Out]

|     Diet     | Max_Length_Meters |
|:------------:|:-----------------:|
| Herbivorous  |        35         |
| Carnivorous  |        18         |
|  Omnivorous  |        12         |


## Does diet vary through region? 

Wow!
We can see the drastic difference in correlation between diet classification as well as dinosaur length. 

When monogamous towards one diet, we can see that dinosaurs become quite large, especially if that loyalty is 
stuck on vegetation.
With an almost 50% size increase between carnivores and herbivores, it shows that
when food is far more available, organisms tend to become larger. 

Using the data we have gathered to deduce, 
vegetation was far more prominent compared to organisms during the era of our fossilized friends.
I can estimate this because herbivores were much larger than any other classification found in our research. 
With such a massive size means an increased metabolism, which in turn means a gargantuan diet. 

What an incredible find!
Now we know that the Earth millions of years ago hosted lush vegetation, lush enough to feed 30.0M+ tall dinosaurs!

While we now know how populated the earth was with vegetation,
did all regions have this type of rich landscape
or were some barron enough to just host life rather than house a luxuriant jungle?  

Finding out what climates existed could possibly teach us
if climates had varying diet or if some climates had unique and specific classification. 

In the section below, we will explore the different regions that we found housed fossilized remains, 
and if diet truly is region-specific or if every region generally has the three well-known classifications. 

[In]

``` sql //
SELECT
    lived_in,
	Diet,
	COUNT(*) AS Classification_Total
FROM
    dino_database
GROUP BY
    Diet,
    Lived_In 
ORDER BY
	Lived_In ASC,
	Classification_Total DESC
LIMIT 5;
```

[Out]

|  Lived_In  |     Diet      | Classification_Total |
|:----------:|:-------------:|:--------------------:|
| Antarctica |  Carnivorous  |          1           |
| Argentina  |  Carnivorous  |          12          |
| Argentina  |  Herbivorous  |          12          |
| Argentina  |  Omnivorous   |          1           |
| Australia  |  Herbivorous  |          6           |


## Do certain climates have a higher concentration of a specific classification?

Although we don't have too many fossils for each region,
using an estimate,
we can see that almost every single region covered features either a carnivore and herbivore or an omnivore. 

This is groundbreaking!
It shows that vegetation covered the planet,
whether it be in the frigid lands of Antarctica or the humid deserts of Egypt. 

We now know
that the Earth allowed dinosaurs to evolutionarily adapt depending on the region by providing lush vegetation.

To answer the question above, it might be hard to say.
We have found more fossils in certain areas such as the USA,
does this mean that the USA had a higher concentration of carnivores, herbivores, or omnivores than Egypt?
Or did we just not find enough fossils to conclude? 

I believe
that certain climates do not have a higher concentration of a specific classification.
Based on the data, we now know that all classification types existed in almost every single region of Earth. 
It's safe to say
that the Earth during the mezoziac era while having different climate types still featured the necessary temperatures and resources
for animals to thrive.

Therefore, certain climates do NOT have a higher concentration of a specific classification.

## How does the length of dinosaurs vary across different taxonomic groups?

### [Home](#Paleontological-Data)

So much progress has been made!
With dinosaur diet and climate estimations, we can create an approximate idea on what life was like so many years ago.
Additionally,
we can understand the vegetation population and possibly even the climate based on dietary evidence inside our fossils. 

After obtaining so much dietary data,
we can understand more about correlating factors regarding our dinosaurs, such as sizing.  
While we understand that climate and diet influence the size of the dinosaurs found,
do taxonomic groups correlate with dinosaur size? 

In the section below,
we will explore the correlation between taxonomic groups and dinosaur length
by experimenting with window functions instead of the standard ```GROUP BY``` function. 

Using window functions will allow us to achieve a far more specific answer. However in the case of answering this question, the answer will be the exact same as if we did a ```GROUP BY``` function for the sake of versatility and expression. However in general, window functions allow the user to deal with a more complex and powerful way to analyze data. From running calculations by the use of ```(ORDER BY x)``` to manageable aggregate partition clauses by the use of ```(PARTITION BY x)``` window functions allow SQL queries to be far more intricate and commanding. 

[In]

``` sql //
SELECT DISTINCT
    Taxonomy,
    ROUND(AVG(Length) OVER (PARTITION BY Taxonomy), 2) AS Average_Length_Meters,
    MIN(CAST(Length AS FLOAT)) OVER (PARTITION BY Taxonomy) AS Minimum_Length_By_Meters,
    MAX(CAST(Length AS FLOAT)) OVER (PARTITION BY Taxonomy) AS Maximum_Length_By_Meters
FROM
    dino_database
LIMIT 5;
```

[Out]

|                                               Taxonomy                                                | Average Length (Meters) | Minimum_Length_By_Meters | Maximum_Length_By_Meters |
|:-----------------------------------------------------------------------------------------------------:|:-----------------------:|:------------------------:|:------------------------:|
|                                        Dinosauria Ornithischia                                        |          4.55           |           2.1            |            7             |
|                    Dinosauria Ornithischia Genasauria Cerapoda Heterodontosauridae                    |           1.2           |           1.2            |           1.2            |
|                Dinosauria Ornithischia Genasauria Cerapoda Marginocephalia Ceratopsia                 |           1.2           |           1.2            |           1.2            |
|         Dinosauria Ornithischia Genasauria Cerapoda Marginocephalia Ceratopsia Neoceratopsia          |           1.2           |           1.1            |           1.3            |
| Dinosauria Ornithischia Genasauria Cerapoda Marginocephalia Ceratopsia Neoceratopsia Bagaceratopsidae |            1            |            1             |            1             |

## Are there some identifications of any correlation between the length of a dinosaur and its taxonomy?

What an interesting find!
While taxonomic groups sound similar, they can completely vary in size!
Based on the data available,
we can see
that Dinosauria Ornithischia is 73% larger than the Dinosauria Ornithischia Genasauria Cerapoda Heterodontosauridae taxonomic group! 

While differing species may fall into similar sounding taxonomic groups, the species themselves differ entirely. 
After analyzing our data,
we can see that dinosaur length varies extremely using taxonomic groups as the measured category. 

Based on the data available,
I would say
that taxonomy is a less reliable way
to understand size, however, it can help in the search to identify size. 

I would say
that species is a far better identifier
when it comes to dinosaur length
as species can provide us hints on understanding evolutionary patterns and lineages.

However, with the help of taxonomy and the analysis of bone structure,
we can calculate the predicted size and dimensions of our dinosaurs. 

## Are there any differences between carnivorous and herbivorous dinosaurs regarding taxonomy?

Since we now know that dinosaur size varies heavily regarding taxonomy,
could there be a correlation between carnivorous and herbivorous dinosaurs? 

In the section below, we will try
to locate any differences between carnivorous and herbivorous dinosaurs regarding taxonomy.

[In]

``` sql// 
SELECT
	diet,
	Taxonomy, 
       ROUND(AVG("Length"),2) AS Avg_Length_By_Meters, 
       MIN(CAST(Length AS FLOAT)) AS Min_Length_By_Meters, 
       MAX(CAST(Length AS FLOAT)) AS Max_Length_By_Meters
FROM 
	dino_database dd 
GROUP BY 
	Diet 
ORDER BY 
	Avg_Length_By_Meters DESC 
```

[Out]

| Diet        | Taxonomy                                                                                                                             | Avg_Length_By_Meters | Min_Length_By_Meters | Max_Length_By_Meters |
|-------------|--------------------------------------------------------------------------------------------------------------------------------------|----------------------|----------------------|----------------------|
| Herbivorous | Dinosauria Saurischia Sauropodomorpha Sauropoda Eusauropoda Neosauropoda Macronaria Camarasauromorpha Titanosauriformes Titanosauria | 8.88                 | 0.5                  | 35                   |
| Carnivorous | Dinosauria Saurischia Theropoda Neotheropoda Tetanurae Spinosauroidea Spinosauridae Spinosaurinae                                    | 5.15                 | 0.25                 | 18                   |
| Omnivorous  | Dinosauria Saurischia Sauropodomorpha Prosauropoda Anchisauria Melanorosauridae                                                      | 3.68                 | 0.6                  | 12                   |

## Who are the paleontologists credited with naming the most dinosaur species in the dataset?

### [Home](#Paleontological-Data)

Considerable advancements have been made based on our expedition data!
From diet and species correlation to taxonomy and size,
we have gathered an understanding of what correlating factors can and might have influenced the Mesozoic era. 

Knowing what size our animals were and what leading diet classification populated certain areas could easily let us
know the estimated climate of certain regions.
Especially with herbivores,
knowing that they dwelled in the Antarctic shows us
that even if there were frigid temperatures, vegetation was still able to grow and thrive! 

Now that we have uncovered so much hidden knowledge regarding our fossils,
let us venture into the discoverers of said dinos
and use our paleontologist data to answer one of our stakeholder's questions!

In the section below, we will see the spread of paleontologist discoveries
and understand if multiple paleontologists have discovered more than others.
Additionally,
we will label the status of their frequency to show how efficient and successful they were at unveiling fossils. 

## What is the count of dinosaur species ordered from greatest to least per paleontologist?

[In]

``` sql//
SELECT
    Named_By,
    COUNT(Named_By) AS Total_Species_Named,
    CASE 
        WHEN COUNT(Named_By) = (SELECT MAX(Total_Species_Named) FROM (SELECT Named_By, COUNT(*) AS Total_Species_Named FROM dino_database GROUP BY Named_By) AS max_counts) THEN 'Breakthrough'
        WHEN COUNT(Named_By) = (SELECT MIN(Total_Species_Named) FROM (SELECT Named_By, COUNT(*) AS Total_Species_Named FROM dino_database GROUP BY Named_By) AS min_counts) THEN 'Incremental'
        ELSE "Steady"
    END AS Naming_Status
FROM 
	dino_database
GROUP BY 
	Named_By
ORDER BY 
	Total_Species_Named DESC 
LIMIT 5;
```

[Out]

| Named_By  | Total_Species_Named | Naming_Status |
|-----------|---------------------|---------------|
| Marsh     | 16                  | Breakthrough  |
| Brown     | 8                   | Steady        |
| Osborn    | 7                   | Steady        |
| Gilmore   | 6                   | Steady        |
| Bonaparte | 6                   | Steady        |

## Final Thoughts

### [Home](#Paleontological-Data)

## Project Summary

After extensive research regarding the data
gathered from numerous queries, we have finally come to the end of our research project. 

We have uncovered so much!
We have seen the most populous landscapes that housed a range of dinosaurs. 
We have seen the effect diet and region have on the size of dinosaurs.
We have uncovered that no matter the diet, classification is more about bone structure than species itself. 
We have uncovered the potential climate that lurked millions of years ago,
and we have seen the brilliant accomplishments and dedication provided to us by history's paleontologists.

From large to small, we have uncovered and answered such magnificent questions, all uncovered by the queries of SQL.

Thank you!

