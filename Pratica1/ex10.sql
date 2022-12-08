-- Achando o ID da Olga

SELECT * FROM clientes;

-- Achando o ID do celular

SELECT * FROM produtos;

-- Após verificar visualmente os IDs, adiciono essa compra ao banco

INSERT INTO compras (id_cliente,id_produto) VALUES (4,8);