-- Crear base de datos y usarla
CREATE DATABASE ControlStockTienda;
USE ControlStockTienda;

-- Tabla: Categoría
CREATE TABLE Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla: Proveedor
CREATE TABLE Proveedor (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla: Producto
CREATE TABLE Producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock_actual INT DEFAULT 0,
    id_categoria INT,
    id_proveedor INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);

-- Tabla: Usuario
CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(100) NOT NULL,
    contraseña VARCHAR(100) NOT NULL,
    rol VARCHAR(50)
);

-- Tabla: MovimientoStock
CREATE TABLE MovimientoStock (
    id_movimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    fecha DATE NOT NULL,
    tipo ENUM('entrada', 'salida') NOT NULL,
    cantidad INT NOT NULL,
    id_usuario INT,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

-- Insertar categorías
INSERT INTO Categoria (nombre) VALUES
('Esmaltes'),
('Tratamientos'),
('Herramientas'),
('Decoración'),
('Limpieza'),
('Acrílicos'),
('Bases'),
('Top Coats'),
('Nail Art'),
('Removedores');

-- Insertar proveedores
INSERT INTO Proveedor (nombre, telefono, email) VALUES
('Distribuidora Mendoza', '2611234567', 'ventas@dm.com'),
('NailPro Distribución', '2615123456', 'contacto@nailpro.com'),
('Belleza Total', '2614987654', 'ventas@bellezatotal.ar'),
('Uñas & Arte', '2614234567', 'info@unasyarte.com'),
('Glam Nails Supply', '2614765432', 'glam@supply.com'),
('ColorMix', '2614556789', 'pedidos@colormix.com'),
('Brillo y Estilo', '2614001234', 'contacto@brilloyestilo.ar'),
('Nail Factory', '2614012345', 'nailfactory@gmail.com'),
('Estética Mendoza', '2614023456', 'ventas@esteticamza.com'),
('ProNails Argentina', '2614034567', 'info@pronails.com.ar');

-- Insertar productos
INSERT INTO Producto (nombre, descripcion, precio, stock_actual, id_categoria, id_proveedor) VALUES
('Esmalte Rosa Pastel', 'Color suave ideal para primavera', 1100, 25, 1, 2),
('Base Fortalecedora', 'Protege y fortalece las uñas', 950, 18, 7, 3),
('Lima Curva Profesional', 'Ideal para moldear uñas acrílicas', 500, 40, 3, 4),
('Foil Dorado', 'Decoración metálica para nail art', 700, 12, 4, 5),
('Acrílico Transparente', 'Base para esculpido de uñas', 1500, 20, 6, 6),
('Top Coat Mate', 'Acabado mate para esmaltes', 1300, 15, 8, 7),
('Removedor de Cutículas', 'Suaviza y elimina cutículas', 900, 22, 10, 8),
('Pincel para Nail Art', 'Diseño fino y preciso', 600, 30, 9, 9),
('Esmalte Glitter Plateado', 'Brillo intenso para fiestas', 1250, 10, 1, 10),
('Alcohol Isopropílico', 'Limpieza y desinfección', 850, 35, 5, 1);

-- Insertar usuarios
INSERT INTO Usuario (nombre_usuario, contraseña, rol) VALUES
('admin', 'admin123', 'administrador'),
('juanchy', 'uñas2025', 'empleado'),
('sofia', 'nailart22', 'empleado'),
('valen', 'glam2025', 'empleado'),
('mica', 'brillo88', 'empleado'),
('cami', 'rosa2025', 'empleado'),
('juli', 'glitter77', 'empleado'),
('lucas', 'tools2025', 'empleado'),
('flor', 'deco2025', 'empleado'),
('leo', 'stock2025', 'empleado');

-- Insertar movimientos de stock
INSERT INTO MovimientoStock (id_producto, fecha, tipo, cantidad, id_usuario) VALUES
(1, '2025-09-01', 'entrada', 10, 1),
(2, '2025-09-02', 'salida', 5, 2),
(3, '2025-09-03', 'entrada', 20, 3),
(4, '2025-09-04', 'salida', 2, 4),
(5, '2025-09-05', 'entrada', 8, 5),
(6, '2025-09-06', 'salida', 3, 6),
(7, '2025-09-07', 'entrada', 12, 7),
(8, '2025-09-08', 'salida', 6, 8),
(9, '2025-09-09', 'entrada', 5, 9),
(10, '2025-09-10', 'salida', 10, 10);


