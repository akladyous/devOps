select 
	name,
	price,
	case
		when price >= 600 then 'hight'
		when price >= 300 then 'medium'
		else 'cheap'
	end
	from products;