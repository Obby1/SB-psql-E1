DROP DATABASE soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league;

CREATE TABLE "team" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR NOT NULL,
  "rank" INTEGER
);

CREATE TABLE "player" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR NOT NULL
);

CREATE TABLE "season" (
  "id" SERIAL PRIMARY KEY,
  "dates" VARCHAR NOT NULL
);

CREATE TABLE "refs" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR NOT NULL
);

CREATE TABLE "teams_roster" (
  "id" SERIAL PRIMARY KEY,
  "team" INTEGER NOT NULL REFERENCES team(id),
  "player" INTEGER NOT NULL REFERENCES player(id),
  "season" INTEGER NOT NULL REFERENCES season(id)
);


CREATE TABLE "game" (
  "id" SERIAL PRIMARY KEY,
  "team1" INTEGER REFERENCES team(id),
  "team2" INTEGER REFERENCES team(id),
  "team1_score" INTEGER NOT NULL,
  "team2_score" INTEGER NOT NULL,
  "timestamp" TIMESTAMP NOT NULL,
  "season" INTEGER REFERENCES season(id),
  "ref" INTEGER REFERENCES refs(id)
);

CREATE TABLE "goal" (
  "id" SERIAL PRIMARY KEY,
  "player" INTEGER NOT NULL REFERENCES player(id),
  "team" INTEGER NOT NULL REFERENCES team(id),
  "game" INTEGER NOT NULL REFERENCES game(id),
  "timestamp" TIMESTAMP NOT NULL,
  "season" INTEGER NOT NULL REFERENCES season(id),
  "roster" INTEGER NOT NULL REFERENCES teams_roster(id)
);





-- NOT WORKING

-- DROP DATABASE soccer_league;
-- CREATE DATABASE soccer_league;
-- \c soccer_league;


-- CREATE TABLE "teams" (
--   "id" SERIAL PRIMARY KEY,
--   "name" VARCHAR NOT NULL,
--   "rank" INTEGER
-- );

-- CREATE TABLE "goals" (
--   "id" SERIAL PRIMARY KEY,
--   "player_id" INTEGER NOT NULL,
--   "team_id" INTEGER NOT NULL,
--   "game_id" INTEGER NOT NULL,
--   "timestamp" TIMESTAMP NOT NULL,
--   "season_id" INTEGER NOT NULL,
--   "player_team_id" INTEGER NOT NULL
-- );

-- CREATE TABLE "players" (
--   "id" SERIAL PRIMARY KEY,
--   "name" VARCHAR NOT NULL
-- );

-- CREATE TABLE "teams_rosters" (
--   "id" SERIAL PRIMARY KEY,
--   "team" PRIMARY KEY,
--   "player_id" INTEGER NOT NULL,
--   "season_id" INTEGER NOT NULL
-- );

-- CREATE TABLE "referees" (
--   "id" SERIAL PRIMARY KEY,
--   "name" VARCHAR NOT NULL
-- );

-- CREATE TABLE "games" (
--   "id" SERIAL PRIMARY KEY,
--   "team1_id" INTEGER NOT NULL,
--   "team2_id" INTEGER NOT NULL,
--   "team1_score" INTEGER NOT NULL,
--   "team2_score" INTEGER NOT NULL,
--   "timestamp" TIMESTAMP NOT NULL,
--   "season_id" INTEGER NOT NULL,
--   "ref_id" INTEGER NOT NULL
-- );

-- CREATE TABLE "seasons" (
--   "id" SERIAL PRIMARY KEY,
--   "dates" VARCHAR NOT NULL
-- );

-- ALTER TABLE "games" ADD FOREIGN KEY ("team1_id") REFERENCES "teams" ("id");

-- ALTER TABLE "games" ADD FOREIGN KEY ("team2_id") REFERENCES "teams" ("id");

-- ALTER TABLE "games" ADD FOREIGN KEY ("season_id") REFERENCES "seasons" ("id");

-- ALTER TABLE "games" ADD FOREIGN KEY ("ref_id") REFERENCES "referees" ("id");

-- ALTER TABLE "goals" ADD FOREIGN KEY ("team_id") REFERENCES "teams" ("id");

-- ALTER TABLE "goals" ADD FOREIGN KEY ("game_id") REFERENCES "games" ("id");

-- ALTER TABLE "goals" ADD FOREIGN KEY ("season_id") REFERENCES "seasons" ("id");

-- ALTER TABLE "teams_rosters" ADD FOREIGN KEY ("team") REFERENCES "teams" ("id");

-- ALTER TABLE "players" ADD FOREIGN KEY ("id") REFERENCES "teams_rosters" ("player_id");

-- ALTER TABLE "seasons" ADD FOREIGN KEY ("id") REFERENCES "teams_rosters" ("season_id");

-- ALTER TABLE "players" ADD FOREIGN KEY ("id") REFERENCES "goals" ("player_id");


