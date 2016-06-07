--DESCRIÇÃO: Registrador dos leds para o processador dedicado
-- TESTADO ok!

--Autores: Debora Emili Costa Oliveira 
--			  Igor Macedo Silva
--			  Jose Gamleira do Rego Neto

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;
	
--Entidade do registrador dos leds do processador dedicado
ENTITY registradorLeds IS
	--Entradas e saidas do registrador dos leds
	PORT(
	--Entradas
	clk				 : IN STD_LOGIC;						   --Clock usado no processador dedicado
	loadRegLG	 	 : IN STD_LOGIC;							--Sinal de load para o resgistradores dos leds dos niveis
	clearRegLG	 	 : IN STD_LOGIC;							--Sinal de clear para o resgistradores dos leds dos niveis
	
	--Saidas
	ledsLevel		 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)  --Leds que mostram o level do atual do jogo 
	);
END ENTITY;

ARCHITECTURE resgitrarLeds OF registradorLeds IS
BEGIN
	PROCESS(clk,loadRegLG,clearRegLG)
	VARIABLE RegLG_temp : STD_LOGIC_VECTOR(4 DOWNTO 0) := (OTHERS => '0');
	BEGIN
		IF (clearRegLG = '1') THEN
			RegLG_temp := (OTHERS => '0');
		ELSIF (RISING_EDGE(clk) AND loadRegLG = '1') THEN
			RegLG_temp := '1'&RegLG_temp(4 DOWNTO 1);
		END IF;
		ledsLevel <= RegLG_temp;
	END PROCESS;
END ARCHITECTURE;