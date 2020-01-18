CREATE OR REPLACE TRIGGER chapter_id_trigger
BEFORE
INSERT on Chapter
FOR EACH ROW
DECLARE
BEGIN
if :new.chapter_id is null then
    :new.chapter_id:=chapter_id_sequence.NEXTVAL;
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
    :new.volume_id:=volume_id_sequence.NEXTVAL;
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
    :new.ep_id:=episode_id_sequence.NEXTVAL;
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
    :new.author_id:=author_id_sequence.NEXTVAL;
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
    :new.ilustrator_id:=ilustrator_id_sequence.NEXTVAL;
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
    :new.id:=medium_id_sequence.NEXTVAL;
end if;
END;
