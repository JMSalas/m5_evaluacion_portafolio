CREATE TABLE Empleados (
    ID_Empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    salario NUMERIC(10, 2) NOT NULL,
    fecha_ingreso DATE DEFAULT CURRENT_DATE
);

-- Agregar una nueva columna para el departamento del empleado.
ALTER TABLE Empleados
ADD COLUMN departamento VARCHAR(50);

-- Cambiar el tipo de dato de la columna salario.
ALTER TABLE Empleados
ALTER COLUMN salario TYPE NUMERIC(12, 2);

-- Eliminar la columna departamento si ya no es necesaria.
ALTER TABLE Empleados
DROP COLUMN departamento;