--DESCRIÇÃO: Divisor de frequencia para o clock do processador dedicado

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
	clk				 : IN STD_LOGIC						   --Clock usado no processador dedicado
	);
END ENTITY;

ARCHITECTURE dividir OF divisorDeFrequencia IS

	BEGIN

END ARCHITECTURE;