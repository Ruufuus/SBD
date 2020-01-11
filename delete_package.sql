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
END delete_package;
/
CREATE OR REPLACE PACKAGE BODY delete_package IS
PROCEDURE delete_Manga
(
pid Medium.id%type
)
IS BEGIN 
    DELETE FROM MEDIUM
	WHERE
	id=pid;
END;

PROCEDURE delete_Anime
(
pid Medium.id%type
)
IS BEGIN 
    DELETE FROM MEDIUM 
	WHERE
	id=pid;
END;

PROCEDURE delete_Light_Novel
(
pid Medium.id%type
)
IS BEGIN 
    DELETE FROM MEDIUM 
	where
	id=pid;
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
END delete_package;


