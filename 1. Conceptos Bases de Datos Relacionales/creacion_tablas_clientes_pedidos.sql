-- Tabla para almacenar la información de los clientes
CREATE TABLE Clientes (
    ID_Cliente SERIAL PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    correo_electronico VARCHAR(100) UNIQUE,
    fecha_registro DATE DEFAULT CURRENT_DATE
);

-- Tabla para registrar los pedidos de los clientes
CREATE TABLE Pedidos (
    ID_Pedido SERIAL PRIMARY KEY,
    fecha_pedido TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    monto NUMERIC(10, 2) NOT NULL,
    ID_Cliente INTEGER,
    CONSTRAINT fk_cliente
        FOREIGN KEY (ID_Cliente)
        REFERENCES Clientes(ID_Cliente)
        ON DELETE SET NULL
);