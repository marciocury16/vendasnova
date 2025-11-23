-- Insert na tabela clientes:

INSERT INTO clientes (nome, email, cpf, telefone, data_nascimento, cep, logradouro, numero, complemento, bairro, cidade, estado, observacoes)
VALUES (
    'Cliente 31',
    'cli031_2025@example.com',
    '90100000031',
    '(11)90001-0031',
    DATE '1990-07-01',
    '01431000',
    'Rua Nova Alpha',
    '131',
    NULL,
    'Centro',
    'Sao Paulo',
    'SP',
    NULL
);

INSERT INTO clientes (nome, email, cpf, telefone, data_nascimento, cep, logradouro, numero, complemento, bairro, cidade, estado, observacoes)
VALUES (
    'Mariana Silva',
    'mariana.silva@example.com',
    '90100000032',
    '(11)90001-0032',
    DATE '1992-03-15',
    '01431001',
    'Rua das Flores',
    '101',
    NULL,
    'Jardins',
    'Sao Paulo',
    'SP',
    NULL
);


INSERT INTO clientes (nome, email, cpf, telefone, data_nascimento, cep, logradouro, numero, complemento, bairro, cidade, estado, observacoes)
VALUES (
    'Lucas Pereira',
    'lucas.pereira@example.com',
    '90100000003',
    '(11)90001-0033',
    DATE '1988-07-22',
    '01432001',
    'Rua das Palmeiras',
    '102',
    NULL,
    'Moema',
    'Sao Paulo',
    'SP',
    NULL
);
INSERT INTO clientes (nome, email, cpf, telefone, data_nascimento, cep, logradouro, numero, complemento, bairro, cidade, estado, observacoes)
VALUES (
    'Camila Oliveira',
    'camila.oliveira@example.com',
    '90100000004',
    '(11)90001-0034',
    DATE '1990-11-05',
    '01432002',
    'Rua dos Jacarandás',
    '103',
    NULL,
    'Vila Mariana',
    'Sao Paulo',
    'SP',
    NULL
);

INSERT INTO clientes (nome, email, cpf, telefone, data_nascimento, cep, logradouro, numero, complemento, bairro, cidade, estado, observacoes)
VALUES (
    'Rafael Santos',
    'rafael.santos@example.com',
    '90100000005',
    '(11)90001-0035',
    DATE '1985-01-30',
    '01432003',
    'Rua do Sol',
    '104',
    NULL,
    'Pinheiros',
    'Sao Paulo',
    'SP',
    NULL
);

-- insert tabela produtos:

INSERT INTO produtos (nome, descricao, categoria, marca, modelo, preco, quantidade_estoque, unidade_medida)
VALUES (
    'Smartphone Galaxy S25',
    'Smartphone com 256GB, 12GB RAM, câmera tripla de 108MP',
    'Eletrônicos',
    'Samsung',
    'Galaxy S25',
    4999.90,
    50,
    'UN'
);

INSERT INTO produtos (nome, descricao, categoria, marca, modelo, preco, quantidade_estoque, unidade_medida)
VALUES (
    'Notebook ThinkPad X1',
    'Ultrabook com processador i7, 16GB RAM, SSD 512GB',
    'Informática',
    'Lenovo',
    'ThinkPad X1 Carbon',
    8499.00,
    30,
    'UN'
);

INSERT INTO produtos (nome, descricao, categoria, marca, modelo, preco, quantidade_estoque, unidade_medida)
VALUES (
    'Fone de Ouvido WH-1000XM5',
    'Fone Bluetooth com cancelamento de ruído, bateria 30h',
    'Eletrônicos',
    'Sony',
    'WH-1000XM5',
    1599.50,
    100,
    'UN'
);

INSERT INTO produtos (nome, descricao, categoria, marca, modelo, preco, quantidade_estoque, unidade_medida)
VALUES (
    'Cafeteira Expresso Barista',
    'Cafeteira automática com moedor integrado e vapor de leite',
    'Eletrodomésticos',
    'DeLonghi',
    'Barista EC685',
    1299.90,
    20,
    'UN'
);

INSERT INTO produtos (nome, descricao, categoria, marca, modelo, preco, quantidade_estoque, unidade_medida)
VALUES (
    'Bicicleta Mountain Bike XTR',
    'Bicicleta aro 29, 21 marchas, quadro de alumínio',
    'Esportes',
    'Caloi',
    'XTR 2025',
    2599.00,
    15,
    'UN'

);

-- insert para vendas

INSERT INTO vendas (id_usuario, id_produto, quantidade)
VALUES (
    22,  -- id do usuário Mariana Silva
    1,   -- id do produto Smartphone Galaxy S25
    2    -- quantidade comprada
);

INSERT INTO vendas (id_usuario, id_produto, quantidade)
VALUES (
    23,  -- id do usuário Lucas Pereira
    2,   -- id do produto Notebook ThinkPad X1
    1    -- quantidade comprada
);

INSERT INTO vendas (id_usuario, id_produto, quantidade)
VALUES (
    24,  -- id do usuário Camila Oliveira
    3,   -- id do produto Fone de Ouvido WH-1000XM5
    3    -- quantidade comprada
);

INSERT INTO vendas (id_usuario, id_produto, quantidade)
VALUES (
    25,  -- id do usuário Rafael Santos
    4,   -- id do produto Cafeteira Expresso Barista
    1    -- quantidade comprada
);
 
 INSERT INTO vendas (id_usuario, id_produto, quantidade)
VALUES (
    21,  -- id do usuário Beatriz Costa
    5,   -- id do produto Bicicleta Mountain Bike XTR
    2    -- quantidade comprada
);