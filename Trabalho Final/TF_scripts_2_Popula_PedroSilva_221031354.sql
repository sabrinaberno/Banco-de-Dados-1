-- ---------------------   << EVENTOS  >>   ---------------------
--
--                    SCRIPT DE POPULA (DDL)
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

use TF2;

-- Inserindo dados na tabela TIPOFESTA
INSERT INTO TIPOFESTA (tipoFesta) VALUES
('Casamento'),
('Aniversário'),
('Formatura'),
('Festa Infantil'),
('Chá de Bebê');

-- Inserindo dados na tabela ITEMDECORACAO
INSERT INTO ITEMDECORACAO (ItemDecoracao, valorDecoracao) VALUES
('Balão', 200.00),
('Flor', 500.00),
('Luz', 150.00),
('Mesa', 100.00),
('Cadeira', 60.00);

-- Inserindo dados na tabela ITEMBUFFET
INSERT INTO ITEMBUFFET (tipoItem, nomeItemBuffet) VALUES
('Bebida', 'Refrigerante'),
('Comida', 'Salgados'),
('Sobremesa', 'Bolo'),
('Bebida', 'Suco'),
('Sobremesa', 'Doces');

-- Inserindo dados na tabela FORMAPAGAMENTO
INSERT INTO FORMAPAGAMENTO (formaPagamento) VALUES
('Cartão de Crédito'),
('Boleto'),
('PIX'),
('Transferência Bancária'),
('Dinheiro');

-- Inserindo dados na tabela ENDERECO
INSERT INTO ENDERECO (CEP, bairro, rua, numero, complemento) VALUES
(12345678, 'Centro', 'Rua A', 100, 'Apt 101'),
(87654321, 'Jardim', 'Rua B', 200, 'Casa 2'),
(11223344, 'Vila Nova', 'Rua C', 300, 'Apt 202'),
(44332211, 'Alphaville', 'Rua D', 400, 'Casa 4'),
(55667788, 'Bela Vista', 'Rua E', 500, 'Apt 303'),
(66778899, 'Liberdade', 'Rua F', 600, 'Casa 5'),
(99887766, 'Centro', 'Rua G', 700, 'Apt 104'),
(55668877, 'Morumbi', 'Rua H', 800, 'Casa 6'),
(33445566, 'Vila Madalena', 'Rua I', 900, 'Apt 404'),
(77889900, 'Copacabana', 'Rua J', 1000, 'Cobertura 1'),
(33447788, 'Botafogo', 'Rua K', 1100, 'Casa 7'),
(11223355, 'Santa Cecília', 'Rua L', 1200, 'Apt 204'),
(66554433, 'Pinheiros', 'Rua M', 1300, 'Casa 8'),
(99882211, 'Ipanema', 'Rua N', 1400, 'Apt 504'),
(44335577, 'Lapa', 'Rua O', 1500, 'Casa 9'),
(66779988, 'Barra da Tijuca', 'Rua R', 1800, 'Casa 5'),
(99887755, 'Jardins', 'Rua S', 1900, 'Casa 11'),
(11225533, 'Campo Belo', 'Rua T', 2000, 'Casa 4');

-- Inserindo dados na tabela INFRACAO
INSERT INTO INFRACAO (infracao, gravidade) VALUES
('Atraso', 'Leve'),
('Falta', 'Grave'),
('Desrespeito', 'Moderada'),
('Roubo', 'Grave'),
('Má Conduta', 'Moderada');

-- Inserindo dados na tabela INGREDIENTE
INSERT INTO INGREDIENTE (nomeIngrediente) VALUES
('Farinha'),
('Açúcar'),
('Ovos'),
('Leite'),
('Chocolate');

-- Inserindo dados na tabela CARGO
INSERT INTO CARGO (nomeCargo, salarioDiaria) VALUES
('Garçom', 100.00),
('Cozinheiro', 150.00),
('Decorador', 120.00),
('Músico', 200.00),
('Fotógrafo', 250.00);

-- Inserindo dados na tabela FORNECEDOR
INSERT INTO FORNECEDOR (cnpjFornecedor, nomeFornecedor, chavePIX, telefone, idEndereco) VALUES
(44177254000155, 'João Pauo', 123456789, 987654321, 6),
(99490450000177, 'Miranda Luz', 223456789, 887654321, 2),
(32995967000147, 'Janaina Fernanda', 323456789, 787654321, 3),
(11788980000155, 'Jhoão Batista', 423456789, 687654321, 4),
(45429306000104, 'Dhébora Silva', 523456789, 587654321, 5);

-- Inserindo dados na tabela BUFFET
INSERT INTO BUFFET (valorPessoa) VALUES
(50.00),
(75.00),
(100.00),
(125.00),
(150.00);

-- Inserindo dados na tabela composto
INSERT INTO composto (idBuffet, iditemBuffet) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 3),
(3, 5),
(4, 4),
(5, 5);

-- Inserindo dados na tabela NOTAFISCAL
INSERT INTO NOTAFISCAL (valor, numNotaFiscal, cnpjFornecedor, idIngrediente) VALUES
(500, 123456789, 44177254000155, 1),
(300, 223456789, 99490450000177, 2),
(700, 323456789, 32995967000147, 3),
(400, 423456789, 11788980000155, 4),
(600, 523456789, 45429306000104, 5);

-- Inserindo dados na tabela EVENTO
INSERT INTO EVENTO (dataEvento, idBuffet, idTipoFesta, idEndereco) VALUES
('2024-06-01', 1, 1, 1),
('2024-07-01', 2, 2, 1),
('2024-08-01', 3, 3, 16),
('2024-09-01', 4, 4, 17),
('2024-10-01', 5, 5, 18);

-- Inserindo dados na tabela PAGAMENTO
INSERT INTO PAGAMENTO (qtdParcelas, valorTotal) VALUES
(2, 5000.00),
(3, 3000.00),
(1, 6000.00),
(2, 4000.00),
(1, 2000.00);

-- Inserindo dados na tabela PARCELA
INSERT INTO PARCELA (valor, dtVencimento, idPagamento, idFormaPagamento) VALUES
(1000.00, '2024-06-10', 1, 1),
(4000.00, '2024-07-10', 1, 2),
(1000.00, '2024-08-10', 2, 3),
(1000.00, '2024-09-10', 2, 4),
(1000.00, '2024-10-10', 2, 5),
(6000.00, '2024-06-15', 3, 4),
(2000.00, '2024-05-25', 4, 1),
(2000.00, '2024-06-25', 4, 1),
(2000.00, '2024-05-20', 4, 2);

-- Inserindo dados na tabela ALUGUELDECORACAO_aluga
INSERT INTO ALUGUELDECORACAO_aluga (qtdItens, idItemDecoracao, idEvento) VALUES
(10, 1, 1),
(5, 2, 2),
(15, 3, 3),
(20, 4, 4),
(25, 5, 5);

-- Inserindo dados na tabela CLIENTE
INSERT INTO CLIENTE (cpfCliente, nomeCliente, idEndereco) VALUES
(07000578033, 'João Silva', 7),
(11035674033, 'Maria Oliveira', 8),
(22478774003, 'Carlos Souza', 9),
(28269422045, 'Ana Costa', 10),
(42692401050, 'Fernanda Lima', 10),
(66103705088, 'Sabrina Caldas', 11),
(48459689085, 'Lucas Ferreira', 12),
(20957311079, 'Patrícia Santos', 13),
(85190221032, 'Thiago Souza', 14),
(10459731068, 'Felipe Amorim', 15); 

-- Inserindo dados na tabela PESSOAFISICA
INSERT INTO PESSOAFISICA (cpfCliente, conjugue) VALUES
(07000578033, 'Carla Silva'),
(11035674033, 'Pedro Oliveira'),
(22478774003, 'Juliana Souza'),
(28269422045, 'Marcos Costa'),
(42692401050, 'Bruno Lima');

-- Inserindo dados na tabela EMPRESA
INSERT INTO EMPRESA (cnpj, nomeEmpresa, cpfCliente) VALUES
(12345678000199, 'Empresa A', 66103705088),
(22345678000199, 'Empresa B', 48459689085),
(32345678000199, 'Empresa C', 20957311079),
(42345678000199, 'Empresa D', 85190221032),
(52345678000199, 'Empresa E', 10459731068);

-- Inserindo dados na tabela FUNCIONARIO
INSERT INTO FUNCIONARIO (cpfFuncionario, nomeFucionario, idCargo) VALUES
(81120675030, 'Paulo Santos', 1),
(55506958048, 'Lucas Lima', 2),
(61579900070, 'Mariana Almeida', 3),
(37534992001, 'Rafael Pereira', 4),
(76830269059, 'Camila Rocha', 5),
(18663344090, 'Gabriel Mendes', 1),
(16707970070, 'Larissa Silva', 2),
(05520096015, 'Roberto Costa', 3),
(03532924005, 'Isabela Martins', 4),
(66197664046, 'Fernando Alves', 5);

-- Inserindo dados na tabela FREELANCER
INSERT INTO FREELANCER (chavePIX, nota, cpfFuncionario) VALUES
('pixpaulo123', 9, 81120675030),
('pixlucas123', 8, 55506958048),
('pixmariana123', 10, 61579900070),
('pixrafael123', 7, 37534992001),
('pixcamila123', 6, 76830269059);

-- Inserindo dados na tabela FICHADO
INSERT INTO FICHADO (CTPS, tituloEleitor, cartaoVacinacao, agencia, conta, grauEscolaridade, cpfFuncionario) VALUES
(true, true, true, 1234, 56789, 'Ensino Médio', 18663344090),
(true, true, false, 2234, 56789, 'Ensino Superior', 16707970070),
(false, false, true, 3234, 56789, 'Ensino Médio', 05520096015),
(true, false, false, 4234, 56789, 'Ensino Fundamental', 03532924005),
(false, true, true, 5234, 56789, 'Ensino Superior', 66197664046);

-- Inserindo dados na tabela comete
INSERT INTO comete (cpfFuncionario, idInfracao) VALUES
(81120675030, 1),  -- Paulo Santos cometeu Atraso
(55506958048, 2),  -- Lucas Lima cometeu Falta
(61579900070, 3),  -- Mariana Almeida cometeu Desrespeito
(37534992001, 4),  -- Rafael Pereira cometeu Roubo
(76830269059, 5),  -- Camila Rocha cometeu Má Conduta
(18663344090, 1),  -- Gabriel Mendes cometeu Atraso
(16707970070, 2),  -- Larissa Silva cometeu Falta
(05520096015, 3),  -- Roberto Costa cometeu Desrespeito
(03532924005, 4),  -- Isabela Martins cometeu Roubo
(66197664046, 5);  -- Fernando Alves cometeu Má Conduta

-- Inserindo dados na tabela CONTRATO
INSERT INTO CONTRATO (tipoContrato, idEvento, cpfCliente, idPagamento) VALUES
('Unificado', 1, 07000578033, 1),
('Unificado', 2, 11035674033, 2),
('Buffet', 3, 22478774003, 3),
('Buffet', 4, 28269422045, 4),
('Buffet', 5, 42692401050, 5);