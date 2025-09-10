# Componentes y Gestión de una Base de Datos Relacional

Este documento describe los elementos fundamentales de las bases de datos relacionales y cómo se organizan para gestionar la información de manera eficiente.

## 1. Componentes Básicos

Una base de datos relacional organiza la información en un formato estructurado y interconectado. Sus componentes clave son:

* **Tablas (o Entidades):** Son las estructuras principales que almacenan los datos. Cada tabla representa un concepto o tipo de objeto, como `Clientes`, `Productos` o `Pedidos`. Se organizan en filas y columnas.

* **Campos (o Atributos):** Son las columnas de una tabla. Cada campo define una característica específica de la entidad (ej. `nombre_cliente`, `precio_producto`). Tienen un tipo de dato predefinido (texto, número, fecha, etc.).

* **Registros (o Tuplas):** Son las filas de una tabla. Cada registro es una instancia única de la entidad (ej. un cliente específico con su nombre, dirección, etc.).

* **Clave Primaria (PK):** Es un campo o conjunto de campos que identifica de forma única a cada registro dentro de una tabla. Es fundamental para garantizar que no haya duplicados. Por ejemplo, un `ID_Cliente` es una clave primaria ideal.

* **Clave Foránea (FK):** Es un campo en una tabla que se refiere a la clave primaria de **otra tabla**. Su función principal es establecer y gestionar las relaciones entre las tablas, lo que permite vincular la información de manera lógica y coherente.

## 2. Gestión, Almacenamiento y Relaciones

La gestión de una base de datos relacional se realiza a través de un **Sistema de Gestión de Bases de Datos Relacionales (SGBDR)**. Este sistema permite realizar operaciones como la inserción, actualización, eliminación y consulta de datos.

Los datos se almacenan de forma optimizada, con cada tabla dedicada a un tema específico para evitar la redundancia. La verdadera potencia de este modelo reside en las **relaciones entre tablas**, que se establecen utilizando las **claves foráneas**.

**Ejemplo Práctico:**

Considera una empresa que gestiona `Clientes` y `Pedidos`. En lugar de almacenar todos los datos del cliente en cada registro de pedido (lo que generaría mucha repetición), se crean dos tablas:

1.  **Tabla `Clientes`:**
    * `ID_Cliente` (PK)
    * `nombre_cliente`
    * `direccion`

2.  **Tabla `Pedidos`:**
    * `ID_Pedido` (PK)
    * `fecha_pedido`
    * `monto`
    * `ID_Cliente` (FK)

La clave foránea `ID_Cliente` en la tabla `Pedidos` apunta a la clave primaria `ID_Cliente` en la tabla `Clientes`. Esta conexión permite consultar fácilmente quién realizó un pedido sin duplicar los datos del cliente. Si la dirección de un cliente cambia, solo se necesita actualizar un registro en la tabla `Clientes`, lo que mantiene la **integridad y consistencia** de los datos en toda la base.