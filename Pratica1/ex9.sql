-- Achando o ID do Chico

SELECT * FROM clientes;

-- Achando o ID do violão

SELECT * FROM produtos;

-- Após verificar visualmente os IDs, adiciono essa compra ao banco

INSERT INTO compras (id_cliente,id_produto) VALUES (8,10);
