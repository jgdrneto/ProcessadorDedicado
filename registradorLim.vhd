--DESCRIÇÃO: Registrador do tempo limite para apertar o botao depois do led acesso

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
	lim				 :	IN STD_LOGIC_VECTOR(11 DOWNTO 0); --Limite de tempo inicial para o usuario apertar o botao depois do led acesso	
	
	--Saidas
	RegLim   		 : IN STD_LOGIC_VECTOR(11 DOWNTO 0)  --Novo limite para o usuario apertar o botao 
	);
END ENTITY;

ARCHITECTURE resgitrarLim OF registradorLim IS

	BEGIN

END ARCHITECTURE;