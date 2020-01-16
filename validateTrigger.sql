CREATE OR REPLACE  TRIGGER medium_validate_trigger
before insert or update of title on medium 
for each row
Declare
vCzyIstnieje numeric;
Begin 
SELECT count(id) into vCzyIstnieje FROM MEDIUM WHERE MEDIUM.MEDIUM=:NEW.medium AND TITLE = :NEW.title;
if vCzyIstnieje>0 then
    if :NEW.medium = 'MANGA' then
        RAISE_APPLICATION_ERROR(-20001, 'Manga o podanym tytule już istnieje w bazie danych!');
    END IF;
    if :NEW.medium = 'ANIME' then
        RAISE_APPLICATION_ERROR(-20001, 'Anime o podanym tytule już istnieje w bazie danych!');
    END IF;
    if :NEW.medium = 'LIGHT NOVEL' then
        RAISE_APPLICATION_ERROR(-20001, 'LightNovel o podanym tytule już istnieje w bazie danych!');
    END IF;
END IF;
END;

CREATE OR REPLACE  TRIGGER author_validate_trigger
before insert or update of name,surname on author 
for each row
Declare
vCzyIstnieje numeric;
Begin 
SELECT count(author_id) into vCzyIstnieje FROM author where name=:NEW.name and surname=:NEW.surname;
if vCzyIstnieje>0 then
    RAISE_APPLICATION_ERROR(-20001, 'Autor o podanym imieniu i nazwisku już istnieje w bazie danych!');
END IF;
END;

CREATE OR REPLACE  TRIGGER episode_validate_trigger
before insert or update of title,medium_id on episode 
for each row
Declare
vCzyIstnieje numeric;
Begin 
SELECT count(ep_id) into vCzyIstnieje FROM episode where title=:NEW.title and medium_id=:NEW.medium_id;
if vCzyIstnieje>0 then
    RAISE_APPLICATION_ERROR(-20001, 'Odcinek o podanej nazwie dla danego anime już istnieje w bazie danych!');
END IF;
END;

CREATE OR REPLACE  TRIGGER ilustrator_validate_trigger
before insert or update of name,surname on ilustrator 
for each row
Declare
vCzyIstnieje numeric;
Begin 
SELECT count(*) into vCzyIstnieje FROM ilustrator where name=:NEW.name and surname=:NEW.surname;
if vCzyIstnieje>0 then
    RAISE_APPLICATION_ERROR(-20001, 'Ilustrator o podanym imieniu i nazwisku już istnieje w bazie danych!');
END IF;
END;

CREATE OR REPLACE  TRIGGER studio_validate_trigger
before insert or update of name on studio 
for each row
Declare
vCzyIstnieje numeric;
Begin 
SELECT count(*) into vCzyIstnieje FROM studio where name=:NEW.name;
if vCzyIstnieje>0 then
    RAISE_APPLICATION_ERROR(-20001, 'Studio o podanej nazwie już istnieje w bazie danych!');
END IF;
END;

CREATE OR REPLACE  TRIGGER review_validate_trigger
before insert or update of review_date,medium_id,username on review 
for each row
Declare
vCzyIstnieje numeric;
Begin 
SELECT count(*) into vCzyIstnieje FROM review where review_date=:NEW.review_date and medium_id=:NEW.medium_id and username=:NEW.username;
if vCzyIstnieje>0 then
    RAISE_APPLICATION_ERROR(-20001, 'Recenzja o podanej dacie, nazwie użytkownika oraz przypisanej do nich pozycji już istnieje w bazie danych!');
END IF;
END;

CREATE OR REPLACE  TRIGGER validate_user_info
before insert or update of username on user_info 
for each row
Declare
vCzyIstnieje numeric;
Begin 
SELECT count(*) into vCzyIstnieje FROM user_info where username=:NEW.username;
if vCzyIstnieje>0 then
    RAISE_APPLICATION_ERROR(-20001, 'Użytkownik o podanej nazwie użytkownika istnieje już w bazie danych!');
END IF;
END;


CREATE OR REPLACE  TRIGGER consumed_media_validate_trigger
before insert or update of consume_date,medium_id,username on consumed_media 
for each row
Declare
vCzyIstnieje numeric;
Begin 
SELECT count(*) into vCzyIstnieje FROM consumed_media where consume_date=:NEW.consume_date and medium_id=:NEW.medium_id and username=:NEW.username;
if vCzyIstnieje>0 then
    RAISE_APPLICATION_ERROR(-20001, 'Obejrzana pozycja o podanej dacie, nazwie użytkownika oraz przypisanym do niego medium już istnieje w bazie danych!');
END IF;
END;



CREATE OR REPLACE  TRIGGER volume_validate_trigger
before insert or update of volume_number,medium_id on volume 
for each row
Declare
vCzyIstnieje numeric;
Begin 
SELECT count(*) into vCzyIstnieje FROM volume where volume_number=:NEW.volume_number and medium_id=:NEW.medium_id;
if vCzyIstnieje>0 then
    RAISE_APPLICATION_ERROR(-20001, 'Tom o podanym numerze oraz przypisanym do niego medium już istnieje w bazie danych!');
END IF;
END;

CREATE OR REPLACE  TRIGGER chapter_validate_trigger
before insert or update of title on chapter 
for each row
WHEN(NEW.title is not null)
Declare
vCzyIstnieje numeric;
vTitle varchar(2);
Begin 
SELECT count(*) into vCzyIstnieje FROM chapter where title=:NEW.title and volume_id=:NEW.volume_id;
if vCzyIstnieje>0 then
    RAISE_APPLICATION_ERROR(-20001, 'Roździa o ponaje nazwie już istnieje dla danego Tomu!');
END IF;
END;