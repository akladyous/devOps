DROP TABLE IF EXISTS orders CASCADE;

CREATE TABLE orders (
  order_id SERIAL,
  user_id INTEGER NOT NULL REFERENCES users(user_id),
  product_id INTEGER,
  paid BOOLEAN,
  purchased_at TIMESTAMP DEFAULT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(product_id) REFERENCES products(product_id) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(order_id)
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
            ( trunc( random() * ( 50   ) + 1 ) ),
            ( trunc( random() * ( 100  ) + 1 ) ),
            ( RANDOM()::INT::BOOLEAN ),
            ( current_timestamp - (  trunc( random() * ( 150 ) + 1 )  || 'days')::interval ),
            ( current_timestamp - (  trunc( random() * ( 365 ) + 1 )  || 'days')::interval )
        );

	raise notice 'generating data.. %', counter;
	counter := counter + 1;
   end loop;
end$$;

SELECT * FROM orders;
