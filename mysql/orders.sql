DROP TABLE IF EXISTS orders CASCADE;

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    product_id INTEGER REFERENCES products(id),
    paid BOOLEAN,
	purchased_at TIMESTAMP DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

do $$
declare
   counter integer := 0;
begin
   while counter < 250 loop

	INSERT INTO orders
	(user_id ,product_id ,paid ,purchased_at ,created_at)
    VALUES
        (
            ( trunc( random() * ( 50  - 1 + 1 ) + 1 ) ),
            ( trunc( random() * ( 100 - 1 + 1 ) + 1 ) ),
            ( RANDOM()::INT::BOOLEAN ),
            ( current_timestamp - (  trunc( random() * ( 150-1+1 ) + 1 )  || 'days')::interval ),
            ( current_timestamp - (  trunc( random() * ( 365-1+1 ) + 1 )  || 'days')::interval )
        );

	raise notice 'generating data.. %', counter;
	counter := counter + 1;
   end loop;
end$$;

SELECT * FROM orders;
