-- nomes e RMs

-- rm87820 - Ana Carolina Augusto
-- rm87624 - Isabella Oliveira Puttini Rita
-- rm86894 - Laís de Souza Leme Alves
-- rm88386 - Nicole Ribeiro Nunes

-- apagar tabela

-- DROP TABLE nome_schema.nome_tabela CASCADE CONSTRAINTS PURGE;

-- criação das tabelas


CREATE TABLE infos_login(
    cpf NUMBER(11) CONSTRAINT infos_login_PK PRIMARY KEY,
    senha VARCHAR(20) NOT NULL,
    email_principal VARCHAR(80) NOT NULL CONSTRAINT email_principal_UN UNIQUE,
    email_secundario VARCHAR(80) NOT NULL CONSTRAINT email_secundario_UN UNIQUE
)

CREATE TABLE infos_cadastrais(
    cod_cadastro NUMBER(3) CONSTRAINT infos_cadastrais_PK PRIMARY KEY,
    cod_chatbot NUMBER(3) NOT NULL,
    cpf NUMBER(11) NOT NULL
)

CREATE TABLE chatbot(
    cod_chatbot NUMBER(3) CONSTRAINT chatbot_PK PRIMARY KEY,
    mensagem VARCHAR(140) NOT NULL,
    cod_opcoes NUMBER(3) NOT NULL
)

CREATE TABLE opcoes_chatbot(
    cod_opcoes NUMBER(3) CONSTRAINT opcoes_chatbot_PK PRIMARY KEY,
    opcoes VARCHAR(50) NOT NULL
)

CREATE TABLE infos_pessoais(
    cod_infos_pessoais NUMBER(3) CONSTRAINT infos_pessoais_PK PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    idade NUMBER(2) NOT NULL,
    sexo VARCHAR(9),
    cod_endereco NUMBER(3) NOT NULL,
    cod_chatbot NUMBER(3) NOT NULL
)

CREATE TABLE telefone(
    cod_telefone NUMBER(3) CONSTRAINT telefone_PK PRIMARY KEY,
    ddd NUMBER(3) NOT NULL,
    telefone NUMBER(9) NOT NULL CONSTRAINT telefone_UN UNIQUE,
    cod_infos_pessoais NUMBER(3) NOT NULL
)

CREATE TABLE documentos(
    cod_documentos NUMBER(3) CONSTRAINT documentos_PK PRIMARY KEY,
    cpf NUMBER(11) NOT NULL CONSTRAINT cpf_UN UNIQUE,
    rg VARCHAR(9) NOT NULL CONSTRAINT rg_UN UNIQUE,
    comprovante_residencia NUMBER(1) NOT NULL,
    cod_fotos NUMBER(3) NOT NULL,
    cod_infos_pessoais NUMBER(3) NOT NULL
)

CREATE TABLE fotos(
    cod_fotos NUMBER(3) CONSTRAINT fotos_PK PRIMARY KEY,
    foto_cpf NUMBER(1) NOT NULL,
    foto_rg NUMBER(1) NOT NULL,
    foto_comprovante_residencia NUMBER(1) NOT NULL,
    selfie NUMBER(1) NOT NULL
)

CREATE TABLE endereco(
    cod_endereco NUMBER(3) CONSTRAINT endereco_PK PRIMARY KEY,
    cep NUMBER(8) NOT NULL CONSTRAINT cep_UN UNIQUE,
    numero NUMBER(5) NOT NULL,
    complemento VARCHAR(20),
    cod_logradouro NUMBER(3) NOT NULL
)

CREATE TABLE logradouro(
    cod_logradouro NUMBER(3) CONSTRAINT logradouro_PK PRIMARY KEY,
    logradouro VARCHAR(80) NOT NULL,
    cod_tipo_logradouro NUMBER(3) NOT NULL,
    cod_bairro NUMBER(3) NOT NULL
)

CREATE TABLE tipo_logradouro(
    cod_tipo_logradouro NUMBER(3) CONSTRAINT tipo_logradouro_PK PRIMARY KEY,
    tipo VARCHAR(10) NOT NULL
)

CREATE TABLE bairro(
    cod_bairro NUMBER(3) CONSTRAINT bairro_PK PRIMARY KEY,
    bairro VARCHAR(30) NOT NULL,
    cod_cidade NUMBER(3) NOT NULL
)

CREATE TABLE cidade(
    cod_cidade NUMBER(3) CONSTRAINT cidade_PK PRIMARY KEY,
    cidade VARCHAR(30) NOT NULL,
    cod_estado NUMBER(3) NOT NULL
)

CREATE TABLE estado(
    cod_estado NUMBER(3) CONSTRAINT estado_PK PRIMARY KEY,
    estado VARCHAR(20) NOT NULL,
    uf VARCHAR(2) NOT NULL
)

ALTER TABLE infos_cadastrais
ADD CONSTRAINT cod_chatbot_FK
FOREIGN KEY (cod_chatbot)
REFERENCES chatbot (cod_chatbot);

-- adicionando as foreign keys

ALTER TABLE infos_cadastrais
ADD CONSTRAINT cpf_FK
FOREIGN KEY (cpf)
REFERENCES infos_login (cpf);

ALTER TABLE chatbot
ADD CONSTRAINT opcoes_chatbot_FK
FOREIGN KEY (cod_opcoes)
REFERENCES opcoes_chatbot (cod_opcoes);

ALTER TABLE telefone
ADD CONSTRAINT telelfone_infos_pessoais_FK
FOREIGN KEY (cod_infos_pessoais)
REFERENCES infos_pessoais (cod_infos_pessoais);

ALTER TABLE infos_pessoais
ADD CONSTRAINT endereco_FK
FOREIGN KEY (cod_endereco)
REFERENCES endereco (cod_endereco);

ALTER TABLE infos_cadastrais
ADD CONSTRAINT chatbot_FK
FOREIGN KEY (cod_chatbot)
REFERENCES chatbot (cod_chatbot);

ALTER TABLE documentos
ADD CONSTRAINT fotos_FK
FOREIGN KEY (cod_fotos)
REFERENCES fotos (cod_fotos);

ALTER TABLE documentos
ADD CONSTRAINT documentos_infos_pessoais_FK
FOREIGN KEY (cod_infos_pessoais)
REFERENCES infos_pessoais (cod_infos_pessoais);

ALTER TABLE endereco
ADD CONSTRAINT logradouro_FK
FOREIGN KEY (cod_logradouro)
REFERENCES logradouro (cod_logradouro);

ALTER TABLE logradouro
ADD CONSTRAINT tipo_logradouro_FK
FOREIGN KEY (cod_tipo_logradouro)
REFERENCES logradouro (cod_tipo_logradouro);

ALTER TABLE logradouro
ADD CONSTRAINT bairro_FK
FOREIGN KEY (cod_bairro)
REFERENCES bairro (cod_bairro);

ALTER TABLE bairro
ADD CONSTRAINT cidade_FK
FOREIGN KEY (cod_cidade)
REFERENCES cidade (cod_cidade);

ALTER TABLE cidade
ADD CONSTRAINT estado_FK
FOREIGN KEY (cod_estado)
REFERENCES estado (cod_estado);