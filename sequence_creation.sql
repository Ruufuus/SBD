DROP SEQUENCE episode_id_sequence;
DROP SEQUENCE volume_id_sequence;
DROP SEQUENCE chapter_id_sequence;
DROP SEQUENCE author_id_sequence;
DROP SEQUENCE medium_id_sequence;
DROP SEQUENCE ilustrator_id_sequence; 

CREATE SEQUENCE episode_id_sequence
    MINVALUE 0
    MAXVALUE 10000000000
    START WITH 0
    INCREMENT BY 1
    CACHE 20;
    
CREATE SEQUENCE volume_id_sequence
    MINVALUE 0
    MAXVALUE 10000000000
    START WITH 0
    INCREMENT BY 1
    CACHE 20;
    
CREATE SEQUENCE chapter_id_sequence
    MINVALUE 0
    MAXVALUE 10000000000
    START WITH 0
    INCREMENT BY 1
    CACHE 20;

    
CREATE SEQUENCE author_id_sequence
    MINVALUE 0
    MAXVALUE 10000000000
    START WITH 0
    INCREMENT BY 1
    CACHE 20;

CREATE SEQUENCE medium_id_sequence
    MINVALUE 0
    MAXVALUE 10000000000
    START WITH 0
    INCREMENT BY 1
    CACHE 20;    

CREATE SEQUENCE ilustrator_id_sequence
    MINVALUE 0
    MAXVALUE 10000000000
    START WITH 0
    INCREMENT BY 1
    CACHE 20;
