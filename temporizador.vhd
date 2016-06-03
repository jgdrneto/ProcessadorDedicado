--DESCRIÇÃO: Temporizador para o bloco operacional

--Autores: Debora Emili Costa Oliveira 
--			  Igor Macedo Silva
--			  Jose Gamleira do Rego Neto

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;
	
--Entidade do temporizador para o bloco operacional
ENTITY temporizador IS
	--Entradas e saidas do temporizador
	PORT(
	--Entradas
	clk				 : IN STD_LOGIC;						    --Clock usado no processador dedicado
	loadTemp	 	    : IN STD_LOGIC;							 --Sinal de load para o temporizador
	clearTemp	 	 : IN STD_LOGIC;							 --Sinal de clear para o temporizador
	cont				 : IN STD_LOGIC_VECTOR(11 DOWNTO 0); --Resultado obtido no contador
	
	--Saidas
	RegCont   		 : IN STD_LOGIC_VECTOR(11 DOWNTO 0)  --Valor obtido no contador 
	);
END ENTITY;

ARCHITECTURE temporizar OF temporizador IS

	BEGIN

END ARCHITECTURE;