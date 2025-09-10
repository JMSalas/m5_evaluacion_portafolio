-- Insertar un nuevo cliente. La columna ID_Cliente se genera automáticamente.
INSERT INTO Clientes (nombre_cliente, direccion, correo_electronico) 
VALUES ('Juan Pérez', 'Calle Falsa 123', 'juan.perez@email.com');

-- Insertar un nuevo pedido para el cliente con ID 1 (asumiendo que es el ID que se generó).
-- La columna fecha_pedido se genera automáticamente.
INSERT INTO Pedidos (ID_Cliente, monto)
VALUES (1, 150.75);

-- Actualizar la dirección del cliente con ID 1.
UPDATE Clientes 
SET direccion = 'Avenida Siempreviva 742'
WHERE ID_Cliente = 1;

-- Eliminar el pedido con ID 25.
DELETE FROM Pedidos
WHERE ID_Pedido = 25;

-- Eliminar el cliente con ID 1.
-- NOTA: Debido a la restricción ON DELETE SET NULL en la clave foránea,
-- los pedidos de este cliente no se eliminarán, pero su ID_Cliente 
-- asociado en la tabla Pedidos se establecerá en NULL.
DELETE FROM Clientes
WHERE ID_Cliente = 1;