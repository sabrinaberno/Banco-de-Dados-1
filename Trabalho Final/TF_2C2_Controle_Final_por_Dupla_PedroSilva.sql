-- ---------------------   << EVENTOS  >>   ---------------------
--
--                    SCRIPT DE CRIAÇÃO DE USUÁRIOS (DDL)
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

CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'ger2024';
GRANT ALL PRIVILEGES ON  TF2.* TO 'gerente'@'localhost';

CREATE USER 'funcionario'@'localhost' IDENTIFIED BY 'fun2024';
GRANT SELECT ON  TF2.* TO 'funcionario'@'localhost';
