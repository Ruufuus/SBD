CREATE OR REPLACE PACKAGE statistics_package IS

FUNCTION MediumCount 
	RETURN NUMBER;



END statistics_package;
/
CREATE OR REPLACE PACKAGE BODY statistics_package IS

FUNCTION MediumCount 
RETURN NUMBER IS
    vmediumcount NUMBER;
BEGIN
	select count(*) into vmediumcount from medium;
    RETURN vmediumcount;
END MediumCount;


END statistics_package;


