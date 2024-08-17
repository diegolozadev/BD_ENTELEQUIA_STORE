--Query para ver el listado de clientes
SELECT 
	CONCAT_WS('', c.nombre, c.apellidos) 	as cliente,
	c.email									as correo,
	c.telefono								as telefono
FROM public.clientes as c;