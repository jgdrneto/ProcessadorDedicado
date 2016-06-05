--DESCRIÇÃO: Comparador(=) para o bloco operacional

--Autores: Debora Emili Costa Oliveira 
--			  Igor Macedo Silva
--			  Jose Gamleira do Rego Neto

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;
	
--Entidade do comparador(=) para o bloco operacional
ENTITY comparadorIgual IS
	--Entradas e saidas do comparador =
	PORT(
	--Entradas
	RegPN			    : IN STD_LOGIC_VECTOR(11 DOWNTO 0); --Valor aleatorio do registrador PN
	cont				 : IN STD_LOGIC_VECTOR(11 DOWNTO 0); --Resultado obtido no contador
	
	--Saidas
	c1				 	 : OUT STD_LOGIC   					    --Resultado da comparacao =
	);
END ENTITY;

ARCHITECTURE compararIgual OF comparadorIgual IS
BEGIN
	PROCESS(RegPN,cont)
	BEGIN
		IF (RegPN = cont) THEN
			c1 <= '1';
		ELSE
			c1 <= '0';
		END IF;
	END PROCESS;
END ARCHITECTURE;