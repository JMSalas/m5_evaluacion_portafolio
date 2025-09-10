# 5. Modelo de Datos

Aquí se desarrolla un modelo de datos conceptual para una tienda en línea, diseñado con un enfoque de base de datos relacional. Este es un método común y eficiente para estructurar este tipo de información.

## Entidades y Atributos Clave

### 1. Productos

Esta entidad representa los artículos disponibles para la venta.

    ID_Producto (Clave Primaria): Identificador único para cada producto.

    Nombre_Producto: El nombre del producto (ej. "Teclado para juegos").

    Descripción: Una descripción detallada del producto.

    Precio: El costo del producto.

    Cantidad_Disponible: El número de unidades disponibles.

    SKU (Stock Keeping Unit): Un código alfanumérico único para la gestión de inventario.

### 2. Clientes

Esta entidad almacena información sobre los usuarios que realizan compras.

    Id_Cliente (Clave Primaria): Identificador único para cada cliente.

    Nombre: Nombre del cliente.

    Apellido: Apellido del cliente.

    Email: La dirección de correo electrónico del cliente (debe ser única).

    Telefono: El número de teléfono del cliente.

    Dirección: La dirección de la calle del cliente.

    Ciudad: Ciudad del cliente.

    Estado: Estado o región del cliente.

    Codigo_Postal: Código postal del cliente.

### 3. Pedidos

Esta entidad registra todas las compras de los clientes. Un pedido es una transacción específica que puede contener múltiples productos.

    Id_Pedido (Clave Primaria): Identificador único para cada pedido.

    Id_Cliente (Clave Foránea): Vincula el pedido a un cliente específico.

    Fecha_Pedido: La fecha y hora en que se realizó el pedido.

    Estado_Pedido: El estado actual del pedido (ej. "Pendiente", "Enviado", "Entregado", "Cancelado").

    Monto_Total: El costo total del pedido, incluyendo todos los artículos e impuestos.

### 4. Detalles del Pedido (o Artículos del Pedido)

Esta es una tabla de unión que enlaza productos con pedidos. Debido a que un pedido puede tener muchos productos y un producto puede estar en muchos pedidos, esta tabla es fundamental para gestionar una relación de muchos a muchos.

    Id_Detalle_Pedido (Clave Primaria): Un identificador único para cada artículo dentro de un pedido.

    Id_Pedido (Clave Foránea): Enlaza a la tabla Pedidos.

    Id_Producto (Clave Foránea): Enlaza a la tabla Productos.

    Cantidad: El número de unidades de un producto específico en ese pedido.

    Precio_Unitario: El precio del producto en el momento de la venta (importante si los precios cambian).

### 5. Métodos de Pago

Esta entidad almacena la información de pago utilizada para un pedido.

    Id_Metodo_Pago (Clave Primaria): Identificador único para cada método de pago.

    Id_Pedido (Clave Foránea): Vincula el pago a un pedido específico.

    Fecha_Pago: La fecha y hora en que se procesó el pago.

    Tipo_Pago: El tipo de pago (ej. "Tarjeta de Crédito", "PayPal", "Transferencia Bancaria").

    Id_Transaccion: El ID único proporcionado por la pasarela de pago.

    Monto: El monto del pago.

## Diagrama de Entidad-Relación (DER)

Este diagrama muestra cómo se conectan las tablas. Las líneas representan las relaciones y los símbolos al final de las líneas indican la cardinalidad.

    Relación Uno a Muchos: Un registro de una entidad puede estar asociado con múltiples registros en otra entidad.

    Relación Muchos a Muchos: Los registros de dos entidades pueden estar vinculados a múltiples registros en la otra entidad. Esto se resuelve con una tabla de unión.

### Desglose de Relaciones:

    Clientes y Pedidos: Es una relación de uno a muchos. Un solo cliente puede realizar muchos pedidos, pero cada pedido es realizado por un solo cliente.

    Pedidos y Productos: Es una relación de muchos a muchos. Un pedido puede contener múltiples productos, y un solo producto puede estar incluido en muchos pedidos diferentes. La tabla Detalles del Pedido resuelve esto.

    Pedidos y Métodos de Pago: Es una relación de uno a uno o uno a muchos, dependiendo de la lógica de negocio. Por lo general, un pedido tiene un pago, pero podría ser necesario manejar pagos múltiples (ej. un pago parcial), lo que lo convierte en uno a muchos.

    Detalles del Pedido y Pedidos: Es una relación de uno a muchos. Un pedido puede tener muchos detalles (es decir, múltiples artículos), pero cada detalle pertenece a un solo pedido.

    Detalles del Pedido y Productos: También es una relación de uno a muchos. Un solo producto puede aparecer en muchos detalles de pedido diferentes, pero cada detalle de pedido se refiere a un solo producto específico.

Esta estructura ofrece una base sólida y flexible para una plataforma de comercio electrónico, permitiendo una gestión y consulta de datos eficiente.

## Normalización

La tabla Clientes puede ser normalizada, extrayendo las dependecias transitorias de los campos ciudad, estado, código_postal con dirección.
Se podría considerar la creación de una tabla separada para las direcciones. Esto es especialmente útil si un cliente puede tener múltiples direcciones (ej., una de facturación y otra de envío) o si se necesita reutilizar la información de dirección para otras entidades (como un proveedor).

### Propuesta de Normalización a 3NF

    - Crea una nueva tabla de Direcciones:

        Id_Direccion (Clave Primaria).

        Calle (Dirección de la tabla Clientes).

        Ciudad.

        Estado.

        CodigoPostal.

    - Modificar la tabla Clientes:

        Elimina los campos de dirección.

        Añade Id_Direccion (Clave Foránea) para enlazar cada cliente a una dirección.

En esta oportunidad para mantener la simplicidad del ejemplo se ha omitido la tabla dirección.