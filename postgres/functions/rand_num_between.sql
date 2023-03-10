CREATE FUNCTION rand_num_between(min_val int, max_val int)
RETURNS int AS $$
BEGIN
  RETURN floor(random() * (max_val - min_val + 1) + min_val)::int;
END;
$$ LANGUAGE plpgsql;


