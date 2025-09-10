# 3. Manipulación de Datos con SQL (DML)

El **Lenguaje de Manipulación de Datos (DML)** es un subconjunto de SQL que permite a los usuarios interactuar y modificar los datos almacenados en una base de datos. Las operaciones DML más comunes son la inserción de nuevos registros, la actualización de datos existentes y la eliminación de registros. A continuación, se presentan ejemplos prácticos utilizando las tablas `Clientes` y `Pedidos`.

---

## Inserción de Datos (`INSERT`)

La sentencia `INSERT` se utiliza para agregar nuevos registros (filas) a una tabla. Es fundamental para poblar la base de datos con información.

### Ejemplo: Añadir un nuevo cliente y un nuevo pedido

```sql
-- Insertar un nuevo cliente. La columna ID_Cliente se genera automáticamente.
INSERT INTO Clientes (nombre_cliente, direccion, correo_electronico) 
VALUES ('Juan Pérez', 'Calle Falsa 123', 'juan.perez@email.com');

-- Insertar un nuevo pedido para el cliente con ID 1 (asumiendo que es el ID que se generó).
-- La columna fecha_pedido se genera automáticamente.
INSERT INTO Pedidos (ID_Cliente, monto)
VALUES (1, 150.75);
```

## Actualización de Datos (UPDATE)

El comando `UPDATE` se usa para modificar los datos de los registros existentes en una tabla. Es crucial utilizar la cláusula WHERE para especificar exactamente qué registros se deben actualizar; de lo contrario, la sentencia afectará a toda la tabla.

### Ejemplo: Cambiar la dirección de un cliente

```sql
-- Actualizar la dirección del cliente con ID 1.
UPDATE Clientes 
SET direccion = 'Avenida Siempreviva 742'
WHERE ID_Cliente = 1;
```

## Eliminación de Datos (DELETE)

La sentencia DELETE se emplea para eliminar uno o más registros de una tabla. Al igual que con UPDATE, la cláusula WHERE es vital para evitar la eliminación de todos los datos.

### Ejemplo: Eliminar un pedido y un cliente

```sql
-- Eliminar el pedido con ID 25.
DELETE FROM Pedidos
WHERE ID_Pedido = 25;

-- Eliminar el cliente con ID 1.
-- NOTA: Debido a la restricción ON DELETE SET NULL en la clave foránea,
-- los pedidos de este cliente no se eliminarán, pero su ID_Cliente 
-- asociado en la tabla Pedidos se establecerá en NULL.
DELETE FROM Clientes
WHERE ID_Cliente = 1;
```