CREATE OR REPLACE PACKAGE edit_package IS
PROCEDURE edit_Manga
(
pid Medium.id%type,
ptitle Medium.title%type,
pauthor_id Medium.author_id%type,
pgenre Medium.genre%type default null,
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
pepisodes Medium.episodes%type default null,
ptype Medium.type%type default null
);
PROCEDURE edit_Light_Novel
(
pid Medium.id%type,
ptitle Medium.title%type,
pauthor_id Medium.author_id%type,
pgenre Medium.genre%type default null,
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
pchapter_id Chapter.chapter_id%type,
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

PROCEDURE edit_review
(
preview_date Review.Review_Date%type,
preview_content Review.review_content%type,
pmedium_id Review.medium_id%type,
pusername Review.username%type
);


PROCEDURE edit_user_info
(
pusername user_info.username%type,
ppassword user_info.password%type
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
pvolumes Medium.volumes%type default null,
pchapters Medium.chapters%type default null,
ppublishing_type Medium.publishing_type%type default null,
ppublished_date Medium.published_date%type default null,
pilustrator_id Medium.ilustrator_id%type default null
)
IS BEGIN 
    UPDATE MEDIUM SET
    title=ptitle,
    author_id=pauthor_id,
    genre=pgenre,
    volumes=pvolumes,
    chapters=pchapters,
    publishing_type=ppublishing_type,
    published_date=ppublished_date
	WHERE
	id=pid AND medium.medium='Manga';
END;

PROCEDURE edit_Anime
(
pid Medium.id%type,
ptitle Medium.title%type,
pstudio_name Medium.studio_name%type,
pgenre Medium.genre%type default null,
pepisodes Medium.episodes%type default null,
ptype Medium.type%type default null
)
IS BEGIN 
    UPDATE MEDIUM SET
    title=ptitle,
    studio_name=pstudio_name,
    genre=pgenre,
    episodes=pepisodes,
    type=ptype
	WHERE
	id=pid AND medium.medium='ANIME';
END;

PROCEDURE edit_Light_Novel
(
pid Medium.id%type,
ptitle Medium.title%type,
pauthor_id Medium.author_id%type,
pgenre Medium.genre%type default null,
pvolumes Medium.volumes%type default null,
ppublished_date Medium.published_date%type default null
)
IS BEGIN 
    UPDATE MEDIUM SET
    title=ptitle,
    author_id=pauthor_id,
    genre=pgenre,
    volumes=pvolumes,
    published_date=ppublished_date
	where
	id=pid AND medium.medium='Light Novel';
END;

PROCEDURE edit_Volume
(
pvolume_id Volume.volume_id%type,
pvolume_number Volume.volume_number%type,
pmedium_id Volume.medium_id%type
)
IS BEGIN 
    UPDATE Volume SET
    volume_number=pvolume_number,
    medium_id=pmedium_id
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
    UPDATE Chapter SET
    title = ptitle, 
    volume_id = pvolume_id
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
    update Episode SET
    title = ptitle,
    episode_duration = pepisode_duration,
    medium_id = pmedium_id
	where
	pep_id=ep_id;
END;


PROCEDURE edit_Ilustrator
(
pilustrator_id Ilustrator.ilustrator_id%type,
pname Ilustrator.name%type,
psurname Ilustrator.surname%type
)
IS BEGIN 
    UPDATE Ilustrator SET
    name=pname,surname=psurname
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
UPDATE Author SET
    name=pname,
    surname=psurname,
    birthdate=pbirthdate,
    gender=pgender
	WHERE
	pauthor_id = author_id;
END;

PROCEDURE edit_review
(
preview_date Review.Review_Date%type,
preview_content Review.review_content%type,
pmedium_id Review.medium_id%type,
pusername Review.username%type
)
IS BEGIN
UPDATE review SET
    review_content = preview_content
	WHERE
	username=pusername and review_date=preview_date and medium_id=pmedium_id;
END;


PROCEDURE edit_user_info
(
pusername user_info.username%type,
ppassword user_info.password%type
)
IS BEGIN
UPDATE user_info SET
    password=ppassword
	WHERE
	username=pusername;
END;

END edit_package;
