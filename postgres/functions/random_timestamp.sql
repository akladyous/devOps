DROP FUNCTION IF EXISTS rand_timestamp;
CREATE FUNCTION rand_timestamp(from_num_of_years integer default 1)
RETURNS timestamp AS $$
BEGIN
  RETURN  CURRENT_DATE
          -  ( FLOOR( ( RANDOM() * ( ( 366 * from_num_of_years ) + 1 ) ) ) || 'days' )::INTERVAL
          + (FLOOR(RANDOM() * 23) || 'HOUR'):: INTERVAL
          + (FLOOR(RANDOM() * 59) || 'MINUTE'):: INTERVAL
          + (FLOOR(RANDOM() * 59) || 'SECOND'):: INTERVAL;
END;
$$ LANGUAGE plpgsql;
