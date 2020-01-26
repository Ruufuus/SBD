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
pusername Review.username%type,
pmedium_id2 Review.medium.id%type,
pusername2 Review.username%type,
preview_date2 Review.Review_date%type
);

PROCEDURE edit_consumed_media
(
pconsume_date Consumed_media.consume_date%type,
pmedium_id Consumed_media.medium_id%type,
pusername Consumed_media.username%type,
pmedium_id2 Consumed_media.medium.id%type,
pusername2 Consumed_media.username%type,
pconsume_date2 Consumed_media.consume_date%type
);


PROCEDURE edit_user_info
(
pusername user_info.username%type,
ppassword user_info.password%type,
pusername2 user_info.username%type
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
IS 
vExist numeric;
vUnique numeric;
BEGIN 
    select count(*) into vExist from MEDIUM where id=pid AND medium.medium='MANGA';
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrana manga nie istnieje w bazie danych!');
    end if;
    select count(*) into vUnique from MEDIUM where title=ptitle AND medium.medium='MANGA' and pid!=id;
    if(vUnique > 0) then 
    RAISE_APPLICATION_ERROR(-20001, 'Manga o podanym tytule już istnieje w bazie danych!');
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
	id=pid AND medium.medium='MANGA';
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
vUnique numeric;
BEGIN 
    select count(*) into vExist from MEDIUM where id=pid AND medium.medium='ANIME';
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrane anime nie istnieje w bazie danych!');
    end if;
    select count(*) into vUnique from MEDIUM where title=ptitle AND medium.medium='ANIME' and pid!=id;
    if(vUnique > 0) then 
    RAISE_APPLICATION_ERROR(-20001, 'Anime o podanym tytule już istnieje w bazie danych!');
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
vUnique numeric;
BEGIN 
    select count(*) into vExist from MEDIUM where id=pid AND medium.medium='LIGHT NOVEL';
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrana Light Novel nie istnieje w bazie danych!');
    end if;
    select count(*) into vUnique from MEDIUM where title=ptitle AND medium.medium='LIGHT NOVEL' and pid!=id;
    if(vUnique > 0) then 
    RAISE_APPLICATION_ERROR(-20001, 'Light Novel o podanym tytule już istnieje w bazie danych!');
    end if;
    UPDATE MEDIUM SET
    title=ptitle,
    author_id=pauthor_id,
    genre=pgenre,
    volumes=pvolumes,
    published_date=ppublished_date
	where
	id=pid AND medium.medium='LIGHT NOVEL';
END;

PROCEDURE edit_Volume
(
pvolume_id Volume.volume_id%type,
pvolume_number Volume.volume_number%type,
pmedium_id Volume.medium_id%type
)
IS 
vExist numeric;
vUnique numeric;
BEGIN 
    select count(*) into vExist from volume WHERE volume_id=pvolume_id;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrany tom nie istnieje w bazie danych!');
    SELECT count(*) into vUnique FROM volume where volume_number=pvolume_number and medium_id=pmedium_id and pvolume_id!=volume_id;
    end if;
    if(vUnique > 0) then 
    RAISE_APPLICATION_ERROR(-20001, 'Tom o podanym numerze oraz przypisanym do niego medium już istnieje w bazie danych!');
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
vUnique numeric;
BEGIN 
    select count(*) into vExist from studio WHERE name=pname;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrane studio nie istnieje w bazie danych!');
    end if;
    select count(*) into vUnique from studio where name=pname2 and pname!=pname2;
    if(vUnique>0) then
    RAISE_APPLICATION_ERROR(-20001, 'Studio o podanej nazwie już istnieje w bazie danych!');
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
vUnique numeric;
BEGIN 
    select count(*) into vExist from chapter WHERE chapter_id=pchapter_id;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrany roździal nie istnieje w bazie danych!');
    end if;
    SELECT count(*) into vUnique FROM chapter where title=ptitle and volume_id=pvolume_id and pchapter_id!=chapter_id;
    if(vUnique > 0)then
    RAISE_APPLICATION_ERROR(-20001, 'Roździał o podanej nazwie już istnieje dla danego Tomu!');
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
vUnique numeric;
BEGIN 
    select count(*) into vExist from Episode WHERE pep_id=ep_id;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrany odcinek nie istnieje w bazie danych!');
    end if;
    SELECT count(ep_id) into vUnique FROM episode where title=ptitle and medium_id=pmedium_id and pep_id!=ep_id;
    if (vUnique>0) then
    RAISE_APPLICATION_ERROR(-20001, 'Odcinek o podanej nazwie dla danego anime już istnieje w bazie danych!');
END IF;
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
vUnique numeric;
BEGIN 
    select count(*) into vExist from Ilustrator  WHERE 
	pilustrator_id=ilustrator_id;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrany ilustrator nie istnieje w bazie danych!');
    end if;
    SELECT count(*) into vUnique FROM ilustrator where name=pname and surname=psurname and pilustrator_id!=ilustrator_id;
    if (vUnique>0) then
        RAISE_APPLICATION_ERROR(-20001, 'Ilustrator o podanym imieniu i nazwisku już istnieje w bazie danych!');
END IF;
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
vUnique numeric;
BEGIN
select count(*) into vExist from Author  WHERE 
	pauthor_id = author_id;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrany autor nie istnieje w bazie danych!');
    end if;
    SELECT count(author_id) into vUnique FROM author where name=pname and surname=psurname and pauthor_id!=author_id;
if (vUnique>0) then
    RAISE_APPLICATION_ERROR(-20001, 'Autor o podanym imieniu i nazwisku już istnieje w bazie danych!');
END IF;
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
pusername Review.username%type,
pmedium_id2 Review.medium.id%type,
pusername2 Review.username%type,
preview_date2 Review.Review_date%type
)
IS 

vUnique numeric;
vExist numeric;
BEGIN
select count(*) into vExist from REVIEW  WHERE
	preview_date=review_date and
	pmedium_id = medium_id and
	pusername = username;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrana recenzja nie istnieje w bazie danych!');
    end if;
    SELECT count(*) into vUnique FROM review where username=pusername and medium_id=pmedium_id and review_date=preview_date and 
    (preview_date!=preview_date2 or pusername!=pusername2 or pmedium_id!=pmedium_id2);
if (vUnique>0) then
    RAISE_APPLICATION_ERROR(-20001, 'Recenzja o podanej dacie, nazwie użytkownika oraz przypisanej do nich pozycji już istnieje w bazie danych!');
END IF;
UPDATE review SET
    review_content = preview_content,
    review_date=preview_date2,
    username=pusername2,
    medium_id=pmedium_id
	WHERE
	username=pusername and review_date=preview_date and medium_id=pmedium_id;
END;

PROCEDURE edit_consumed_media
(
pconsume_date Consumed_media.consume_date%type,
pmedium_id Consumed_media.medium_id%type,
pusername Consumed_media.username%type,
pmedium_id2 Consumed_media.medium.id%type,
pusername2 Consumed_media.username%type,
pconsume_date2 Consumed_media.consume_date%type
)
IS 

vUnique numeric;
vExist numeric;
BEGIN
select count(*) into vExist from Consumed_media  WHERE
	pconsume_date=consume_date and
	pmedium_id = medium_id and
	pusername = username;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrana recenzja nie istnieje w bazie danych!');
    end if;
    SELECT count(*) into vUnique FROM Consumed_media where username=pusername and medium_id=pmedium_id and consume_date=pconsume_date and 
    (pconsume_date!=pconsume_date or pusername!=pusername2 or pmedium_id!=pmedium_id2);
if (vUnique>0) then
    RAISE_APPLICATION_ERROR(-20001, 'Obejrzana pozycja o podanej dacie, nazwie użytkownika oraz przypisanym do niego medium już istnieje w bazie danych!');
END IF;
UPDATE review SET
    review_content = preview_content,
    consume_date=pconsume_date2,
    username=pusername2,
    medium_id=pmedium_id
	WHERE
	username=pusername and consume_date=pconsume_date and medium_id=pmedium_id;
END;


PROCEDURE edit_user_info
(
pusername user_info.username%type,
ppassword user_info.password%type,
pusername2 user_info.username%type
)
IS 
vExist numeric;
vUnique numeric;
BEGIN
select count(*) into vExist from user_info  WHERE
	pusername = username;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrany użykownik nie istnieje w bazie danych!');
    end if;
    SELECT count(*) into vUnique FROM user_info where username=pusername and pusername!=pusername2;
if (vUnique>0) then
    RAISE_APPLICATION_ERROR(-20001, 'Obejrzana pozycja o podanej dacie, nazwie użytkownika oraz przypisanym do niego medium już istnieje w bazie danych!');
END IF;
UPDATE user_info SET
    password=ppassword,
    username=pusername2
	WHERE
	username=pusername;
END;

END edit_package;
