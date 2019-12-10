CREATE OR REPLACE TRIGGER trig_chapter_id
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
CREATE OR REPLACE TRIGGER trig_volume_id
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
CREATE OR REPLACE TRIGGER trig_episode_id
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
CREATE OR REPLACE TRIGGER trig_author_id
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
CREATE OR REPLACE TRIGGER trig_ilustrator_id
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
CREATE OR REPLACE TRIGGER trig_medium_id
BEFORE
INSERT on Medium
FOR EACH ROW
DECLARE
BEGIN
if :new.id is null then
    :new.id:=seq_medium_id.NEXTVAL;
end if;
END;
