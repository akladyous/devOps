DROP FUNCTION IF EXISTS rand_timestamp_between;
CREATE FUNCTION rand_timestamp_between(start_time timestamp, end_time timestamp)
RETURNS timestamp AS $$
BEGIN
  RETURN start_time + random() * (end_time - start_time);
END;
$$ LANGUAGE plpgsql;
