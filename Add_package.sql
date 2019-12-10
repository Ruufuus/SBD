CREATE OR REPLACE PACKAGE add_package IS
PROCEDURE add_Manga
(
ptitle Medium.title%type,
pauthor_id Medium.author_id%type,
pgenre Medium.genre%type default null,
pmedium Medium.medium%type default null,
pvolumes Medium.volumes%type default null,
pchapters Medium.chapters%type default null,
ppublishing_type Medium.publishing_type%type default null,
ppublished_date Medium.published_date%type default null,
pilustrator_id Medium.ilustrator_id%type default null
);
PROCEDURE add_Anime
(
ptitle Medium.title%type,
pstudio_name Medium.studio_name%type,
pgenre Medium.genre%type default null,
pmedium Medium.medium%type default null,
pepisodes Medium.episodes%type default null,
ptype Medium.type%type default null
);
PROCEDURE add_Light_Novel
(
ptitle Medium.title%type,
pauthor_id Medium.author_id%type,
pgenre Medium.genre%type default null,
pmedium Medium.medium%type default null,
pvolumes Medium.volumes%type default null,
ppublished_date Medium.published_date%type default null
);
PROCEDURE add_Volume
(
pvolume_number Volume.volume_number%type,
pmedium_id Volume.medium_id%type
);
PROCEDURE add_Chapter
(
ptitle Chapter.title%type,
pvolume_id Chapter.volume_id%type
);
PROCEDURE add_Episode
(
ptitle Episode.title%type,
pepisode_duration Episode.episode_duration%type default null,
pmedium_id Episode.medium_id%type
);
PROCEDURE add_Studio
(
pname Studio.name%type
);
PROCEDURE add_Ilustrator
(
pname Ilustrator.name%type,
psurname Ilustrator.surname%type
);
PROCEDURE add_author
(
pname Author.name%type,
psurname Author.surname%type,
pbirthdate Author.birthdate%type default null,
pgender Author.gender%type default null
);
PROCEDURE add_review
(
preview_date Review.Review_Date%type,
preview_content Review.review_content%type,
pmedium_id Review.medium_id%type,
pusername Review.username%type
);
PROCEDURE add_consumed_media
(
pconsume_date consumed_media.consume_date%type,
pmedium_id consumed_media.medium_id%type,
pusername consumed_media.username%type
);
END add_package;
/
CREATE OR REPLACE PACKAGE BODY add_package IS
PROCEDURE add_Manga
(
ptitle Medium.title%type,
pauthor_id Medium.author_id%type,
pgenre Medium.genre%type default null,
pmedium Medium.medium%type default null,
pvolumes Medium.volumes%type default null,
pchapters Medium.chapters%type default null,
ppublishing_type Medium.publishing_type%type default null,
ppublished_date Medium.published_date%type default null,
pilustrator_id Medium.ilustrator_id%type default null
)
IS BEGIN 
    INSERT INTO MEDIUM
    (title,author_id,genre,medium.medium,
    volumes,chapters,publishing_type,
    published_date
    )
    VALUES
    (ptitle,pauthor_id,pgenre,pmedium,
    pvolumes,pchapters,ppublishing_type,
    ppublished_date);
END;

PROCEDURE add_Anime
(
ptitle Medium.title%type,
pstudio_name Medium.studio_name%type,
pgenre Medium.genre%type default null,
pmedium Medium.medium%type default null,
pepisodes Medium.episodes%type default null,
ptype Medium.type%type default null
)
IS BEGIN 
    INSERT INTO MEDIUM
    (title,studio_name,genre,medium,
    episodes,type
    )
    VALUES
    (ptitle,pstudio_name,pgenre,pmedium,
    pepisodes,ptype);
END;

PROCEDURE add_Light_Novel
(
ptitle Medium.title%type,
pauthor_id Medium.author_id%type,
pgenre Medium.genre%type default null,
pmedium Medium.medium%type default null,
pvolumes Medium.volumes%type default null,
ppublished_date Medium.published_date%type default null
)
IS BEGIN 
    INSERT INTO MEDIUM
    (title,author_id,genre,medium,
    volumes,published_date
    )
    VALUES
    (ptitle,pauthor_id,pgenre,pmedium,
    pvolumes,ppublished_date);
END;

PROCEDURE add_Volume
(
pvolume_number Volume.volume_number%type,
pmedium_id Volume.medium_id%type
)
IS BEGIN 
    INSERT INTO Volume
    (volume_number,medium_id)
    VALUES
    (pvolume_number,pmedium_id);
END;

PROCEDURE add_Chapter
(
ptitle Chapter.title%type,
pvolume_id Chapter.volume_id%type
)
IS BEGIN 
    INSERT INTO Chapter
    (title,volume_id)
    values
    (ptitle,pvolume_id);
END;

PROCEDURE add_Episode
(
ptitle Episode.title%type,
pepisode_duration episode.episode_duration%type default null,
pmedium_id Episode.medium_id%type
)
IS BEGIN 
    INSERT INTO Episode
    (title,episode_duration,medium_id)
    values
    (ptitle,pepisode_duration,pmedium_id);
END;

PROCEDURE add_Studio
(
pname Studio.name%type
)
IS BEGIN 
    INSERT INTO Studio
    (name)
    values
    (pname);
END;

PROCEDURE add_Ilustrator
(
pname Ilustrator.name%type,
psurname Ilustrator.surname%type
)
IS BEGIN 
    INSERT INTO Ilustrator
    (name,surname)
    values
    (pname,psurname);
END;

PROCEDURE add_author
(
pname Author.name%type,
psurname Author.surname%type,
pbirthdate Author.birthdate%type default null,
pgender Author.gender%type default null
)
IS BEGIN
INSERT INTO Author
    (name,surname,birthdate,gender)
    values
    (pname,psurname,pbirthdate,pgender);
END;

PROCEDURE add_review
(
preview_date review.review_date%type,
preview_content Review.review_content%type,
pmedium_id Review.medium_id%type,
pusername Review.username%type
)
IS BEGIN
INSERT INTO Review
    (review_date,review_content,medium_id,username)
    values
    (preview_date,preview_content,pmedium_id,pusername);
END;

PROCEDURE add_consumed_media
(
pconsume_date consumed_media.consume_date%type,
pmedium_id consumed_media.medium_id%type,
pusername consumed_media.username%type
)
IS BEGIN
INSERT INTO consumed_media
    (consume_date,medium_id,username)
    values
    (pconsume_date,pmedium_id,pusername);
END;
END add_package;
