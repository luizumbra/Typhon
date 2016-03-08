/*
 * Projeto Typhon
 * ==============
 *
 * Etapa:
 * =====
 *   Criação do banco de dados.
 *
 * Descrição:
 * =========
 *   Script para a criação do banco de dados e das tabelas do projeto, de acordo
 * com a tese de dissertação "Ambiente para aplicações em Processamento de Linguagem
 * Natural: Tradução", tese desenvolvida como requisito parcial para a obtenção de
 * título de Mestre em Engenharia Elétrica da Universidade Presbiteriana Mackenzie,
 * desenvolvida pelo aluno, agora Mestre, Mike Jun Ogawa.
 *
 * Desenvolvedores:
 * ===============
 *   Autor da monografia foi Ms. Mike Jun Ogawa.
 *   Desenvolvido por Luiz Antonio Marques Ferreira.
 *   Orientado pelo Prof. Dr. Nizam Omar
 *
 * Data:
 * ====
 *   20/12/2015
 */

/*
 * Base de Dados Typhon
 * ====================
 *
 * Descrição:
 * =========
 *   Base de dados linguística (Corpora - ptbr), usado no projeto.
 */
DROP DATABASE Typhon;
CREATE DATABASE Typhon;
USE DATABESE Typhon;


/*
 * Tabela Lingua
 * =============
 *
 * Descrição:
 * =========
 *   Nesta tabela será armazenadas as línguas existentes no sistema para então
 * realizar o paralelo entre elas nas estruturas compartilhadas.
 *
 * Exemplo:
 * =======
 * | id | cod        | descricao	     |
 * | 1	| 'ptbr'     | 'Português do Brasil' |
 * | 2	| 'enus'     | 'Inglês do EUA'	     |
 */
DROP TABLE Lingua;
CREATE TABLE Lingua(id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
       	     	    cod VARCHAR(4),
		    descricao VARCHAR(25));

/*
 * Tabela Classe
 * =============
 *
 * Descrição:
 * =========
 *   Esta estará presente as classes das palavras (ex: substantivo, adjetivo, entre
 * outros) e suas subclassificações (ex: substantivo comum e simples, primitivo
 * concreto entre outros).
 *
 * Exemplo:
 * =======
 * | id | id_lingua | descricao     | cod   |
 * | 1	| 1	    | 'Substantivo' | 'sub' |
 * | 2	| 1	    | 'Artigo'      | 'art' |
 * | 3	| 1	    | 'Adjetivo'    | 'adj' |
 */
DROP TABLE Classe;
CREATE TABLE Classe(id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
		    id_lingua INT UNSIGNED NOT NULL REFERENCES Lingua(id),
		    descricao VARCHAR(25),
		    cod VARCHAR(3));

/*
 * Tabela Tipo
 * ===========
 *
 * Descrição:
 * =========
 *   Esta apresentará os tipos relacionados a classe.
 *
 * Exemplo:
 * =======
 * | id | id_classe | descricao |
 * | 1	| 1	    | 'Comum'   |
 * | 1	| 1	    | 'Próprio' |
 */
DROP TABLE Tipo;
CREATE TABLE Tipo(id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
       	     	  id_classe INT UNSIGNED NOT NULL REFERENCES Classe(id),
		  descricao VARCHAR(25));

/*
 * Tabela Genero
 * =============
 *
 * Descrição:
 * =========
 *   Esta tabela contém as classificações dos gêneros dos termos.
 *
 * Exemplo:
 * =======
 * | id | id_classe | descricao	  |
 * | 1	| 1	    | 'masculino' |
 * | 2	| 1	    | 'feminino'  |
 */
DROP TABLE Genero
CREATE TABLE Genero(id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
       	     	    id_classe INT UNSIGNED NOT NULL REFERENCES Classe(id),
		    descricao VARCHAR(25));

/*
 * Tabela Grau
 * ===========
 *
 * Descrição:
 * =========
 *   Nesta tabela há, por exemplo, o grau dos substantivos que pode ser o
 * aumentativo ou diminutivo.
 *
 * Exemplo:
 * =======
 * | id | id_classe | descricao	    |
 * | 1	| 1	    | 'aumentativo' |
 * | 2	| 1	    | 'diminutivo'  |
 */
DROP TABLE Grau;
CREATE TABLE Grau(id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
       	     	  id_classe INT UNSIGNED NOT NULL REFERENCES Classe(id),
		  grau VARCHAR(25));

/*
 * Tabela Dados
 * ============
 *
 * Descrição:
 * =========
 *   Palavra entregue.
 *
 * Exemplo:
 * =======
 * | id | palavra	 | id_classe  | id_tipo | id_genero | id_grau | eh_composta | id_Relacao |
 * | 1	| 'gato'  	 | 1	      |	1	| 1	    | 3	      |	FALSE	    | NULL	 |
 * | 2	| 'flor-de-lins' | 1	      |	2	| 3	    | 3	      | TRUE	    | NULL	 |
 */
DROP TABLE Dados;
CREATE TABLE Dados(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       	     	   palavra VARCHAR(100) NOT NULL,
		   id_classe INT UNSIGNED REFERENCES Classe(id),
		   id_tipo INT UNSIGNED REFERENCES Tipo(id),
		   id_genero INT UNSIGNED REFERENCES Genero(id),
		   id_grau INT UNSIGNED REFERENCES Grau(id),
		   eh_composta BOOLEAN,
		   id_relacao INT UNSIGNED); -- FIXME, descobrir para que serve id_relacao

/*
 * Tabela Dicionário
 * =================
 *
 * Descrição:
 * =========
 *   Está tabela irá conter uma palavra e os índices dos termos dessa palavra.
 *
 * Exemplo:
 * =======
 * | id | descricao	  | id_dado |
 * | 1	| Substantivo	  | 1	    |
 * | 2	| 		  | 1	    |
 */
DROP TABLE Dicionario;
CREATE TABLE Dicionario(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       		   	descricao VARCHAR(250) NOT NULL,
		   	id_dado INT UNSIGNED NOT NULL REFERENCES Dado(id));

/*
 * Tabela Sufixo
 * =============
 *
 * Descrição:
 * =========
 *   Tipo de sufixo a ser utilizado.
 *
 * Exemplo:
 * =======
 * | id | descricao  |
 * | 1	| 'plural    |
 * | 2 	| 'feminino' |
 */
DROP TABLE Sufixo
CREATE TABLE Sufixo(id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
       	     	    descricao VARCHAR(25));

/*
 * Tabela Reducao
 * ==============
 *
 * Descrição:
 * =========
 *  Insere o sufixo do diminutivo de uma palavra.
 *
 * Exemplo:
 * =======
 * | id | id_sufixo | sufixo | minimo_termo | substituir_por | eh_execao |
 * | 1	| 1	    | 'ns'   | 1	    | 'm'	     | NULL   	 |
 * | 2	| 1	    | 'ões'  | 2	    | 'ão'	     | NULL   	 |
 */
DROP TABLE Reducao;
CREATE TABLE Reducao(id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
       	     	     id_sufixo INT NOT NULL REFERENCES Sufixo(id),
		     sufixo VARCHAR(5),
		     minimo_termo INT UNSIGNED,
		     substituir_por VARCHAR(5),
		     execao BOOLEAN);

/*
 * Tabela Modo
 * ===========
 *
 * Descrição:
 * =========
 *   Indica o modo verbal de ação do verbo.
 *
 * Exemplo:
 * =======
 * | id | descricao    | id_lingua |
 * | 1	| 'Indicativo' | 1	   |
 * | 2	| 'Subjuntivo' | 1	   |
 */
DROP TABLE Modo;
CREATE TABLE Modo(id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
       	     	  descricao VARCHAR(15) NOT NULL,
		  id_lingua INT UNSIGNED REFERENCES Lingua(id));

/*
 * Tabela Pessoa
 * =============
 *
 * Descrição:
 * =========
 *   Indica a pessoa para o tempo verbal.
 *
 * Exemplo:
 * =======
 * | id | id_lingua | descricao |
 * | 1	| 1	    | 'Eu'	|
 * | 2	| 1	    | 'Tu'	|
 */
DROP TABLE Pessoa;
CREATE TABLE Pessoa(id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
       	     	    id_lingua INT UNSIGNED NOT NULL REFERENCES Lingua(id),
		    descrição VARCHAR(10));

/*
 * Tabela Tempo
 * ============
 *
 * Descrição:
 * =========
 *   Indica o tempo verbal a ser conjugado.
 *
 * Exemplo:
 * =======
 * | id | descricao	       | id_modo |
 * | 1	| 'Presente'   	       | 1       |
 * | 2	| 'Pretérito Perfeito' | 1	 |
 */
DROP TABLE Tempo;
CREATE TABLE Tempo(id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
       	     	   descricao VARCHAR(20),
		   id_modo INT UNSIGNED NOT NULL REFERENCES Modo(id));

/*
 * Tabela Grupo
 * ============
 *
 * Descrição:
 * =========
 *   Informa o tipo do verbo, se ele é auxiliar, regular e etc.
 *
 * Exemplo:
 * =======
 * | id | descricao	      |
 * | 1	| 'Verbos auxiliares' |
 * | 2	| 'Verbos regulares'  |
 */
DROP TABLE Grupo;
CREATE TABLE Grupo(id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
       	     	   descricao VARCHAR(50));

/*
 * Tabela Modelo
 * =============
 *
 * Descrição:
 * =========
 *   
 */
