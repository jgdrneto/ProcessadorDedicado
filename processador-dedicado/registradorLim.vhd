--DESCRIÇÃO: Registrador do tempo limite para apertar o botao depois do led acesso
--TESTADO ok!

--Autores: Debora Emili Costa Oliveira 
--			  Igor Macedo Silva
--			  Jose Gamleira do Rego Neto

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;
	
--Entidade do registrador do tempo limite para apertar o botao depois do led acesso
ENTITY registradorLim IS
	--Entradas e saidas do registrador de tempo limite
	PORT(
	--Entradas
	clk				 : IN STD_LOGIC;						    --Clock usado no processador dedicado
	loadRegLim		 : IN STD_LOGIC; 						    --Sinal de load para o registrador de limite
	clearRegLim		 : IN STD_LOGIC; 						    --Sinal de clear para o registrador de limite
	ctrlMuxRegLim	 : IN STD_LOGIC;							 --Sinal de controle para o MUX do registrador de limite
	--lim				 :	IN STD_LOGIC_VECTOR(11 DOWNTO 0); --Limite de tempo inicial para o usuario apertar o botao depois do led acesso	
	
	--Saidas
	RegLim   		 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)  --Novo limite para o usuario apertar o botao 
	);
END ENTITY;

ARCHITECTURE resgitrarLim OF registradorLim IS
BEGIN
	PROCESS(clk,loadRegLim,clearRegLim,ctrlMuxRegLim)
	VARIABLE RegLim_temp : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
	BEGIN
		IF (clearRegLim = '1') THEN
			RegLim_temp := (OTHERS => '0');
		ELSIF (RISING_EDGE(clk) AND loadRegLim = '1') THEN
			CASE ctrlMuxRegLim IS
				WHEN '0' => RegLim_temp := '0'&RegLim_temp(11 DOWNTO 1);
				WHEN '1' => RegLim_temp := "111110100000"; -- dec(4000)
				WHEN OTHERS => RegLim_temp := RegLim_temp;
			END CASE;
		END IF;
		RegLim <= RegLim_temp;
	END PROCESS;
END ARCHITECTURE;