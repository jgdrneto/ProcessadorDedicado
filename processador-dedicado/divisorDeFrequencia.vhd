--DESCRIÇÃO: Divisor de frequencia para o clock do processador dedicado
-- TESTADO ok!

--Autores: Debora Emili Costa Oliveira 
--			  Igor Macedo Silva
--			  Jose Gamleira do Rego Neto

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;
	
--Entidade de topo do Divisor de frequencia do processador dedicado
ENTITY divisorDeFrequencia IS
	--Entradas e saidas do divisor de frequencia
	PORT(
	--Entradas
	clkAnt			 : IN STD_LOGIC;						   --Clock da placa FPGA
	--Saidas
	clk				 : OUT STD_LOGIC;						   --Clock usado no processador dedicado
	clk50MHz			 : OUT STD_LOGIC							--Clock usado no Registrador PN
	);
END ENTITY;

ARCHITECTURE dividir OF divisorDeFrequencia IS
SIGNAL aux : STD_LOGIC := '0';
-- frequenciaEntrada/(2*x) = FrequenciaSaida;
-- x = frequenciaEntrada/(2*FrequenciaSaida) 

CONSTANT inputFrequency : INTEGER := 50000000;
CONSTANT outputFrequency : INTEGER := 1000;
CONSTANT x : INTEGER := inputFrequency/(2*outputFrequency);

BEGIN
	PROCESS(clkAnt)
	VARIABLE counter : INTEGER := 0;
	BEGIN
		IF (RISING_EDGE(clkAnt)) THEN
			counter := counter + 1;
			IF (counter = x) THEN
				aux <= not(aux);
				counter := 0;
			END IF;
		END IF;
		clk <= aux;
		clk50MHz <=clkAnt;
	END PROCESS;
END ARCHITECTURE;