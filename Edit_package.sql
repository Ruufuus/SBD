CREATE OR REPLACE PACKAGE edit_package IS
PROCEDURE edit_Manga
(
pid Medium.id%type,
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
PROCEDURE edit_Anime
(
pid Medium.id%type,
ptitle Medium.title%type,
pstudio_name Medium.studio_name%type,
pgenre Medium.genre%type default null,
pmedium Medium.medium%type default null,
pepisodes Medium.episodes%type default null,
ptype Medium.type%type default null
);
PROCEDURE edit_Light_Novel
(
pid Medium.id%type,
ptitle Medium.title%type,
pauthor_id Medium.author_id%type,
pgenre Medium.genre%type default null,
pmedium Medium.medium%type default null,
pvolumes Medium.volumes%type default null,
ppublished_date Medium.published_date%type default null
);
PROCEDURE edit_Volume
(
pvolume_id Volume.volume_id%type,
pvolume_number Volume.volume_number%type,
pmedium_id Volume.medium_id%type
);
PROCEDURE edit_Chapter
(
pchapter_id Chapter.chapte_id%type,
ptitle Chapter.title%type,
pvolume_id Chapter.volume_id%type
);
PROCEDURE edit_Episode
(
pep_id Episode.ep_id%type,
ptitle Episode.title%type,
pepisode_duration Episode.episode_duration%type default null,
pmedium_id Episode.medium_id%type
);
PROCEDURE edit_Studio
(
pname Studio.name%type,
pnew_name Studio.name%type
);
PROCEDURE edit_Ilustrator
(
pilustrator_id Ilustrator.ilustrator_id%type,
pname Ilustrator.name%type,
psurname Ilustrator.surname%type
);
PROCEDURE edit_author
(
pauthor_id Author.author_id%type,
pname Author.name%type,
psurname Author.surname%type,
pbirthdate Author.birthdate%type default null,
pgender Author.gender%type default null
);

END edit_package;
/
CREATE OR REPLACE PACKAGE BODY edit_package IS
PROCEDURE edit_Manga
(
pid Medium.id%type,
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
    UPDATE MEDIUM
    (title,author_id,genre,medium.medium,
    volumes,chapters,publishing_type,
    published_date
    )
    VALUES
    (ptitle,pauthor_id,pgenre,pmedium,
    pvolumes,pchapters,ppublishing_type,
    ppublished_date)
	WHERE
	id=pid;
END;

PROCEDURE edit_Anime
(
pid Medium.id%type,
ptitle Medium.title%type,
pstudio_name Medium.studio_name%type,
pgenre Medium.genre%type default null,
pmedium Medium.medium%type default null,
pepisodes Medium.episodes%type default null,
ptype Medium.type%type default null
)
IS BEGIN 
    UPDATE MEDIUM
    (title,studio_name,genre,medium,
    episodes,type
    )
    VALUES
    (ptitle,pstudio_name,pgenre,pmedium,
    pepisodes,ptype)
	WHERE
	id=pid;
END;

PROCEDURE edit_Light_Novel
(
pid Medium.id%type,
ptitle Medium.title%type,
pauthor_id Medium.author_id%type,
pgenre Medium.genre%type default null,
pmedium Medium.medium%type default null,
pvolumes Medium.volumes%type default null,
ppublished_date Medium.published_date%type default null
)
IS BEGIN 
    UPDATE MEDIUM
    (title,author_id,genre,medium,
    volumes,published_date
    )
    VALUES
    (ptitle,pauthor_id,pgenre,pmedium,
    pvolumes,ppublished_date)
	where
	id=pid;
END;

PROCEDURE edit_Volume
(
pvolume_id Volume.volume_id%type,
pvolume_number Volume.volume_number%type,
pmedium_id Volume.medium_id%type
)
IS BEGIN 
    UPDATE Volume
    (volume_number,medium_id)
    VALUES
    (pvolume_number,pmedium_id)
	WHERE
	volume_id=pvolume_id;
END;

PROCEDURE edit_Chapter
(
pchapter_id Chapter.chapter_id%type,
ptitle Chapter.title%type,
pvolume_id Chapter.volume_id%type
)
IS BEGIN 
    UPDATE Chapter
    (title,volume_id)
    values
    (ptitle,pvolume_id)
	WHERE
	chapter_id=pchapter_id;
END;

PROCEDURE edit_Episode
(
pep_id Episode.ep_id%type,
ptitle Episode.title%type,
pepisode_duration episode.episode_duration%type default null,
pmedium_id Episode.medium_id%type
)
IS BEGIN 
    update Episode
    (title,episode_duration,medium_id)
    values
    (ptitle,pepisode_duration,pmedium_id)
	where
	pep_id=ep_id;
END;

PROCEDURE edit_Studio
(
pname Studio.name%type,
pnew_name Studio.name%type
)
IS BEGIN 
    update Studio
    (name)
    values
    (pnew_name)
	where
	pname = name;
END;

PROCEDURE edit_Ilustrator
(
pilustrator_id Ilustrator.ilustrator_id%type,
pname Ilustrator.name%type,
psurname Ilustrator.surname%type
)
IS BEGIN 
    UPDATE Ilustrator
    (name,surname)
    values
    (pname,psurname)
	WHERE
	pilustrator_id=ilustrator_id;
END;

PROCEDURE edit_author
(
pauthor_id Author.author_id%type,
pname Author.name%type,
psurname Author.surname%type,
pbirthdate Author.birthdate%type default null,
pgender Author.gender%type default null
)
IS BEGIN
INSERT INTO Author
    (name,surname,birthdate,gender)
    values
    (pname,psurname,pbirthdate,pgender)
	WHERE
	pauthor_id = author_id;
END;

