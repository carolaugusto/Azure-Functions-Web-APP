-- Integrantes do grupo:

-- Ana Carolina Augusto - rm87820
-- Isabella Oliveira Puttini Rita - rm87624
-- Lais de Souza Leme Alves - rm86894
-- Nicole Ribeiro Nunes - rm88386

-- DML

-- table produtos
INSERT INTO produtos VALUES(1, 'Caneta', 'Caneta Faber Castell Preta', 4560 )
INSERT INTO produtos VALUES(2, 'Cafeteira'  'Cafeteira Philco Inox Red', 507)
INSERT INTO produtos VALUES(3, 'Mouse', 'Mouse sem Fio Logitech vermelho', 978)


-- table categorias
INSERT INTO categorias VALUES(1, 1, 'Papelaria')
INSERT INTO categorias VALUES(2, 2, 'Eletrodomesticos')
INSERT INTO categorias VALUES(3, 3, 'Infotmatica'
COMMIT;

-- DQL

SELECT * FROM produtos;

select * from categorias where Categoria = 'Papelaria';
