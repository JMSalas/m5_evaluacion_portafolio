# 4. Lenguaje de Definición de Datos (DDL)

El Lenguaje de Definición de Datos (DDL) es la parte de SQL que se encarga de crear, modificar y eliminar la estructura de la base de datos y sus objetos, como tablas, índices y vistas. A diferencia del DML (que manipula los datos), el DDL define el esquema o el diseño de la base de datos. Los comandos principales de DDL son CREATE, ALTER y DROP.

## Creación de Objetos (CREATE)

La sentencia CREATE se utiliza para construir nuevos objetos en la base de datos. El ejemplo más común es la creación de una tabla, donde se definen las columnas, sus tipos de datos y las restricciones.

### Ejemplo: Crear una tabla para empleados

```sql
CREATE TABLE Empleados (
    ID_Empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    salario NUMERIC(10, 2) NOT NULL,
    fecha_ingreso DATE DEFAULT CURRENT_DATE
);
```

## Modificación de Objetos (ALTER)

El comando ALTER permite modificar la estructura de un objeto existente, como una tabla. Es útil para añadir nuevas columnas, cambiar el tipo de dato de una columna o agregar restricciones después de la creación inicial de la tabla.

### Ejemplo: Modificar la tabla Empleados

```sql
-- Agregar una nueva columna para el departamento del empleado.
ALTER TABLE Empleados
ADD COLUMN departamento VARCHAR(50);

-- Cambiar el tipo de dato de la columna salario.
ALTER TABLE Empleados
ALTER COLUMN salario TYPE NUMERIC(12, 2);

-- Eliminar la columna departamento si ya no es necesaria.
ALTER TABLE Empleados
DROP COLUMN departamento;
```

## Eliminación de Objetos (DROP)

La sentencia DROP se utiliza para eliminar completamente un objeto de la base de datos. Este comando es irreversible y borra el objeto y todos sus datos de forma permanente.

### Ejemplo: Eliminar la tabla Empleados

```sql
-- Eliminar la tabla Empleados. Esto también elimina todos los datos.
DROP TABLE Empleados;
```