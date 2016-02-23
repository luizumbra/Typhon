/*										   *
 * Projeto Typhon								   *
 *										   *
 *   Etapa de criação do banco de dados.					   *
 *   	      	      	       	  						   *
 *   Script para a criação do banco de dados e das tabelas do projeto, de acordo   *
 * com a tese de dissertação "Ambiente para aplicações em Processamento de 	   *
 * Linguagem Natural: Tradução", tese desenvolvida como requisito parcial para a   *
 * obtenção de título de Mestre em Engenharia Elétrica da Universidade 	       	   *
 * Presbiteriana Mackenzie, desenvolvida pelo aluno, agora Mestre, Mike Jun Ogawa. *
 *										   *
 * Autor-principal: Kike Jun Ogawa						   *
 * Desenvovedor: Luiz Antonio Marques Ferreira					   *
 * 		      	      	      						   */

-- Criar a base de dados
DROP DATABASE IF NOT EXIST Typhon;
CREATE DATABASE Typhon;
USE DATABESE Typhon;

-- Tabela Lingua
DROP TABLE Lingua;
CREATE TABLE Lingua();

-- Tabela Classe
DROP TABLE Classe;
CREATE TABLE Classe();

-- Tabela Tipo
DROP TABLE Tipo;
CREATE TABLE Tipo();

-- Tabela Genero
DROP TABLE Genero
CREATE TABLE Genero();

-- Tabela Grau
DROP TABLE Grau;
CREATE TABLE Grau();

-- Tabela Dados_PtBr
DROP TABLE Dados_PtBr;
CREATE TABLE Dados_PtBr();

-- Tabela Conceito_PtBr
DROP TABLE Conceito_PtBr;
CREATE TABLE Conceito_PtBr();

-- Tabela Dicionario_PtBr
DROP TABLE Dicionario_PtBr;
CREATE TABLE Dicionario_PtBr();

-- Tabela Modelo_PtBr
DROP TABLE Modelo_PtBr;
CREATE TABLE Modelo_PtBr();

-- Tabela Regras_Verbo_Ptbr
DROP TABLE Regras_Verbo_PtBr;
CREATE TABLE Regras_Verbo_PtBr();

-- Tabela Grupo_PtBr
DROP TABLE Grupo_PtBr;
CREATE TABLE Grupo_PtBr();

-- Tabela Verbos_PtBr
DROP TABLE Verbos_PtBr;
CREATE TABLE Verbos_PtBr();

-- Tabela Dados_Lingua_2
DROP TABLE Dados_Lingua_2;
CREATE TABLE Dados_Lingua_2();

-- Tabela Conceito_Lingua_2
DROP TABLE Conceito_Lingua_2;
CREATE TABLE Conceito_Lingua_2();

-- Tabela Dicionario_Lingua_2
DROP TABLE Dicionario_Lingua_2;
CREATE TABLE Dicionario_Lingua_2();

-- Tabela Modelo_Lingua_2
DROP TABLE Modelo_Lingua_2;
CREATE TABLE Modelo_Lingua_2();

-- Tabela Regras_Verbo_Lingua_2
DROP TABLE Regras_Verbo_Lingua_2;
CREATE TABLE Regras_Verbo_Lingua_2();

-- Tabela Grupo_Lingua_2
DROP TABLE Grupo_Lingua_2;
CREATE TABLE Grupo_Lingua_2();

-- Tabela Verbos_Lingua_2
DROP TABLE Verbos_Lingua_2;
CREATE TABLE Verbos_Lingua_2();

-- Tabela Relacao
DROP TABLE Relacao;
CREATE TABLE Relacao();

-- Tabela Pessoa
DROP TABLE Pessoa;
CREATE TABLE Pessoa();

-- Tabela Tempo
DROP TABLE Tempo;
CREATE TABLE Tempo();

-- Tabela Modo
DROP TABLE Modo;
CREATE TABLE Modo();
