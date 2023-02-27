
DROP function IF EXISTS RANDOM_NUMBER ;
DELIMITER $$
CREATE FUNCTION RANDOM_NUMBER (min int, max int)
RETURNS INTEGER
DETERMINISTIC
BEGIN
	declare rand_num integer;
    set rand_num = truncate( ( min + rand() * ( max - min) ), 0 );
RETURN rand_num;
END$$
DELIMITER ;


select RANDOM_NUMBER(100,200);

