-- Table: dino_database

CREATE TABLE dino_database AS
SELECT
	bio.Name,
	bio.Diet,
	bio.Length,
	bio.Taxonomy,
	bio.Species,
	arch.Type,
	arch.Period,
	arch.Lived_in,
	arch.Named_By
	arch.Year_Named
FROM
	dino_biological_info bio
JOIN
	dino_archaeological_info arch ON bio.name = arch.name;
