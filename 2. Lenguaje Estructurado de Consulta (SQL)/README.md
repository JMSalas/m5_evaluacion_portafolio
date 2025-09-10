# 2. Consultas SQL para Obtener Información

Una de las principales funciones de un lenguaje de consultas como **SQL** es permitir la extracción de información específica de las tablas. Utilizando cláusulas como `SELECT`, `FROM`, `JOIN` y `WHERE`, se puede combinar y filtrar datos para satisfacer necesidades organizacionales.

## Ejemplo: Obtener Pedidos de un Cliente Específico

Obtener todos los detalles de los pedidos de un cliente con el `ID_Cliente` igual a `15`. Para lograrlo, se debe unir la tabla `Pedidos` con la tabla `Clientes` a través de la clave foránea (`ID_Cliente`).

### Consulta SQL

```sql
SELECT
    C.nombre_cliente,
    P.ID_Pedido,
    P.fecha_pedido,
    P.monto
FROM
    Pedidos AS P
JOIN
    Clientes AS C ON P.ID_Cliente = C.ID_Cliente
WHERE
    C.ID_Cliente = 15;
```

### Explicación de las Cláusulas

    SELECT: Especifica las columnas que se desean mostrar en el resultado. Se usan alias (P y C) para hacer el código más conciso.

    FROM ... JOIN ... ON: Combina las filas de la tabla Pedidos (P) con las filas de la tabla Clientes (C). La condición ON P.ID_Cliente = C.ID_Cliente establece que el vínculo se realiza cuando los valores de ID_Cliente en ambas tablas coinciden.

    WHERE: Filtra los resultados de la unión, mostrando únicamente los registros donde el ID_Cliente es 15. Puedes modificar este valor para consultar los pedidos de cualquier otro cliente.

Esta consulta demuestra cómo el modelo relacional y las claves foráneas permiten obtener información valiosa y coherente de múltiples tablas de manera eficiente.