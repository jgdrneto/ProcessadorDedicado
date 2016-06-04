--DESCRIÇÃO: Registrador de numeros aleatorios para o processador dedicado

--Autores: Debora Emili Costa Oliveira 
--			  Igor Macedo Silva
--			  Jose Gamleira do Rego Neto

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;
	
--Entidade do registrador de numeros aleatorios para o processador dedicado
ENTITY registradorPN IS
	--Entradas e saidas do registrador PN
	PORT(
	--Entradas
	clk				 : IN STD_LOGIC;						    --Clock usado no processador dedicado
	
	--Saidas
	RegPN			    : IN STD_LOGIC_VECTOR(11 DOWNTO 0)  --Valor aleatorio do registrador PN
	);
END ENTITY;

ARCHITECTURE registrarPN OF registradorPN IS

	BEGIN

END ARCHITECTURE;