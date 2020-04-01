DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS houses;


CREATE TABLE houses (
  ID SERIAL PRIMARY KEY,
  house_name VARCHAR(255),
  logo VARCHAR(255)
);

CREATE TABLE students (
  ID SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT,
  house_id INT REFERENCES houses(id) ON DELETE CASCADE
);
