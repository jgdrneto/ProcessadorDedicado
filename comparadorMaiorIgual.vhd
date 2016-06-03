--DESCRIÇÃO: Comparador(<=) para o bloco operacional

--Autores: Debora Emili Costa Oliveira 
--			  Igor Macedo Silva
--			  Jose Gamleira do Rego Neto

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;
	
--Entidade do comparador(<=) para o bloco operacional
ENTITY comparadorMaiorIgual IS
	--Entradas e saidas do comparador <=
	PORT(
	--Entradas
	RegLim   		 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);  --Novo limite para o usuario apertar o botao
	cont				 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);  --Resultado obtido no contador
	
	--Saidas
	c2				 	 : IN STD_LOGIC   					     --Resultado da comparacao <=
	);
END ENTITY;

ARCHITECTURE compararMaiorIgual OF comparadorMaiorIgual IS

	BEGIN

END ARCHITECTURE;