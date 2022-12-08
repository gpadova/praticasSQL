-- Achando o ID da Martinha

SELECT * FROM clientes;

-- Achando o ID do fone

SELECT * FROM produtos;

-- Após verificar visualmente os IDs, adiciono essa compra ao banco

INSERT INTO compras (id_cliente,id_produto) VALUES (5,14);