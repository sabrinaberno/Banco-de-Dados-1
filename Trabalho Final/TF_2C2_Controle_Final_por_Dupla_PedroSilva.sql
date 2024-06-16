
-- ---------------------   << EVENTOS  >>   ---------------------
--
--                    SCRIPT DE CONTROLE (DDL)
-- 
-- Data Criacao ...........: 14/06/2024
-- Autor(es) ..............: Pedro H. Silva e Sabrina C. Berno
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: TF2
-- 
-- 
-- PROJETO => 01 Base de Dados
--         => 25 Tabelas
-- 
-- -----------------------------------------------------------------

USE TF2;

-- Criando perfis de usuário
CREATE ROLE 'admin';
CREATE ROLE 'funcionario';

-- Concessão de privilégios aos papéis
GRANT ALL PRIVILEGES ON TF2.* TO 'admin';
GRANT SELECT ON TF2.* TO 'funcionario';

-- Criação de usuários E Concessão de papéis
CREATE USER 'sabrina'@'localhost' IDENTIFIED BY 'SAb@2024#';
GRANT 'admin' TO 'sabrina'@'localhost';

CREATE USER 'Jonathan'@'localhost' IDENTIFIED BY 'JOn@2024#';
GRANT 'admin' TO 'sabrina'@'localhost';

CREATE USER 'luis'@'localhost' IDENTIFIED BY 'Lui@2024!';
GRANT 'funcionario' TO 'luis'@'localhost';

CREATE USER 'natalia'@'localhost' IDENTIFIED BY 'Nat@2024!';
GRANT 'funcionario' TO 'natalia'@'localhost';



