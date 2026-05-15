CREATE DATABASE cinema;
USE cinema;

CREATE TABLE cliente (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cpf_cliente VARCHAR(11) NOT NULL UNIQUE
);

CREATE TABLE pedido(
id_pedido INT AUTO_INCREMENT PRIMARY KEY,
data_pedido DATE,
hora_pedido TIME
);

CREATE TABLE sala(
id_sala INT AUTO_INCREMENT PRIMARY KEY,
tipo_sala VARCHAR(100),
descricao_sala TEXT
);

CREATE TABLE filme(
id_filme INT AUTO_INCREMENT PRIMARY KEY,
classificacao_filme VARCHAR(2),
nome_filme VARCHAR(50),
duracao_filme SMALLINT
);

CREATE TABLE sessao(
id_sessao INT AUTO_INCREMENT PRIMARY KEY,
horario_sessao TIME,
fk_filme INT,
fk_sala INT,

FOREIGN KEY(fk_sala) REFERENCES sala(id_sala),
FOREIGN KEY(fk_filme) REFERENCES filme(id_filme)
);

CREATE TABLE tipo_ingresso(
id_tipoIngresso INT AUTO_INCREMENT PRIMARY KEY,
descricao TEXT
);

CREATE TABLE ingresso(
id_ingresso INT AUTO_INCREMENT PRIMARY KEY,
valor_ingresso DECIMAL(10,2),
fk_tipoIngresso INT,
fk_pedido INT,
fk_cliente INT,

FOREIGN KEY(fk_tipoIngresso) REFERENCES tipo_ingresso(id_tipoIngresso),
FOREIGN KEY(fk_pedido) REFERENCES pedido(id_pedido),
FOREIGN KEY(fk_cliente) REFERENCES cliente(id_cliente)
);

