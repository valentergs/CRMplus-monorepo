CREATE TABLE cliente
(
    Cliente_id serial PRIMARY KEY,
    Cliente VARCHAR(255) UNIQUE NOT NULL,
    Unidade VARCHAR(255) NOT NULL,
    Endereço VARCHAR(255) NOT NULL,
    Cidade VARCHAR(255) NOT NULL,
    Estado VARCHAR(255) NOT NULL,
    Pais VARCHAR(255) NOT NULL,
    CEP bigint,
    Contato bigint REFERENCES contato(contato_id) ON DELETE CASCADE,
    Segmento bigint REFERENCES segmento(Segmento_id) ON DELETE CASCADE,
    Produto bigint REFERENCES produto(Produto_id) ON DELETE CASCADE,
    Tipo VARCHAR(255)
);
CREATE TABLE contato
(
    contato_id serial PRIMARY KEY,
    Cliente bigint REFERENCES cliente(Cliente_id) ON DELETE CASCADE,
    Nome VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL unique,
    Telefone bigint,
    Celular bigint
);
CREATE TABLE oportunidade
(
    oportunidade_id serial PRIMARY KEY,
    Dono bigint REFERENCES usuario(Usuario_id) ON DELETE CASCADE,
    Cliente bigint REFERENCES cliente(Cliente_id) ON DELETE CASCADE,
    Contato bigint REFERENCES contato(Contato_id) ON DELETE CASCADE,
    Data_Criação TIMESTAMPTZ NOT NULL DEFAULT 'CURRENT_DATE',
    Data_Vencimento DATE NOT NULL,
    Quantidade_Potencial bigint,
    Faturamento_Potencial decimal(8,2)
);
CREATE TABLE usuario
(
    usuario_id serial PRIMARY KEY,
    nome character varying(50) NOT NULL,
    sobrenome character varying(50) NOT NULL,
    senha character varying(50) NOT NULL,
    email character varying(50) NOT NULL UNIQUE,
    celular bigint,
    superuser boolean,
    ativo boolean,
    departamento character varying(30)
);

CREATE TABLE produto
(
    produto_id serial PRIMARY KEY,
    Nome VARCHAR(50),
    Numero bigint,
    Segmento bigint REFERENCES segmento(Segmento_id) ON DELETE CASCADE
);
CREATE TABLE segmento
(
    segmento_id serial PRIMARY KEY,
    Nome VARCHAR(50)
);
CREATE TABLE recebiveis
(
    recebiveis_id serial PRIMARY KEY,
    Cliente bigint REFERENCES cliente(Cliente_id) ON DELETE CASCADE,
    Fatura VARCHAR(50) NOT NULL,
    Data_Emissão DATE NOT NULL,
    Data_Vencimento DATE NOT NULL,
    Valor decimal(8,2) NOT NULL
);
CREATE TABLE forecast
(
    forecast_id serial PRIMARY KEY,
    Autor bigint REFERENCES usuario(Usuario_id) ON DELETE CASCADE,
    Cliente bigint REFERENCES cliente(Cliente_id) ON DELETE CASCADE,
    Data_Criação TIMESTAMPTZ NOT NULL DEFAULT 'CURRENT_DATE'
);
CREATE TABLE forecast_item
(
    forecast_item_id serial PRIMARY KEY,
    Produto bigint REFERENCES produto(Produto_id) ON DELETE CASCADE,
    Data_Criação TIMESTAMPTZ NOT NULL DEFAULT 'CURRENT_DATE',
    Mes DATE,
    Quantidade bigint
);
CREATE TABLE preco
(
    preco_id serial PRIMARY KEY,
    Cliente bigint REFERENCES cliente(Cliente_id) ON DELETE CASCADE,
    Produto bigint REFERENCES produto(Produto_id) ON DELETE CASCADE,
    Preço decimal(5,2) NOT NULL,
    Unidade VARCHAR(10),
    Data_Criação TIMESTAMPTZ NOT NULL DEFAULT 'CURRENT_DATE',
    Data_Inicio DATE NOT NULL,
    Data_Final DATE NOT NULL
);
CREATE TABLE relatorio
(
    relatorio_id serial PRIMARY KEY,
    Cliente bigint REFERENCES cliente(Cliente_id) ON DELETE CASCADE,
    Tipo VARCHAR(50),
    Data_Criação TIMESTAMPTZ NOT NULL DEFAULT 'CURRENT_DATE',
    Data_Revisão TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    Status VARCHAR(10),
    Autor bigint REFERENCES usuario(Usuario_id) ON DELETE CASCADE,
    Texto TEXT
);
CREATE TABLE comentario_relatorio
(
    comentario_relatorio_id serial PRIMARY KEY,
    Relatorio bigint REFERENCES relatorio(Relatorio_id) ON DELETE CASCADE,
    Autor bigint REFERENCES usuario(Usuario_id) ON DELETE CASCADE,
    Data_Criação TIMESTAMPTZ NOT NULL DEFAULT 'CURRENT_DATE'
);
CREATE TABLE tarefa
(
    tarefa_id serial PRIMARY KEY,
    Autor bigint REFERENCES usuario(Usuario_id) ON DELETE CASCADE,
    Delegado bigint REFERENCES usuario(Usuario_id) ON DELETE CASCADE,
    Cliente bigint REFERENCES cliente(Cliente_id) ON DELETE CASCADE,
    Assunto VARCHAR(100),
    Texto TEXT,
    Data_Criação TIMESTAMPTZ NOT NULL DEFAULT 'CURRENT_DATE',
    Data_Vencimento DATE
);

-- *********

-- INSERT INTO usuario VALUES (default, 'José', 'Silva', 87654321, 'js@email.com', 11498765432, 11987652345, 'Medio', true, 'Marketing', 'Analista');

-- *********

-- CREATE OR REPLACE FUNCTION trigger_set_timestamp()
-- RETURNS TRIGGER AS $$
-- BEGIN
--   NEW.updated_at = NOW();
--   RETURN NEW;
-- END;
-- $$ LANGUAGE plpgsql;

-- https://x-team.com/blog/automatic-timestamps-with-postgresql/