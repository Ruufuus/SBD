CREATE OR REPLACE PACKAGE delete_package IS
PROCEDURE delete_Manga
(
pid Medium.id%type
);
PROCEDURE delete_Anime
(
pid Medium.id%type
);
PROCEDURE delete_Light_Novel
(
pid Medium.id%type
);
PROCEDURE delete_Volume
(
pvolume_id Volume.volume_id%type
);
PROCEDURE delete_Chapter
(
pchapter_id Chapter.chapter_id%type
);
PROCEDURE delete_Episode
(
pep_id Episode.ep_id%type
);
PROCEDURE delete_Ilustrator
(
pilustrator_id Ilustrator.ilustrator_id%type
);
PROCEDURE delete_author
(
pauthor_id Author.author_id%type
);
PROCEDURE delete_studio
(
pname Studio.name%type
);
PROCEDURE delete_review
(
preview_date Review.Review_Date%type,
pmedium_id Review.medium_id%type,
pusername Review.username%type
);
PROCEDURE delete_user_info
(
pusername user_info.username%type
);
PROCEDURE delete_consumed_media
(
pconsume_date consumed_media.consume_date%type,
pmedium_id consumed_media.medium_id%type,
pusername consumed_media.username%type
);
END delete_package;
/
CREATE OR REPLACE PACKAGE BODY delete_package IS
PROCEDURE delete_Manga
(
pid Medium.id%type
)
IS 
vExist numeric;
BEGIN 
    select count(*) into vExist from MEDIUM where id=pid AND medium.medium='MANGA';
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrana manga nie istnieje w bazie danych!');
    end if;
    DELETE FROM MEDIUM
	WHERE
	id=pid AND medium.medium='MANGA';
END;

PROCEDURE delete_Anime
(
pid Medium.id%type
)
IS 
vExist numeric;
BEGIN 
    select count(*) into vExist from MEDIUM where id=pid AND medium.medium='ANIME';
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrane anime nie istnieje w bazie danych!');
    end if;
    DELETE FROM MEDIUM 
	WHERE
	id=pid AND medium.medium='ANIME';
END;

PROCEDURE delete_Light_Novel
(
pid Medium.id%type
)
IS 
vExist numeric;
BEGIN 
    select count(*) into vExist from MEDIUM where id=pid AND medium.medium='LIGHT NOVEL';
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrana Light Novel nie istnieje w bazie danych!');
    end if;
    DELETE FROM MEDIUM 
	where
	id=pid AND medium.medium='LIGHT NOVEL';
END;

PROCEDURE delete_Volume
(
pvolume_id Volume.volume_id%type
)
IS 
vExist numeric;
BEGIN 
    select count(*) into vExist from volume WHERE volume_id=pvolume_id;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrany tom nie istnieje w bazie danych!');
    end if;
    DELETE FROM Volume 
	WHERE
	volume_id=pvolume_id;
END;

PROCEDURE delete_Chapter
(
pchapter_id Chapter.chapter_id%type
)
IS
vExist numeric; 
BEGIN 
    select count(*) into vExist from chapter WHERE chapter_id=pchapter_id;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrany roździal nie istnieje w bazie danych!');
    end if;
    DELETE FROM Chapter 
	WHERE
	chapter_id=pchapter_id;
END;

PROCEDURE delete_Episode
(
pep_id Episode.ep_id%type
)
IS
vExist numeric; 
BEGIN 
    select count(*) into vExist from Episode WHERE pep_id=ep_id;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrany odcinek nie istnieje w bazie danych!');
    end if;
    DELETE FROM Episode 
	where
	pep_id=ep_id;
END;


PROCEDURE delete_Ilustrator
(
pilustrator_id Ilustrator.ilustrator_id%type
)
IS
vExist numeric; 
BEGIN 
    select count(*) into vExist from Ilustrator  WHERE 
	pilustrator_id=ilustrator_id;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrany ilustrator nie istnieje w bazie danych!');
    end if;
    DELETE FROM Ilustrator 
	WHERE
	pilustrator_id=ilustrator_id;
END;

PROCEDURE delete_author
(
pauthor_id Author.author_id%type
)
IS 
vExist numeric;
BEGIN
select count(*) into vExist from Author  WHERE 
	pauthor_id = author_id;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrany autor nie istnieje w bazie danych!');
    end if;
DELETE FROM Author 
	WHERE
	pauthor_id = author_id;
END;

PROCEDURE delete_studio
(
pname Studio.name%type
)
IS 
vExist numeric;
BEGIN
select count(*) into vExist from Studio  WHERE 
	pname = name;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrane studio nie istnieje w bazie danych!');
    end if;
DELETE FROM Studio 
	WHERE
	pname = name;
END;

PROCEDURE delete_review
(
preview_date Review.Review_Date%type,
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
    RAISE_APPLICATION_ERROR(-20002, 'Wybrane studio nie istnieje w bazie danych!');
    end if;
DELETE FROM REVIEW 
	WHERE
	preview_date=review_date and
	pmedium_id = medium_id and
	pusername = username;
END;

PROCEDURE delete_user_info
(
pusername user_info.username%type
)
IS 
vExist numeric;
BEGIN
select count(*) into vExist from user_info  WHERE
	pusername = username;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrany użykownik nie istnieje w bazie danych!');
    end if;
DELETE FROM user_info
	WHERE
	pusername = username;
END;

PROCEDURE delete_consumed_media
(
pconsume_date consumed_media.consume_date%type,
pmedium_id consumed_media.medium_id%type,
pusername consumed_media.username%type
)
IS 
vExist numeric;
BEGIN
select count(*) into vExist from consumed_media  WHERE pconsume_date = consume_date and 
pmedium_id=medium_id and 
pusername=username;
    if(vExist = 0) then 
    RAISE_APPLICATION_ERROR(-20002, 'Wybrana obejrzana pozycja nie istnieje w bazie danych!');
    end if;
DELETE FROM consumed_media 
	WHERE
	pconsume_date = consume_date and 
pmedium_id=medium_id and 
pusername=username;
END;
END delete_package;


