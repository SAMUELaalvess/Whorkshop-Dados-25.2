CREATE SCHEMA desafio;

USE desafio;

CREATE TABLE DESAFIO.clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    cidade VARCHAR(50)
);

CREATE TABLE DESAFIO.pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    valor_total DECIMAL(10,2),
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES DESAFIO.clientes(id_cliente)
);



INSERT INTO DESAFIO.clientes (id_cliente, nome, email, cidade) VALUES
(1, 'Ana', 'ana@email.com', 'São Paulo'),
(2, 'Bruno', 'bruno@email.com', 'Rio de Janeiro'),
(3, 'Carlos', 'carlos@email.com', 'Belo Horizonte'),
(4, 'Daniela', 'daniela@email.com', 'São Paulo'),
(5, 'Eduardo', 'edu@email.com', 'Salvador'),
(6, 'Fernanda', 'fer@email.com', 'Curitiba'),
(7, 'Gustavo', 'gus@email.com', 'Fortaleza'),
(8, 'Helena', 'helena@email.com', 'Recife'),
(9, 'Igor', 'igor@email.com', 'Manaus'),
(10, 'Joana', 'joana@email.com', 'Brasília');

INSERT INTO DESAFIO.pedidos (id_pedido, id_cliente, valor_total, data_pedido) VALUES
(101, 1, 150.00, '2025-08-01'),
(102, 2, 250.50, '2025-08-02'),
(103, 1, 300.00, '2025-08-03'),
(104, 3, 100.00, '2025-08-04'),
(105, 4, 200.75, '2025-08-05'),
(106, 5, 180.40, '2025-08-06'),
(107, 6, 220.10, '2025-08-07'),
(108, 7, 500.00, '2025-08-08'),
(109, 8, 320.60, '2025-08-09'),
(110, 9, 400.80, '2025-08-10');



-- DML: UPDATE
UPDATE DESAFIO.clientes
SET cidade = 'São Paulo'
WHERE id_cliente = 10;

-- DQL: SELECT
SELECT * FROM DESAFIO.pedidos;

-- Funções Agregadas
SELECT 
    COUNT(*) AS total_pedidos,
    AVG(valor_total) AS media_valor,
    MAX(valor_total) AS maior_valor
FROM DESAFIO.pedidos;

-- Agrupamento 1
SELECT cidade, COUNT(*) AS total_clientes
FROM DESAFIO.clientes
GROUP BY cidade;

-- Agrupamento 2
SELECT id_cliente, SUM(valor_total) AS total_gasto
FROM DESAFIO.pedidos
GROUP BY id_cliente;

-- JOIN
SELECT c.nome, p.valor_total, p.data_pedido
FROM DESAFIO.clientes c
JOIN DESAFIO.pedidos p ON c.id_cliente = p.id_cliente;


