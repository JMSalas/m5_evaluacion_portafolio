CREATE TABLE Clientes (
    Id_Cliente SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Telefono VARCHAR(20),
    Direccion VARCHAR(255),
    Ciudad VARCHAR(100),
    Estado VARCHAR(100),
    Codigo_Postal VARCHAR(10)
);

CREATE TABLE Productos (
    ID_Producto SERIAL PRIMARY KEY,
    Nombre_Producto VARCHAR(255) NOT NULL,
    Descripcion TEXT,
    Precio DECIMAL(10, 2) NOT NULL CHECK (Precio >= 0),
    Cantidad_Disponible INT NOT NULL CHECK (Cantidad_Disponible >= 0),
    SKU VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Pedidos (
    Id_Pedido SERIAL PRIMARY KEY,
    Id_Cliente INT NOT NULL,
    Fecha_Pedido TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    Estado_Pedido VARCHAR(50) NOT NULL,
    Monto_Total DECIMAL(10, 2) NOT NULL CHECK (Monto_Total >= 0),
    FOREIGN KEY (Id_Cliente) REFERENCES Clientes(Id_Cliente)
);

CREATE TABLE Detalles_Pedido (
    Id_Detalle_Pedido SERIAL PRIMARY KEY,
    Id_Pedido INT NOT NULL,
    Id_Producto INT NOT NULL,
    Cantidad INT NOT NULL CHECK (Cantidad > 0),
    Precio_Unitario DECIMAL(10, 2) NOT NULL CHECK (Precio_Unitario >= 0),
    FOREIGN KEY (Id_Pedido) REFERENCES Pedidos(Id_Pedido),
    FOREIGN KEY (Id_Producto) REFERENCES Productos(ID_Producto)
);

CREATE TABLE Metodos_Pago (
    Id_Metodo_Pago SERIAL PRIMARY KEY,
    Id_Pedido INT NOT NULL,
    Fecha_Pago TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    Tipo_Pago VARCHAR(50) NOT NULL,
    Id_Transaccion VARCHAR(255) UNIQUE NOT NULL,
    Monto DECIMAL(10, 2) NOT NULL CHECK (Monto > 0),
    FOREIGN KEY (Id_Pedido) REFERENCES Pedidos(Id_Pedido)
);