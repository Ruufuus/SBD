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
PROCEDURE edit_Studio
(
pname studio.name%type,
pname2 studio.name%type
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
IS vExist numeric;
BEGIN 
    select count(*) into vExist from MEDIUM where id=pid AND medium.medium='MANGA';
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrana manga nie istnieje w bazie danych!');
    end if;
    UPDATE MEDIUM SET
    title=ptitle,
    author_id=pauthor_id,
    genre=pgenre,
    volumes=pvolumes,
    chapters=pchapters,
    publishing_type=ppublishing_type,
    published_date=ppublished_date,
    ilustrator_id=pilustrator_id
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
IS vExist numeric;
BEGIN 
    select count(*) into vExist from MEDIUM where id=pid AND medium.medium='ANIME';
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrane anime nie istnieje w bazie danych!');
    end if;
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
IS vExist numeric;
BEGIN 
    select count(*) into vExist from MEDIUM where id=pid AND medium.medium='LIGHT NOVEL';
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrana Light Novel nie istnieje w bazie danych!');
    end if;
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
IS 
vExist numeric;
BEGIN 
    select count(*) into vExist from volume WHERE volume_id=pvolume_id;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrany tom nie istnieje w bazie danych!');
    end if;
    UPDATE Volume SET
    volume_number=pvolume_number,
    medium_id=pmedium_id
	WHERE
	volume_id=pvolume_id;
END;

PROCEDURE edit_Studio
(
pname studio.name%type,
pname2 studio.name%type
)
IS 
vExist numeric;
BEGIN 
    select count(*) into vExist from studio WHERE name=pname;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrane studio nie istnieje w bazie danych!');
    end if;
    UPDATE studio SET
    name=pname2
	WHERE
	name=pname;
END;

PROCEDURE edit_Chapter
(
pchapter_id Chapter.chapter_id%type,
ptitle Chapter.title%type,
pvolume_id Chapter.volume_id%type
)
IS 
vExist numeric; 
BEGIN 
    select count(*) into vExist from chapter WHERE chapter_id=pchapter_id;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrany roździal nie istnieje w bazie danych!');
    end if;
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
IS 
vExist numeric; 
BEGIN 
    select count(*) into vExist from Episode WHERE pep_id=ep_id;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrany odcinek nie istnieje w bazie danych!');
    end if;
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
IS 
vExist numeric; 
BEGIN 
    select count(*) into vExist from Ilustrator  WHERE 
	pilustrator_id=ilustrator_id;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrany ilustrator nie istnieje w bazie danych!');
    end if;
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
IS 
vExist numeric;
BEGIN
select count(*) into vExist from Author  WHERE 
	pauthor_id = author_id;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrany autor nie istnieje w bazie danych!');
    end if;
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
IS 
vExist numeric;
BEGIN
select count(*) into vExist from REVIEW  WHERE
	preview_date=review_date and
	pmedium_id = medium_id and
	pusername = username;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrana recenzja nie istnieje w bazie danych!');
    end if;
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
IS 
vExist numeric;
BEGIN
select count(*) into vExist from user_info  WHERE
	pusername = username;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrany użykownik nie istnieje w bazie danych!');
    end if;
UPDATE user_info SET
    password=ppassword
	WHERE
	username=pusername;
END;

END edit_package;
