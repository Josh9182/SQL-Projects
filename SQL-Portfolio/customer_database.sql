-- Create the table: customer_database

CREATE TABLE customer_database
(
  Age INTEGER,
  Gender character varying(30),
  Time_Spent_Hrs INTEGER,
  Dominant_Platform TEXT,
  Interests TEXT,
  Location TEXT,
  Demographics character varying(20),
  Profession TEXT,
  Annual_Income NUMERIC,
  In_Debt character varying(5),
  Debt_Amount NUMERIC,
  Is_Homeowner character varying(5),
  Owns_Car character varying(5)  
);


-- set the seperator option to focus on commas, for CSV sake.
.separator ','

-- import the data from the file and convert into a table.
.import customer_database.csv customer_database
