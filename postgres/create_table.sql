SELECT 'CREATE DATABASE practice'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'practice') ;



DO $$
declare
	db_name varchar(50) := 'practice1';
-- 	q varchar(100) := 'CREATE DATABASE %', db_name;
BEGIN
   IF EXISTS (SELECT FROM pg_database WHERE datname = db_name) THEN
    RAISE NOTICE 'Database already exists';
   ELSE
--    	PERFORM dblink_exec('CREATE DATABASE ', db_name);
	PERFORM dblink_exec('dbname=' || current_database() , 'CREATE DATABASE ' || quote_ident(db_name));
	RAISE NOTICE 'Database created successfully';
   END IF;

END $$;
