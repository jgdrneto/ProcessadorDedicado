--DESCRIÇÃO: Unidade de controle do processador dedicado de um jogo

--Autores: Debora Emili Costa Oliveira 
--			  Igor Macedo Silva
--			  Jose Gamleira do Rego Neto

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;
	
--Entidade de topo da unidade de controle do processador dedicado
ENTITY unidadeDeControle IS
	--Entradas e saidas da unidade de controle
	PORT(
	--Entradas
	b1 				 : IN STD_LOGIC;						   --Botao Inicalizador
	b2 				 : IN STD_LOGIC;   					   --Botao para apertar quando acender o led
	tc 				 : IN STD_LOGIC;   					   --Valor do termino de contagem
	c1				 	 : IN STD_LOGIC;   					   --Resultado da comparacao =
	c2				 	 : IN STD_LOGIC;   					   --Resultado de uma comparaçao <=
	regLG_0			 : IN STD_LOGIC;   					   --Ultimo bit a esquerda do registrador dos niveis
	reset				 : IN STD_LOGIC;						   --Botao de reset
	clk				 : IN STD_LOGIC;						   --Clock usado no processador dedicado
	clk50MHz			 : IN STD_LOGIC;							--Clock usado no Registrador PN
	
	--Saidas
	led_0 			 : OUT STD_LOGIC;   					   --Led que indica quando o botao b2 deve ser apertado
	led_1				 : OUT STD_LOGIC;   					   --Led que indica quando o usuario perdeu o jogo
	loadCont		    : OUT STD_LOGIC; 						--Sinal de load para o contador
	clearCont		 : OUT STD_LOGIC; 						--Sinal de clear para o contador
	loadRegLim		 : OUT STD_LOGIC; 						--Sinal de load para o registrador de limite
	clearRegLim		 : OUT STD_LOGIC; 						--Sinal de clear para o registrador de limite
	ctrlMuxRegLim	 : OUT STD_LOGIC;							--Sinal de controle para o MUX do registrador de limite
	loadRegLG	 	 : OUT STD_LOGIC;							--Sinal de load para o resgistradores dos leds dos niveis
	clearRegLG	 	 : OUT STD_LOGIC;							--Sinal de clear para o resgistradores dos leds dos niveis
	loadTemp	 	    : OUT STD_LOGIC;							--Sinal de load para o temporizador
	clearTemp	 	 : OUT STD_LOGIC;							--Sinal de clear para o temporizador
	loadRegTemp	 	 : OUT STD_LOGIC;							--Sinal de load para o registrador temporario
	clearRegTemp	 : OUT STD_LOGIC;							--Sinal de clear para o registrador temporario
	clock50MHz		 : OUT STD_LOGIC							--Clock usado no Registrador PN
	);		

END ENTITY;

ARCHITECTURE controlar OF unidadeDeControle IS
	
	--Definindo constantes dos estados	
	TYPE estado IS (INICIAL, TEMPOALEATORIO, ACENDELED, ESPERABOTAO, ACERTOU, ESPERA, PERDEU);
	SIGNAL ea, pe : estado;
	
	BEGIN
		
END ARCHITECTURE;