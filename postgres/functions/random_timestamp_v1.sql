DROP FUNCTION IF EXISTS rand_timestamp;
CREATE OR REPLACE FUNCTION rand_timestamp(PAST_X_YEARS integer DEFAULT 1)
	RETURNS timestamp AS $BODY$
DECLARE
	random_date date;
	random_time time =  concat((floor(random() * 23) + 1), 'hours')::interval +
                      concat((floor(random() * 59) + 1), 'minutes')::interval +
                      concat((floor(random() * 59) + 1), 'seconds')::interval;
BEGIN
	random_date = current_date -  ( floor( ( random() * ( ( 366 * past_x_years ) + 1 ) ) ) || 'days' )::interval;
	random_time = concat((floor(random() * 23) + 1), 'hours')::interval + concat((floor(random() * 59) + 1), 'minutes')::interval + concat((floor(random() * 59) + 1), 'seconds')::interval;
	return random_date + random_time;;
END;
$BODY$ LANGUAGE plpgsql;



DROP FUNCTION IF EXISTS rand_timestamp;
CREATE FUNCTION rand_timestamp(start_time timestamp, end_time timestamp)
RETURNS timestamp AS $$
BEGIN
  RETURN start_time + random() * (end_time - start_time);
END;
$$ LANGUAGE plpgsql;
