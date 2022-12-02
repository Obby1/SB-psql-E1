DROP DATABASE craigslist;
CREATE DATABASE craigslist;
\c craigslist;


CREATE TABLE "post" (
  "id" SERIAL PRIMARY KEY,
  "title" VARCHAR NOT NULL,
  "text" VARCHAR NOT NULL,
  "category_id" INTEGER NOT NULL,
  "user_id" INTEGER NOT NULL,
  "location" VARCHAR NOT NULL,
  "region_id" INTEGER NOT NULL
);

CREATE TABLE "region" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR NOT NULL
);

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR NOT NULL,
  "region_id" INTEGER NOT NULL
);

CREATE TABLE "category" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR NOT NULL
);

ALTER TABLE "post" ADD FOREIGN KEY ("region_id") REFERENCES "region" ("id");

ALTER TABLE "post" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "post" ADD FOREIGN KEY ("category_id") REFERENCES "category" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("region_id") REFERENCES "region" ("id");


INSERT INTO category (name)
VALUES
('electronics'),
('clothes');

INSERT INTO region (name)
VALUES
('Los Angeles'),
('Orange County');

INSERT INTO users (name, region_id)
VALUES
('Obby', 2),
('Mallory', 2),
('Miles', 1);

INSERT INTO post (title, text, category_id, user_id, location, region_id)
VALUES
('fridge', 'selling my moms fridge, kinda works, a few bucks', 1, 3, 'downtown', 2);

-- to do : add on delete cascade, copy paste below code just double check if it works 

--old DATA
-- DROP DATABASE craigslist;
-- CREATE DATABASE craigslist;
-- \c craigslist;


-- CREATE TABLE "post" (
--   "id" SERIAL PRIMARY KEY,
--   "title" VARCHAR NOT NULL,
--   "text" VARCHAR NOT NULL,
--   "category_id" INTEGER NOT NULL,
--   "user_id" INTEGER NOT NULL,
--   "location" VARCHAR NOT NULL,
--   "region_id" INTEGER NOT NULL
-- );

-- CREATE TABLE "region" (
--   "id" SERIAL PRIMARY KEY,
--   "name" VARCHAR NOT NULL
-- );

-- CREATE TABLE "users" (
--   "id" SERIAL PRIMARY KEY,
--   "name" VARCHAR NOT NULL,
--   "region_id" INTEGER NOT NULL
-- );

-- CREATE TABLE "category" (
--   "id" SERIAL PRIMARY KEY,
--   "name" VARCHAR NOT NULL
-- );

-- ALTER TABLE "post" ADD FOREIGN KEY ("region_id") REFERENCES "region" ("id") ON DELETE CASCADE;

-- ALTER TABLE "post" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE;

-- ALTER TABLE "user" ADD FOREIGN KEY ("region_id") REFERENCES "region" ("id") ON DELETE SET NULL;

-- ALTER TABLE "post" ADD FOREIGN KEY ("category_id") REFERENCES "category" ("id") ON DELETE CASCADE;


-- INSERT INTO category (name)
-- VALUES
-- ('electronics'),
-- ('clothes');

-- INSERT INTO region (name)
-- VALUES
-- ('Los Angeles'),
-- ('Orange County');

-- INSERT INTO users (name, region_id)
-- VALUES
-- ('Obby', 2),
-- ('Mallory', 2),
-- ('Miles', 1);

