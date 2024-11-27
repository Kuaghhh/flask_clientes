-- Crear tabla de Usuarios

CREATE TABLE Usuarios ( 
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    usuario VARCHAR(250) NOT NULL, 
    nombre_usuario VARCHAR(100) NOT NULL,
    email varchar(200), 
    contrasenia VARCHAR(255) NOT NULL,
    estado varchar(50),
    ultimo_acceso DATETIME DEFAULT CURRENT_TIMESTAMP, 
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

create table Roles_permisos(
    id integer PRIMARY key AUTOINCREMENT,
    nombre_rol varchar(100) NOT NULL,
    descripcion varchar(255),
    permisos varchar(255)
);

create table Usuarios_roles(
    id integer PRIMARY key AUTOINCREMENT,
    id_usuario integer,
    id_rol integer,
    FOREIGN key (id_usuario) REFERENCES Usuarios(Id),
    FOREIGN key (id_rol) REFERENCES Roles_permisos(Id)
);

-- Crear tabla de Productos
CREATE TABLE Inventarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_producto VARCHAR(100) NOT NULL,
    id_proveedor integer,
    descripcion varchar(255),
    categoria varchar(100),
    precio_compra DECIMAL(10, 2) NOT NULL,
    precio_venta DECIMAL(10,2),
    cantidad_stock INTEGER NOT NULL,
    stock_minimo integer,
    fecha_compra DATETIME,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Crear tabla de Clientes
CREATE TABLE Clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(100) NOT NULL,
    documento varchar(50),
    nrc varchar(500),
    email VARCHAR(100),
    telefono VARCHAR(20),
    direccion VARCHAR(200),
    notas_adicionales varchar(255),
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Crear tabla de Proveedores
CREATE TABLE Proveedores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_proveedor VARCHAR(100) NOT NULL,
    contacto_principal varchar(200),
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion VARCHAR(200),
    condiciones_pago varchar(255),
    notas_adicionales varchar(255),
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Crear tabla de Facturas
CREATE TABLE Ventas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER,
    id_usuario integer,
    fecha_venta DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_venta DECIMAL(10, 2) NOT NULL,
    metodo_pago varchar(50),
    estado_venta varchar(50),
    notas_adicionales varchar(255),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(Id),
    FOREIGN key (id_usuario) REFERENCES Usuarios(Id)
);

-- Crear tabla de DetalleFacturas
CREATE TABLE Detalles_Ventas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_venta INTEGER,
    id_producto INTEGER,
    cantidad INTEGER NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    notas_adicionales varchar(255),
    FOREIGN KEY (id_venta) REFERENCES Ventas(Id),
    FOREIGN KEY (id_producto) REFERENCES Productos(Id)
);

create table Devoluciones_ventas(
    id integer PRIMARY key AUTOINCREMENT,
    id_venta integer,
    id_inventario integer,
    cantidad integer,
    motivo_devolucion varchar(255),
    fecha_devolucion datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN key (id_venta) REFERENCES Ventas(Id),
    FOREIGN key (id_inventario) REFERENCES Inventarios(Id)
);

-- Crear tabla de Compras
CREATE TABLE Compras (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_proveedor INTEGER,
    id_usuario integer,
    fecha_compra DATETIME,
    total_compra DECIMAL(10, 2) NOT NULL,
    condiciones_pago varchar(255),
    estado_compra varchar(50),
    notas_adicionales varchar(255),
    fecha_creacion datetime DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(Id),
    FOREIGN key (id_usuario) REFERENCES Usuarios(Id)
);

-- Crear tabla de DetalleCompras
CREATE TABLE Detalles_compras (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_compra INTEGER,
    id_producto INTEGER,
    cantidad INTEGER NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    notas_adicionales varchar(255),
    FOREIGN KEY (id_compra) REFERENCES Compras(Id),
    FOREIGN KEY (id_producto) REFERENCES Productos(Id)
);
