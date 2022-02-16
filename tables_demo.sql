CREATE TABLE "users" (
  "user_id" SERIAL PRIMARY KEY,
  "user_name" VARCHAR(50) NOT NULL,
  "user_password" VARCHAR(500) NOT NULL,
  "user_email" VARCHAR(100) NOT NULL,
  "user_bio" VARCHAR(1000) NOT NULL,
  "user_birthday" timestamp NOT NULL,
  "account_created" timestamp NOT NULL,
  "relationship_status" BOOLEAN
);

CREATE TABLE "posts" (
  "post_id" SERIAL PRIMARY KEY,
  "post_content" VARCHAR(2000),
  "post_image" TEXT,
  "time_of_post" timestamp NOT NULL,
  "post_author_id" INT NOT NULL
);

CREATE TABLE "groups" (
  "group_id" SERIAL PRIMARY KEY,
  "group_name" VARCHAR(50) NOT NULL,
  "group_created" DATE NOT NULL
);

CREATE TABLE "comments" (
  "comment_id" SERIAL PRIMARY KEY,
  "time_of_comment" timestamp NOT NULL,
  "comment_content" VARCHAR(1000) NOT NULL,
  "comment_author_id" INT NOT NULL,
  "post_id" INT NOT NULL
);

CREATE TABLE "following" (
  "follow_id" SERIAL PRIMARY KEY,
  "follower_id" INT NOT NULL,
  "following_id" INT NOT NULL
);

CREATE TABLE "groups_posts" (
  "groups_post_id" SERIAL PRIMARY KEY,
  "group_id" INT NOT NULL,
  "post_id" INT NOT NULL
);

CREATE TABLE "group_mmebers" (
  "group_member_id" SERIAL PRIMARY KEY,
  "group_id" INT NOT NULL,
  "user_id" INT NOT NULL,
  "is_admin" BOOLEAN DEFAULT false
);

ALTER TABLE "posts" ADD FOREIGN KEY ("post_author_id") REFERENCES "users" ("user_id");

ALTER TABLE "comments" ADD FOREIGN KEY ("comment_author_id") REFERENCES "users" ("user_id");

ALTER TABLE "comments" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("post_id");

ALTER TABLE "following" ADD FOREIGN KEY ("follower_id") REFERENCES "users" ("user_id");

ALTER TABLE "following" ADD FOREIGN KEY ("following_id") REFERENCES "users" ("user_id");

ALTER TABLE "groups_posts" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("group_id");

ALTER TABLE "groups_posts" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("post_id");

ALTER TABLE "group_mmebers" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("group_id");

ALTER TABLE "group_mmebers" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");
