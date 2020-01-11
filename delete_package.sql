CREATE OR REPLACE PACKAGE delete_package IS
PROCEDURE delete_Manga
(
pid Medium.id%type,
pmedium Medium.medium%type
);
PROCEDURE delete_Anime
(
pid Medium.id%type,
pmedium Medium.medium%type
);
PROCEDURE delete_Light_Novel
(
pid Medium.id%type,
pmedium Medium.medium%type
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
pid Medium.id%type,
pmedium Medium.medium%type
)
IS BEGIN 
    DELETE FROM MEDIUM
	WHERE
	id=pid AND medium.medium=pmedium;
END;

PROCEDURE delete_Anime
(
pid Medium.id%type,
pmedium Medium.medium%type
)
IS BEGIN 
    DELETE FROM MEDIUM 
	WHERE
	id=pid AND medium.medium=pmedium;
END;

PROCEDURE delete_Light_Novel
(
pid Medium.id%type,
pmedium Medium.medium%type
)
IS BEGIN 
    DELETE FROM MEDIUM 
	where
	id=pid AND medium.medium=pmedium;
END;

PROCEDURE delete_Volume
(
pvolume_id Volume.volume_id%type
)
IS BEGIN 
    DELETE FROM Volume 
	WHERE
	volume_id=pvolume_id;
END;

PROCEDURE delete_Chapter
(
pchapter_id Chapter.chapter_id%type
)
IS BEGIN 
    DELETE FROM Chapter 
	WHERE
	chapter_id=pchapter_id;
END;

PROCEDURE delete_Episode
(
pep_id Episode.ep_id%type
)
IS BEGIN 
    DELETE FROM Episode 
	where
	pep_id=ep_id;
END;


PROCEDURE delete_Ilustrator
(
pilustrator_id Ilustrator.ilustrator_id%type
)
IS BEGIN 
    DELETE FROM Ilustrator 
	WHERE
	pilustrator_id=ilustrator_id;
END;

PROCEDURE delete_author
(
pauthor_id Author.author_id%type
)
IS BEGIN
DELETE FROM Author 
	WHERE
	pauthor_id = author_id;
END;

PROCEDURE delete_studio
(
pname Studio.name%type
)
IS BEGIN
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
IS BEGIN
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
IS BEGIN
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
IS BEGIN
DELETE FROM consumed_media 
	WHERE
	pconsume_date = consume_date and 
pmedium_id=medium_id and 
pusername=username;
END;
END delete_package;


