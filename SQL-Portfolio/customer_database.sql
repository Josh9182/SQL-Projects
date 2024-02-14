-- Table: customer_database

CREATE TABLE customer_database
(
  Age numeric,
  Gender character varying(30),
  Time_Spent_Hrs numeric,
  Dominant_Platform text,
  Interests text,
  Location text,
  Demographics character varying(20),
  Profession text,
  Annual_Income numeric,
  In_Debt character varying(5),
  Debt_Amount numeric,
  Is_Homeowner character varying(5),
  Owns_Car character varying(5)  
);


-- Copy over data from CSV
\copy customer_database FROM 'customer_database.csv' DELIMITER ',' CSV HEADER;
