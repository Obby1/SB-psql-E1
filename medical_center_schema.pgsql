DROP DATABASE medical_center_schema;
CREATE DATABASE medical_center_schema;
\c medical_center_schema;

CREATE TABLE "doctors" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "patients" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "doctor_patient" (
  "id" SERIAL PRIMARY KEY,
  "doctor_id" integer NOT NULL,
  "patient_id" integer NOT NULL
);

CREATE TABLE "illness" (
  "id" SERIAL PRIMARY KEY,
  "illness" varchar NOT NULL
);

CREATE TABLE "diagnoses" (
  "id" SERIAL PRIMARY KEY,
  "doctor_id" integer NOT NULL,
  "patient_id" integer NOT NULL,
  "illness_id" integer NOT NULL,
  "date_of_diagnoses" timestamp
);

ALTER TABLE "doctor_patient" ADD FOREIGN KEY ("patient_id") REFERENCES "doctors" ("id");

ALTER TABLE "doctor_patient" ADD FOREIGN KEY ("doctor_id") REFERENCES "patients" ("id");

ALTER TABLE "diagnoses" ADD FOREIGN KEY ("doctor_id") REFERENCES "doctors" ("id");

ALTER TABLE "diagnoses" ADD FOREIGN KEY ("patient_id") REFERENCES "patients" ("id");

ALTER TABLE "diagnoses" ADD FOREIGN KEY ("illness_id") REFERENCES "illness" ("id");


INSERT INTO doctors (name)
VALUES
('Miles Caton'),
('Mallory del Rosario');

INSERT INTO patients (name)
VALUES
('Caleb del Rosario'),
('Hunter del Rosario');

INSERT INTO doctor_patient (doctor_id, patient_id)
VALUES
('2', '1'),
('2', '2');

INSERT INTO illness (illness)
VALUES
('COVID 19');

INSERT INTO diagnoses (doctor_id, patient_id, illness_id, date_of_diagnoses)
VALUES
('1', '1', '1', '2016-06-22 19:10:25-07');







--newer old code:

-- CREATE TABLE "medical_center" (
--   "id" SERIAL PRIMARY KEY,
--   "doctor_id" integer UNIQUE,
--   "patient_id" integer UNIQUE
-- );

-- CREATE TABLE "doctors" (
--   "id" SERIAL PRIMARY KEY,
--   "name" varchar NOT NULL
-- );

-- CREATE TABLE "patients" (
--   "id" SERIAL PRIMARY KEY,
--   "name" varchar NOT NULL
-- );

-- CREATE TABLE "doctor_patient" (
--   "id" SERIAL PRIMARY KEY,
--   "doctor_id" integer NOT NULL,
--   "patient_id" integer NOT NULL
-- );

-- CREATE TABLE "illness" (
--   "id" SERIAL PRIMARY KEY,
--   "illness" varchar NOT NULL
-- );

-- CREATE TABLE "diagnoses" (
--   "id" SERIAL PRIMARY KEY,
--   "doctor_id" integer NOT NULL,
--   "patient_id" integer NOT NULL,
--   "illness_id" integer NOT NULL,
--   "date_of_diagnoses" timestamp
-- );

-- ALTER TABLE "doctors" ADD FOREIGN KEY ("id") REFERENCES "medical_center" ("doctor_id");

-- ALTER TABLE "patients" ADD FOREIGN KEY ("id") REFERENCES "medical_center" ("patient_id");

-- ALTER TABLE "doctor_patient" ADD FOREIGN KEY ("patient_id") REFERENCES "doctors" ("id");

-- ALTER TABLE "doctor_patient" ADD FOREIGN KEY ("doctor_id") REFERENCES "patients" ("id");

-- ALTER TABLE "diagnoses" ADD FOREIGN KEY ("doctor_id") REFERENCES "doctors" ("id");

-- ALTER TABLE "diagnoses" ADD FOREIGN KEY ("patient_id") REFERENCES "patients" ("id");

-- ALTER TABLE "diagnoses" ADD FOREIGN KEY ("illness_id") REFERENCES "illness" ("id");



-- old code:

-- CREATE TABLE "medical_center" (
--   "id" SERIAL PRIMARY KEY,
--   "doctor_id" integer UNIQUE,
--   "patient_id" integer UNIQUE,
-- );

-- CREATE TABLE "doctors" (
--   "id" SERIAL PRIMARY KEY,
--   "name" varchar NOT NULL
-- );

-- CREATE TABLE "patients" (
--   "id" SERIAL PRIMARY KEY,
--   "name" varchar NOT NULL
-- );

-- CREATE TABLE "doctor_patient" (
--   "id" SERIAL PRIMARY KEY,
--   "doctor_id" integer NOT NULL,
--   "patient_id" integer NOT NULL
-- );

-- CREATE TABLE "illness" (
--   "id" SERIAL PRIMARY KEY,
--   "illness" varchar NOT NULL
-- );

-- CREATE TABLE "diagnoses" (
--   "id" SERIAL PRIMARY KEY,
--   "doctor_id" integer NOT NULL,
--   "patient_id" integer NOT NULL,
--   "illness_id" integer NOT NULL,
--   "date_of_diagnoses" timestamp
-- );

-- ALTER TABLE "doctors" ADD FOREIGN KEY ("id") REFERENCES "medical_center" ("doctor_id");

-- ALTER TABLE "patients" ADD FOREIGN KEY ("id") REFERENCES "medical_center" ("patient_id");

-- ALTER TABLE "doctor_patient" ADD FOREIGN KEY ("patient_id") REFERENCES "doctors" ("id");

-- ALTER TABLE "doctor_patient" ADD FOREIGN KEY ("doctor_id") REFERENCES "patients" ("id");

-- ALTER TABLE "diagnoses" ADD FOREIGN KEY ("doctor_id") REFERENCES "doctors" ("id");

-- ALTER TABLE "diagnoses" ADD FOREIGN KEY ("patient_id") REFERENCES "patients" ("id");

-- ALTER TABLE "diagnoses" ADD FOREIGN KEY ("illness_id") REFERENCES "illness" ("id");


