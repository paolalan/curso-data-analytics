--agregar columna segmento a la tabla clientes
ALTER TABLE clientes
ADD segmento VARCHAR(50);

-- Agregar columna canal a la tabla ventas
ALTER TABLE ventas
ADD canal VARCHAR(20);

-- Asignar canal de venta
UPDATE ventas
SET canal = 'Online'
WHERE id_venta <= 5;

UPDATE ventas
SET canal = 'Presencial'
WHERE id_venta > 5;

--crear tabla Territorios
CREATE TABLE territorios (
    ciudad VARCHAR(50) PRIMARY KEY,
    region VARCHAR(50) NOT NULL
);

-- Cargar datos en territorios
INSERT INTO territorios (ciudad, region)
VALUES
('Buenos Aires', 'Centro'),
('Córdoba', 'Centro'),
('Rosario', 'Centro'),
('Mendoza', 'Cuyo'),
('Tucumán', 'Norte');

      -- Consulta 1: datos completos de las ventas
SELECT
    ventas.fecha_venta,
    clientes.nombre,
    clientes.segmento,
    territorios.region,
    productos.nombre_producto,
    categorias.nombre_categoria,
    ventas.cantidad,
    ventas.precio_unitario,
    ventas.cantidad * ventas.precio_unitario AS total_venta,
    ventas.canal
FROM ventas
INNER JOIN clientes
    ON ventas.id_cliente = clientes.id_cliente
INNER JOIN productos
    ON ventas.id_producto = productos.id_producto
INNER JOIN categorias
    ON productos.id_categoria = categorias.id_categoria
INNER JOIN territorios
    ON clientes.ciudad = territorios.ciudad;

    -- CONSULTA 2: Clientes sin ventas
SELECT
    clientes.nombre,
    clientes.email,
    clientes.fecha_registro
FROM clientes
LEFT JOIN ventas
    ON clientes.id_cliente = ventas.id_cliente
WHERE ventas.id_venta IS NULL;

-- CONSULTA 3: Productos sin ventas
SELECT
    productos.nombre_producto,
    categorias.nombre_categoria,
    productos.precio
FROM productos
LEFT JOIN ventas
    ON productos.id_producto = ventas.id_producto
LEFT JOIN categorias
    ON productos.id_categoria = categorias.id_categoria
WHERE ventas.id_venta IS NULL;

-- CONSULTA 4: Ventas por canal
SELECT
    id_venta,
    cantidad,
    precio_unitario,
    canal
FROM ventas
WHERE canal = 'Online';

SELECT
    id_venta,
    cantidad,
    precio_unitario,
    canal
FROM ventas
WHERE canal = 'Presencial';

-- CONSULTA 4: Ventas por canal
SELECT
    id_venta,
    cantidad,
    precio_unitario,
    canal
FROM ventas
WHERE canal = 'Online'

UNION ALL

SELECT
    id_venta,
    cantidad,
    precio_unitario,
    canal
FROM ventas
WHERE canal = 'Presencial';

-- Total de ventas por canal
SELECT
    canal,
    SUM(cantidad * precio_unitario) AS total_ventas
FROM ventas
GROUP BY canal;