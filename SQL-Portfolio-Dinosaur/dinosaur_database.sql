-- Table: dino_data

CREATE TABLE dino_data
(
  Name character varying(50),
  Diet character varying(15),
  Period character varying(200),
  Lived_in character varying(30),
  Type character varying(30),
  Length character varying(10),
  Taxonomy character varying(200),
  Named_By character varying(200),
  Species character varying(30)
);


-- Copy over data from CSV
\copy dino_data FROM 'dino_data.csv' DELIMITER ',' CSV HEADER;
