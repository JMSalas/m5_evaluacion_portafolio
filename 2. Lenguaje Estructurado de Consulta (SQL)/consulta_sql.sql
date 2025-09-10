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