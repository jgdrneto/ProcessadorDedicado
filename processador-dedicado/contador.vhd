--DESCRIÇÃO: Contador para o bloco operacional do processador dedicado

--Autores: Debora Emili Costa Oliveira 
--			  Igor Macedo Silva
--			  Jose Gamleira do Rego Neto

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
	
--Entidade de topo do contador para o bloco operacional do processador dedicado
ENTITY contador IS
	--Entradas e saidas do contador
	PORT(
	--Entradas
	clk				 : IN STD_LOGIC;						    --Clock usado no processador dedicado
	loadCont		    : IN STD_LOGIC; 						    --Sinal de load para o contador
	clearCont		 : IN STD_LOGIC; 						    --Sinal de clear para o contador
	--Saidas
	cont				 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)  --Resultado obtido no contador
	);
END ENTITY;

ARCHITECTURE contar OF contador IS
BEGIN
	PROCESS(clk,clearCont,loadCont)
	VARIABLE contTemp : UNSIGNED(11 DOWNTO 0) := (OTHERS => '0');
	BEGIN
		IF (clearCont = '1') THEN
			contTemp := (others => '0');
		ELSIF (RISING_EDGE(clk) AND loadCont = '1') THEN
			contTemp := contTemp + 1;
		END IF;
		cont <= STD_LOGIC_VECTOR(contTemp);
	END PROCESS;
END ARCHITECTURE;