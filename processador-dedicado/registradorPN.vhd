--DESCRIÇÃO: Registrador de numeros aleatorios para o processador dedicado
-- TESTADO ok!

--REFERENCIAS: http://vhdlguru.blogspot.com.br/2010/03/random-number-generator-in-vhdl.html
--					https://en.wikipedia.org/wiki/Linear-feedback_shift_register

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
	clk				 : IN STD_LOGIC;						     --Clock usado no processador dedicado
	--Saidas
	RegPN			    : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)  --Valor aleatorio do registrador PN
	);
END ENTITY;

ARCHITECTURE registrarPN OF registradorPN IS
BEGIN
	PROCESS(clk)
	VARIABLE randomNum : STD_LOGIC_VECTOR(11 DOWNTO 0) := "101000010001"; -- seed
	VARIABLE randomNum_in : STD_LOGIC := '0';
	BEGIN
		IF (RISING_EDGE(clk)) THEN
			randomNum_in := (((randomNum(11-0) XOR randomNum(11-1)) XOR randomNum(11-2)) XOR randomNum(11-8));
			randomNum(11 DOWNTO 1) := randomNum(10 DOWNTO 0);
			randomNum(0) := randomNum_in;
		END IF;
		RegPN <= randomNum;
	END PROCESS;
END ARCHITECTURE;