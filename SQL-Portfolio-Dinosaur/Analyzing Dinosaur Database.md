# Paleontological Data
Paleontological data is extremely important for the evolutionary history of the Earth, allowing scientists the ability to peer into the past and trace the journey of various species. By examining changes created by history through the use of fossils, paleontologists can analyze and comprehend how life has slowly yet intensely adapted and diversify through the course of millions of years.

In this notebook, we are going to trim, clean, and analyze dinosaur data obtained from [Kaggle.com ](https://www.kaggle.com/datasets/kjanjua/jurassic-park-the-exhaustive-dinosaur-dataset) while simultaneously creating a simulated paleontological research project. After a recent expedition, several of our paleontologists came through with fantastic finds! Returning home from their fieldwork and expedition, they have gathered an abundance of valuable prehistoric data from around the globe. Along with the data gathered, our leadership of stakeholders, consisting of senior palaeontologists, archaeologists, and lab analysts will guide and challenge us to find life's most curious prehistoric mysteries! From trying to formulate the migration patterns to figuring out evolutionary traits influenced by diet, we will uncover the truth about so many formerly ambiguous dinosaurs.

The dataset contains information about dinosaurs, ranging from biological information (name, diet, length, taxonomy, and species) to archaeological information (period, habitual country, type, discoverer). Below I will find the answers to questions such as:

- [Which geographical regions have the highest concentration of dinosaur fossils based on the dataset?](#Which-geographical-regions-have-the-highest-concentration-of-dinosaur-fossils-based-on-the-dataset)
- [What are the dietary patterns observed among the sampled dinosaurs, and how do they vary across different species and regions?]()
- [How does the length of dinosaurs vary across different taxonomic groups, and is there a correlation between length and diet?]()
- [Could you identify any correlation between the length of a dinosaur and its taxonomy, and how does this correlation differ between carnivorous and herbivorous dinosaurs?]()
- [How does the distribution of dinosaur fossils vary across different continents, and what factors might have influenced these distribution patterns?]()


###                                                             .
This dataset features two tables, ```dino_biological_info``` as well as ```dino_archaeological_info```. After importing said data, we can join these two datasets to make our data analysis journey just a little bit easier! We will combine these two tables with the ```JOIN``` function to create the ```dino_database``` table.  

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
	dino_archaeological_info arch ON bio.name = arch.name
```

After creating the ```dino_database``` table, we can now start our paleontology research! To start off I will ```SELECT``` all of the data from ```dino_database``` to answer the questions above and help my stakeholders uncover the mysteries of evolution from the Mezoziac Era. Due to this data being 291 rows, I will limit the output to five rows to better visualize the example. However, most of the queries will be executed without the ```LIMIT```.

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

| Name           | Diet        | Length | Taxonomy                                                                                                                             | Species          | Type              | Period                                     | Lived_In       | Named_By                         |
|----------------|-------------|--------|--------------------------------------------------------------------------------------------------------------------------------------|------------------|-------------------|--------------------------------------------|----------------|----------------------------------|
| Deinocheirus   | Omnivorous  | 10.0M  | Dinosauria Saurischia Theropoda Neotheropoda Tetanurae Avetheropoda Coelurosauria Tyrannoraptora Maniraptoriformes Ornithomimosauria | Mirificus        | Large Theropod    | Late Cretaceous 70-66 Million Years Ago    | Mongolia       | Osmolska And Roniewicz (1970)    |
| Huayangosaurus | Herbivorous | 4.5M   | Dinosauria Ornithischia Genasauria Thyreophora Stegosauria Huayangosauridae                                                          | Taibaii          | Armoured Dinosaur | Mid Jurassic 170-160 Million Years Ago     | China          | Dong Tang And Zhou (1982)        |
| Hylaeosaurus   | Herbivorous | 5.0M   | Dinosauria Ornithischia Genasauria Thyreophora Ankylosauromorpha Ankylosauria                                                        | Armatus          | Armoured Dinosaur | Early Cretaceous 150-135 Million Years Ago | United Kingdom | Mantell (1833)                   |
| Sonidosaurus   | Herbivorous | 9.0M   | Dinosauria Saurischia Sauropodomorpha Sauropoda Eusauropoda Neosauropoda Macronaria Camarasauromorpha Titanosauriformes Titanosauria | Saihangaobiensis | Sauropod          | Late Cretaceous 89-65 Million Years Ago    | China          | Xu Zhang Tan Zhao And Tan (2006) |
| Silvisaurus    | Herbivorous | 4.0M   | Dinosauria Ornithischia Genasauria Thyreophora Ankylosauromorpha Ankylosauria Nodosauridae                                           | Condrayi         | Armoured Dinosaur | Early Cretaceous 121-112 Million Years Ago | USA            | Eaton (1960)                     |

## Which geographical regions have the highest concentration of dinosaur fossils based on the dataset?

After using the function above, we can see the first five rows of ```dino_database```, which include the geographical regions in which the fossils were found.

In the section below, we will isolate the geographical regions the fossils were found in, count how many times fossils were found in each country, and order them by greatest to least.

## Count of fossils ordered from greatest to least per country

[In]

``` sql //
SELECT
	Lived_In,
	COUNT(Lived_In) AS Fossil_Count
FROM
	dino_database dd 
GROUP BY
	Lived_In 
ORDER BY 
	Fossil_Count DESC 
LIMIT 5;
```
[Out]

| Lived_In        | Fossil_Count |
|-----------------|--------------|
| USA             | 75           |
| China           | 43           |
| Mongolia        | 41           |
| Argentina       | 26           |
| United Kingdom  | 20           |

## Which country has the most number of fossils? What is the fossil concentration?

[In]

``` sql //
SELECT
	Lived_In,
	COUNT(Lived_In) AS Country_Count
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
|----------|--------------|
| USA      | 75           |


## Which country has the least number of fossils? What is the fossil concentration?

[In]

``` sql //
SELECT
	Lived_In,
	COUNT(Lived_In) AS Fossil_Count
FROM
	dino_database dd 
GROUP BY
	Lived_In 
ORDER BY 
	Fossil_Count ASC 
LIMIT 10;
```
[Out]

**It seems that several of our expeditions resulted in locations with the same number, ```1```. If wanting to see all locations we can ```LIMIT``` by 10 and see our minutely successful expeditions!**

| Lived_in      | Fossil_Count |
|---------------|--------------|
| Antarctica    | 1            |
| Malawi        | 1            |
| North Africa  | 1            |
| Russia        | 1            |
| Switzerland   | 1            |
| Tunisia       | 1            |
| Uruguay       | 1            |
| Wales         | 1            |
| Egypt         | 2            |
| Japan         | 2            |








