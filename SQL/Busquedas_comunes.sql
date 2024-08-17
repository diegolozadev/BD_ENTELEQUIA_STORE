--Query para ver el listado de clientes
SELECT 
	CONCAT_WS('', c.nombre, c.apellidos) 	as cliente,
	c.email									as correo,
	c.telefono								as telefono
FROM public.clientes as c;

************************************************************************************************

--Query para ver el listado de inventario, ordenados de mayor cantidad a menor cantidad.
SELECT 
	id_inventario 			as id_I,
	nombre_producto 		as "Nombre Producto",
	cantidad_disponible 	as "Stock"
FROM public.inventario
INNER JOIN
	productos
ON
	inventario.id_producto = productos.id_producto
ORDER BY cantidad_disponible DESC

************************************************************************************************

--Query para ver los empleados, su puesto y salario.
-- Ordenados del salario mas alto al mas bajo.
SELECT 
	e.id_empleado							as "ID Empleado",
	concat_ws(' ', e.nombre, e.apellidos) 	as Empleado,
	e.puesto								as Puesto,
	e.salario								as Salario
FROM public.empleados as e
ORDER BY e.salario DESC

************************************************************************************************
