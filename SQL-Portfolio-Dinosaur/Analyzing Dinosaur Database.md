# Paleontological Data
Paleontological data is extremely important for the evolutionary history of the Earth, allowing scientists the ability to peer into the past and trace the journey of various species. By examining changes created by history through the use of fossils, paleontologists can analyze and comprehend how life has slowly yet intensely adapted and diversify through the course of millions of years.

In this notebook, we are going to trim, clean, and analyze dinosaur data obtained from [Kaggle.com ](https://www.kaggle.com/datasets/kjanjua/jurassic-park-the-exhaustive-dinosaur-dataset) while simultaneously creating a simulated paleontological research project. After a recent expedition, several of our paleontologists came through with fantastic finds! Returning home from their fieldwork and expedition, they have gathered an abundance of valuable prehistoric data from around the globe. Along with the data gathered, our leadership of stakeholders, consisting of senior palaeontologists, archaeologists, and lab analysts will guide and challenge us to find life's most curious prehistoric mysteries! From trying to formulate the migration patterns to figuring out evolutionary traits influenced by diet, we will uncover the truth about so many formerly ambiguous dinosaurs.

The dataset contains information about dinosaurs, ranging from biological information (name, diet, length, taxonomy, and species) to archaeological information (period, habitual country, type, discoverer). Below I will find the answers to questions such as:

-k
-k
-k
-k
-k

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
