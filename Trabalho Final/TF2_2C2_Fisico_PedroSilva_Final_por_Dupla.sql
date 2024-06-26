-- ---------------------   << EVENTOS  >>   ---------------------
--
--                    SCRIPT DE CRIAÇÃO (DDL)
-- 
-- Data Criacao ...........: 07/06/2024
-- Autor(es) ..............: Pedro H. Silva e Sabrina C. Berno
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: TF2
-- 
-- 
-- PROJETO => 01 Base de Dados
--         => 25 Tabelas
-- 
-- -----------------------------------------------------------------
create database if not exists TF_2_2C2_PedroSilva;

use TF_2_2C2_PedroSilva;

CREATE TABLE IF NOT EXISTS TIPOFESTA (
    idTipoFesta INT PRIMARY KEY AUTO_INCREMENT,
    tipoFesta VARCHAR(50) NOT NULL
) Engine InnoDB AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS ITEMDECORACAO (
    idItemDecoracao INT PRIMARY KEY AUTO_INCREMENT,
    ItemDecoracao VARCHAR(50) NOT NULL,
    valorDecoracao FLOAT NOT NULL
) Engine InnoDB AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS ITEMBUFFET (
    idItemBuffet INT PRIMARY KEY AUTO_INCREMENT,
    tipoItem VARCHAR(50) NOT NULL,
    nomeItemBuffet VARCHAR(50) NOT NULL
) Engine InnoDB AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS FORMAPAGAMENTO (
    idFormaPagamento INT PRIMARY KEY AUTO_INCREMENT,
    formaPagamento VARCHAR(50) NOT NULL
) Engine InnoDB AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS ENDERECO (
    CEP INT NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    complemento VARCHAR(50),
    salaoProprio BOOLEAN,
    idEndereco INT PRIMARY KEY AUTO_INCREMENT
) Engine InnoDB AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS INFRACAO (
    idInfracao INT PRIMARY KEY AUTO_INCREMENT,
    infracao VARCHAR(50) NOT NULL,
    gravidade VARCHAR(50) NOT NULL
) Engine InnoDB AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS INGREDIENTE (
    idIngrediente INT PRIMARY KEY AUTO_INCREMENT,
    nomeIngrediente VARCHAR(50) NOT NULL
) Engine InnoDB AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS CARGO (
    idCargo INT PRIMARY KEY AUTO_INCREMENT,
    nomeCargo VARCHAR(50) NOT NULL,
    salarioDiaria FLOAT NOT NULL
) Engine InnoDB AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS FORNECEDOR (
    cnpjFornecedor BIGINT PRIMARY KEY,
    nomeFornecedor VARCHAR(50) NOT NULL,
    chavePIX INT NOT NULL,
    telefone INT NOT NULL,
    idEndereco INT NOT NULL,
    CONSTRAINT FORNECEDOR_ENDERECO_FK FOREIGN KEY (idEndereco) REFERENCES ENDERECO(idEndereco)
) Engine InnoDB;

CREATE TABLE IF NOT EXISTS BUFFET (
    idBuffet INT PRIMARY KEY AUTO_INCREMENT,
    valorPessoa FLOAT NOT NULL
) Engine InnoDB AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS composto (
	idBuffet INT NOT NULL,
    iditemBuffet INT NOT NULL,
    CONSTRAINT COMPOSTO_BUFFET_FK FOREIGN KEY (idBuffet) REFERENCES BUFFET(idBuffet),
    CONSTRAINT COMPOSTO_ITEMBUFFET_FK FOREIGN KEY (idItemBuffet) REFERENCES ITEMBUFFET(idItemBuffet)
) Engine InnoDB;

CREATE TABLE IF NOT EXISTS NOTAFISCAL (
    valor INT NOT NULL,
    numNotaFiscal INT NOT NULL PRIMARY KEY,
    cnpjFornecedor BIGINT NOT NULL,
    idIngrediente INT NOT NULL,
    CONSTRAINT NOTAFISCAL_FORNECEDOR_FK FOREIGN KEY (cnpjFornecedor) REFERENCES FORNECEDOR(cnpjFornecedor),
    CONSTRAINT NOTAFISCAL_INGREDIENTE_FK FOREIGN KEY (idIngrediente) REFERENCES INGREDIENTE(idIngrediente)
) Engine InnoDB;

CREATE TABLE IF NOT EXISTS EVENTO (
    idEvento INT PRIMARY KEY AUTO_INCREMENT,
    dataEvento DATE NOT NULL,
    idBuffet INT, 
    idTipoFesta INT NOT NULL,
    idEndereco INT NOT NULL, 
    CONSTRAINT EVENTO_BUFFET_FK FOREIGN KEY (idBuffet) REFERENCES BUFFET(idBuffet),
    CONSTRAINT EVENTO_TIPOFESTA_FK FOREIGN KEY (idTipoFesta) REFERENCES TIPOFESTA(idTipoFesta),
    CONSTRAINT CLIENTE_ENDERECO_FK FOREIGN KEY (idEndereco) REFERENCES ENDERECO(idEndereco)
) Engine InnoDB AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS PAGAMENTO (
    idPagamento INT PRIMARY KEY AUTO_INCREMENT,
    qtdParcelas INT NOT NULL
) Engine InnoDB AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS PARCELA (
    idParcela INT PRIMARY KEY AUTO_INCREMENT,
    valor FLOAT NOT NULL,
    dtVencimento DATE NOT NULL,
    idPagamento INT NOT NULL,
    idFormaPagamento INT NOT NULL,
    CONSTRAINT PARCELA_PAGAMENTO_FK FOREIGN KEY (idPagamento) REFERENCES PAGAMENTO(idPagamento),
    CONSTRAINT PARCELA_FORMAPAGAMENTO_FK FOREIGN KEY (idFormaPagamento) REFERENCES FORMAPAGAMENTO(idFormaPagamento)
) Engine InnoDB AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS ALUGUELDECORACAO_aluga (
    qtdItens INT NOT NULL,
    idItemDecoracao INT,
    idEvento INT,
    CONSTRAINT ALUGUELDECORACAO_ITEMDECORACAO_FK FOREIGN KEY (idItemDecoracao) REFERENCES ITEMDECORACAO(idItemDecoracao),
    CONSTRAINT ALUGUELDECORACAO_EVENTO_FK FOREIGN KEY (idEvento) REFERENCES EVENTO(idEvento)
) Engine InnoDB;

CREATE TABLE IF NOT EXISTS CLIENTE (
    cpfCliente BIGINT PRIMARY KEY,
    nomeCliente VARCHAR(50) NOT NULL,
    idEndereco INT NOT NULL,
    CONSTRAINT FK_CLIENTE_ENDERECO FOREIGN KEY (idEndereco) REFERENCES ENDERECO(idEndereco)
) Engine InnoDB;

CREATE TABLE IF NOT EXISTS PESSOAFISICA (
    cpfCliente BIGINT,
    conjugue VARCHAR(50),
    CONSTRAINT  FK_PESSOAFISICA_CLIENTE FOREIGN KEY (cpfCliente) REFERENCES CLIENTE(cpfCliente)
) Engine InnoDB;

CREATE TABLE IF NOT EXISTS EMPRESA (
    cnpj BIGINT NOT NULL,
    nomeEmpresa VARCHAR(50),
    cpfCliente BIGINT,
    CONSTRAINT FK_EMPRESA_CLIENTE FOREIGN KEY (cpfCliente) REFERENCES CLIENTE(cpfCliente)
) Engine InnoDB;

CREATE TABLE IF NOT EXISTS FUNCIONARIO (
    cpfFuncionario BIGINT PRIMARY KEY,
    nomeFucionario VARCHAR(50) NOT NULL,
	idCargo INT,
    CONSTRAINT FUNCIONARIO_CARGO_FK FOREIGN KEY (idCargo) REFERENCES CARGO(idCargo)
) Engine InnoDB;

CREATE TABLE IF NOT EXISTS FREELANCER (
    chavePIX VARCHAR(50),
    nota INT NOT NULL,
    cpfFuncionario BIGINT NOT NULL,
    CONSTRAINT FREELANCER_FUNCIONARIO_FK FOREIGN KEY (cpfFuncionario) REFERENCES FUNCIONARIO(cpfFuncionario)
) Engine InnoDB;

CREATE TABLE IF NOT EXISTS FICHADO (
    CTPS BOOLEAN NOT NULL,
    tituloEleitor BOOLEAN NOT NULL,
    cartaoVacinacao BOOLEAN NOT NULL,
    agencia INT NOT NULL,
    conta INT NOT NULL,
    grauEscolaridade VARCHAR(50) NOT NULL,
    cpfFuncionario BIGINT NOT NULL,
    CONSTRAINT FICHADO_FUNCIONARIO_FK FOREIGN KEY (cpfFuncionario) REFERENCES FUNCIONARIO(cpfFuncionario)
) Engine InnoDB;

CREATE TABLE IF NOT EXISTS trabalha (
	cpfFuncionario BIGINT,
    idEvento INT,
    CONSTRAINT TRABALHA_FUNCIONARIO_FK FOREIGN KEY (cpfFuncionario) REFERENCES FUNCIONARIO(cpfFuncionario),
    CONSTRAINT TRABALHA_EVENTO_FK FOREIGN KEY (idEvento) REFERENCES EVENTO(idEvento)
) Engine InnoDB;

CREATE TABLE IF NOT EXISTS comete (
	cpfFuncionario BIGINT,
    idInfracao INT,
    CONSTRAINT COMETE_FUNCIONARIO_FK FOREIGN KEY (cpfFuncionario) REFERENCES FUNCIONARIO(cpfFuncionario),
    CONSTRAINT COMETE_INFRACAO_FK FOREIGN KEY (idInfracao) REFERENCES INFRACAO(idInfracao)
) Engine InnoDB;

CREATE TABLE IF NOT EXISTS CONTRATO (
    idContrato INT PRIMARY KEY AUTO_INCREMENT,
    idEvento INT NOT NULL,
    cpfCliente BIGINT NOT NULL,
    idPagamento INT NOT NULL,
    dataAssinatura DATE NOT NULL,
    CONSTRAINT CONTRATO_EVENTO_FK FOREIGN KEY (idEvento) REFERENCES EVENTO(idEvento),
    CONSTRAINT CONTRATO_CLIENTE_FK FOREIGN KEY (cpfCliente) REFERENCES CLIENTE(cpfCliente),
    CONSTRAINT CONTRATO_PAGAMENTO_FK FOREIGN KEY (idPagamento) REFERENCES PAGAMENTO(idPagamento)
) Engine InnoDB AUTO_INCREMENT = 1;