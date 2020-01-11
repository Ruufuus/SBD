CREATE OR REPLACE PACKAGE statistics_package IS

FUNCTION Medium_Count 
	RETURN NUMBER;

FUNCTION Manga_Count 
	RETURN NUMBER;
	
FUNCTION Light_Novel_Count 
	RETURN NUMBER;	

FUNCTION Anime_Count 
	RETURN NUMBER;
	
FUNCTION User_info_Count 
	RETURN NUMBER;

FUNCTION review_Count 
	RETURN NUMBER;
	
FUNCTION consumed_media_Count 
	RETURN NUMBER;
	
END statistics_package;
/
CREATE OR REPLACE PACKAGE BODY statistics_package IS

FUNCTION Medium_Count 
RETURN NUMBER IS
    vmedium_count NUMBER;
BEGIN
	select count(*) into vmedium_count from medium;
    RETURN vmedium_count;
END Medium_Count;

FUNCTION Manga_Count 
RETURN NUMBER IS
    vmanga_count NUMBER;
BEGIN
	select count(*) into vmanga_count from medium where medium.medium='Manga';
    RETURN vmanga_count;
END manga_Count;

FUNCTION anime_Count 
RETURN NUMBER IS
    vanime_count NUMBER;
BEGIN
	select count(*) into vanime_count from medium where medium.medium='Anime';
    RETURN vanime_count;
END anime_Count;

FUNCTION light_novel_Count 
RETURN NUMBER IS
    vlight_novel_count NUMBER;
BEGIN
	select count(*) into vlight_novel_count from medium where medium.medium='Light novel';
    RETURN vlight_novel_count;
END light_novel_Count;

FUNCTION user_info_count 
RETURN NUMBER IS
    vuser_info_count NUMBER;
BEGIN
	select count(*) into vuser_info_count from user_info;
    RETURN vuser_info_count;
END user_info_count;

FUNCTION review_count 
RETURN NUMBER IS
    vreviewo_count NUMBER;
BEGIN
	select count(*) into vreviewo_count from review;
    RETURN vreviewo_count;
END review_count;

FUNCTION consumed_media_count 
RETURN NUMBER IS
    vmedia_count NUMBER;
BEGIN
	select count(*) into vmedia_count from consumed_media;
    RETURN vmedia_count;
END consumed_media_count;

END statistics_package;


