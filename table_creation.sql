DROP TABLE chapter;
DROP TABLE volume;
DROP TABLE episode;
DROP TABLE consumed_media;
DROP TABLE review;
DROP TABLE medium;
DROP TABLE author;
DROP TABLE ilustrator;
DROP TABLE user_info;
DROP TABLE studio;

CREATE TABLE studio (
name VARCHAR(256) NOT NULL,
CONSTRAINT studio_pk PRIMARY KEY (name)
);

CREATE TABLE author (
author_id NUMBER(10) NOT NULL,
name VARCHAR(32) not null,
surname VARCHAR(32) not null,
birthdate DATE null,
gender VARCHAR(1) null ,
CONSTRAINT author_gender_constraint  check ((gender in ('K', 'M') OR gender is null)),
CONSTRAINT author_pk PRIMARY KEY (author_id)
);


CREATE TABLE ilustrator(
ilustrator_id NUMBER(10) NOT NULL,
name VARCHAR(256) NOT NULL,
surname VARCHAR(256) NOT NULL,
CONSTRAINT ilustrator_pk PRIMARY KEY (ilustrator_id)
);

CREATE TABLE medium(
id NUMBER(10),
title VARCHAR(256) NOT NULL,
genre VARCHAR(256) NULL,
volumes NUMBER(3) NULL,
chapters NUMBER(5) NULL,
publishing_type VARCHAR(256) NULL,
published_date DATE NULL,
author_id NUMBER(10) NULL, 
ilustrator_id NUMBER(10) NULL,
episodes NUMBER(3) NULL,
type VARCHAR(256) NULL,
studio_name VARCHAR(256) NULL,
medium VARCHAR(256) NOT NULL,
CONSTRAINT publishing_type_constraint check ((publishing_type in ('WEEKLY','DAILY','MONTHLY') OR publishing_type is NULL)),
CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES author(author_id) ON DELETE CASCADE,
CONSTRAINT fk_ilustrator_id FOREIGN KEY (ilustrator_id) REFERENCES ilustrator(ilustrator_id) ON DELETE CASCADE,
CONSTRAINT fk_studio_name FOREIGN KEY (studio_name) REFERENCES studio(name) ON DELETE CASCADE,
CONSTRAINT volumes_number_constraint check (volumes is NULL OR volumes > 0),
CONSTRAINT chapters_number_constraint check (chapters is NULL OR chapters > 0),
CONSTRAINT episodes_number_constraint check (episodes is NULL OR episodes > 0),
CONSTRAINT anime_type_constraint check ((type in ('ONA','OVA','TV', 'MOVIE', 'SPECIAL') OR type is NULL)),
CONSTRAINT medium_medium_constraint check (medium in ('ANIME','MANGA','LIGHT NOVEL')),
CONSTRAINT medium_pk PRIMARY KEY (id),
CONSTRAINT medium_integrity_constraint check( (medium = 'ANIME' AND studio_name IS NOT NULL) OR ((medium IN ('MANGA', 'LIGHT NOVEL')
) AND author_id IS NOT NULL) )
);


CREATE TABLE volume(
volume_id NUMBER(10) NOT NULL,
volume_number NUMBER(3) NOT NULL,
medium_id NUMBER(10) NOT NULL,
CONSTRAINT volume_pk PRIMARY KEY (volume_id),
CONSTRAINT fk_volume_medium_id FOREIGN KEY (medium_id) REFERENCES medium(id) ON DELETE CASCADE
);

CREATE TABLE chapter(
chapter_id NUMBER(10) NOT NULL,
title VARCHAR(256) NULL,
volume_id NUMBER(10) NOT NULL,
CONSTRAINT chapter_pk PRIMARY KEY (chapter_id),
CONSTRAINT fk_volume_id FOREIGN KEY (volume_id) REFERENCES volume(volume_id) ON DELETE CASCADE
);

CREATE TABLE episode(
ep_id NUMBER(10) NOT NULL,
title VARCHAR(256) NOT NULL,
episode_duration NUMBER(3) NULL,
medium_id NUMBER(10)NOT NULL,
CONSTRAINT episode_pk PRIMARY KEY (ep_id),
CONSTRAINT fk_episode_medium_id FOREIGN KEY (medium_id) REFERENCES Medium(id) on DELETE CASCADE
);


CREATE TABLE user_info(
username VARCHAR(256) NOT NULL,
password VARCHAR(256) NOT NULL,
CONSTRAINT user_pk PRIMARY KEY (username)
);


CREATE TABLE review(
review_date DATE DEFAULT SYSDATE NOT NULL,
review_content VARCHAR(2048) NOT NULL,
medium_id NUMBER(10) NOT NULL,
username VARCHAR(256) NOT NULL,
CONSTRAINT review_pk PRIMARY KEY (review_date, medium_id,username),
CONSTRAINT fk_review_medium_id FOREIGN KEY (medium_id) REFERENCES Medium(ID) ON DELETE CASCADE,
CONSTRAINT fk_review_username FOREIGN KEY (username) REFERENCES user_info(username) ON DELETE CASCADE
);


CREATE TABLE consumed_media(
consume_date DATE DEFAULT SYSDATE NOT NULL,
medium_id NUMBER(10) NOT NULL,
username VARCHAR(256) NOT NULL,
CONSTRAINT consumed_media_pk PRIMARY KEY (consume_date, medium_id, username),
CONSTRAINT fk_consumed_media_medium_id FOREIGN KEY (medium_id) REFERENCES Medium(ID) ON DELETE CASCADE,
CONSTRAINT fk_consumed_media_username FOREIGN KEY (username) REFERENCES user_info(username) ON DELETE CASCADE
);
