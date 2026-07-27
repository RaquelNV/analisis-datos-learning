Vamos a MySQL Wokbench vamos abrir nuestro servidor en donde vamos a trabajar con nuestra base de datos.
EN ESTE CASO VAMOS A CREAR UNA BASE DE DATOS PARA PODER TRABAJAR LA CUAL LLAMAREMOS TIENDA 

-- creamos la base de datos  
  CREATE DATABASE Tienda;
  USE Tienda;

-- 1. Tabla de Productos
CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(100) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL
);

-- 2. Tabla de Pedidos (cabecera)
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    fecha_pedido DATE NOT NULL
    -- Aquí podrías agregar más columnas como id_cliente, etc.
);

-- 3. Tabla de Detalles del Pedido
CREATE TABLE detalles_pedido (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Insertamos productos de ejemplo
INSERT INTO productos (nombre_producto, precio_unitario) VALUES
('Laptop Gamer', 15000.00),
('Mouse Inalámbrico', 450.00),
('Teclado Mecánico', 1200.00),
('Monitor 24 Pulgadas', 3500.00),
('Audífonos Bluetooth', 800.00);

-- Insertamos algunos pedidos
INSERT INTO pedidos (fecha_pedido) VALUES
('2026-07-01'),
('2026-07-02'),
('2026-07-03');

-- Insertamos los detalles (qué productos y en qué cantidad se vendieron en cada pedido)
INSERT INTO detalles_pedido (id_pedido, id_producto, cantidad) VALUES
-- Pedido 1
(1, 1, 1), -- 1 Laptop Gamer
(1, 2, 2), -- 2 Mouse Inalámbricos
-- Pedido 2
(2, 3, 1), -- 1 Teclado Mecánico
(2, 4, 2), -- 2 Monitores
-- Pedido 3
(3, 1, 1), -- 1 Laptop Gamer
(3, 2, 1), -- 1 Mouse Inalámbrico
(3, 5, 3); -- 3 Audífonos Bluetooth



  
