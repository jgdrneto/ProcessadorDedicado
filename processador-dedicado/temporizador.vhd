--DESCRIÇÃO: Temporizador para o bloco operacional

--Autores: Debora Emili Costa Oliveira 
--			  Igor Macedo Silva
--			  Jose Gamleira do Rego Neto

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
	
--Entidade do temporizador para o bloco operacional
ENTITY temporizador IS
	--Entradas e saidas do temporizador
	PORT(
	--Entradas
	clk				 : IN STD_LOGIC;						    --Clock usado no processador dedicado
	loadTemp	 	    : IN STD_LOGIC;							 --Sinal de load para o temporizador
	clearTemp	 	 : IN STD_LOGIC;							 --Sinal de clear para o temporizador
	
	--Saidas
	tc			  		 : OUT STD_LOGIC 							--Valor obtido no contador 
	);
END ENTITY;

ARCHITECTURE temporizar OF temporizador IS
BEGIN
	PROCESS(clk,clearTemp,loadTemp)
		VARIABLE temp_Temp : UNSIGNED(11 DOWNTO 0) := (OTHERS => '0');
	BEGIN
		IF (clearTemp = '1') THEN
			temp_Temp := (others => '0');
		ELSIF (RISING_EDGE(clk) AND loadTemp = '1') THEN
			temp_Temp := temp_Temp + 1;
		END IF;
		
		IF (temp_Temp = "001111101000") THEN
			tc <= '1';
		ELSE
			tc <= '0';
		END IF;
		
	END PROCESS;
END ARCHITECTURE;