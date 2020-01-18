CREATE OR REPLACE TRIGGER chapter_id_trigger
BEFORE
INSERT on Chapter
FOR EACH ROW
DECLARE
BEGIN
if :new.chapter_id is null then
    :new.chapter_id:=seq_chapter_id.NEXTVAL;
end if;
END;
/
CREATE OR REPLACE TRIGGER volume_id_trigger
BEFORE
INSERT on Volume
FOR EACH ROW
DECLARE
BEGIN
if :new.volume_id is null then
    :new.volume_id:=seq_volume_id.NEXTVAL;
end if;
END;
/
CREATE OR REPLACE TRIGGER episode_id_trigger
BEFORE
INSERT on Episode
FOR EACH ROW
DECLARE
BEGIN
if :new.ep_id is null then
    :new.ep_id:=seq_episode_id.NEXTVAL;
end if;
END;
/
CREATE OR REPLACE TRIGGER author_id_trigger
BEFORE
INSERT on Author
FOR EACH ROW
DECLARE
BEGIN
if :new.author_id is null then
    :new.author_id:=seq_author_id.NEXTVAL;
end if;
END;
/
CREATE OR REPLACE TRIGGER ilustrator_id_trigger
BEFORE
INSERT on Ilustrator
FOR EACH ROW
DECLARE
BEGIN
if :new.ilustrator_id is null then
    :new.ilustrator_id:=seq_ilustrator_id.NEXTVAL;
end if;
END;
/
CREATE OR REPLACE TRIGGER medium_id_trigger
BEFORE
INSERT on Medium
FOR EACH ROW
DECLARE
BEGIN
if :new.id is null then
    :new.id:=seq_medium_id.NEXTVAL;
end if;
END;
