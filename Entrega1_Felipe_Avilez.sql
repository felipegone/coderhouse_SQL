CREATE DATABASE banco;
USE banco;

CREATE TABLE cliente(
id int PRIMARY KEY AUTO_INCREMENT,
id_endereco int,
nome varchar(50),
data_nascimento datetime,
cpf int,
email varchar(30)
);

CREATE TABLE endereco(
id int PRIMARY KEY AUTO_INCREMENT,
logradouro varchar(50),
cep int,
estado varchar(20),
cidade varchar(20)
);

CREATE TABLE emprestimo(
id int PRIMARY KEY AUTO_INCREMENT,
status_aprovacao int,
valor_disponibilizado float,
data_solicitacao datetime,
tipo_emprestimo int,
valor_contratado float
);

CREATE TABLE contas(
id int PRIMARY KEY AUTO_INCREMENT,
id_transacoes int,
agencia int,
data_abertura datetime,
saldo float,
id_cliente int,
id_emprestimo int
);

CREATE TABLE transacoes(
id int PRIMARY KEY AUTO_INCREMENT,
id_tipo_transacao int,
data_do_movimento datetime,
status_do_movimento varchar(20)
);

CREATE TABLE tipo_transacao(
id int PRIMARY KEY AUTO_INCREMENT,
descricao varchar(20)
);

ALTER TABLE contas
ADD CONSTRAINT FOREIGN KEY(id_cliente) REFERENCES cliente(id);

ALTER TABLE contas
ADD CONSTRAINT FOREIGN KEY(id_emprestimo) REFERENCES emprestimo(id);

ALTER TABLE contas
ADD CONSTRAINT FOREIGN KEY(id_transacoes) REFERENCES transacoes(id);

ALTER TABLE cliente
ADD CONSTRAINT FOREIGN KEY(id_endereco) REFERENCES endereco(id);

ALTER TABLE transacoes
ADD CONSTRAINT FOREIGN KEY(id_tipo_transacao) REFERENCES tipo_transacao(id);