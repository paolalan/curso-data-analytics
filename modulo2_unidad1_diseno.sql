--crear tabla de clientes
CREATE TABLE clientes (
    ID_cliente INT,
    -- INT porque lo utilizamos para números enteros
    nombre VARCHAR(100),
    --VARCHAR porque el nombre es texto, con un máximo de hasta 100 caracteres y n indica el máximo
    perfil_bio TEXT,
    --TEXT se utiliza para textos largos
    fecha_registro DATE
    --DATE porque expresa la fecha de registro
);

--crear tabla de productos
CREATE TABLE productos(
id_producto INT,
-- INT porque lo utilizamos para números enteros
Descripcion VARCHAR(255),
--VARCHAR porque la descripción es texto, con un máximo de hasta 255 caracteres y n indica el máximo
precio DECIMAL(10,2),
--DECIMAL porque el 10 indica el máximo de dígitos y el 2 la cantidad de decimales 
esta_activo TINYINT
--TINYINT porque podemos usar números enteros pequeños, como 0 y 1
--para indicar si el producto está o no a la venta
);