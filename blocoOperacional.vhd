--DESCRIÇÃO: Bloco operacional do processador dedicado de um jogo

--Autores: Debora Emili Costa Oliveira 
--			  Igor Macedo Silva
--			  Jose Gamleira do Rego Neto

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;
	
--Entidade de topo do bloco operacional do processador dedicado
ENTITY blocoOperacional IS
	--Entradas e saidas do bloco operacional
	PORT(
	--Entradas
	clk				 : IN STD_LOGIC;						    --Clock usado no processador dedicado
	loadCont		    : IN STD_LOGIC; 						    --Sinal de load para o contador
	clearCont		 : IN STD_LOGIC; 						    --Sinal de clear para o contador
	loadRegLim		 : IN STD_LOGIC; 						    --Sinal de load para o registrador de limite
	clearRegLim		 : IN STD_LOGIC; 						    --Sinal de clear para o registrador de limite
	ctrlMuxRegLim	 : IN STD_LOGIC;							 --Sinal de controle para o MUX do registrador de limite
	loadRegLG	 	 : IN STD_LOGIC;							 --Sinal de load para o resgistradores dos leds dos niveis
	clearRegLG	 	 : IN STD_LOGIC;							 --Sinal de clear para o resgistradores dos leds dos niveis
	loadTemp	 	    : IN STD_LOGIC;							 --Sinal de load para o temporizador
	clearTemp	 	 : IN STD_LOGIC;							 --Sinal de clear para o temporizador
	loadRegTemp	 	 : IN STD_LOGIC;							 --Sinal de load para o registrador temporario
	clearRegTemp	 : IN STD_LOGIC;							 --Sinal de clear para o registrador temporario
	lim				 :	IN STD_LOGIC_VECTOR(11 DOWNTO 0); --Limite de tempo inicial para o usuario apertar o botao depois do led acesso			
	--Saidas
	cont				 : IN STD_LOGIC_VECTOR(11 DOWNTO 0); --Resultado obtido no contador
	led_0 			 : IN STD_LOGIC;   					    --Led que indica quando o botao b2 deve ser apertado
	led_1				 : IN STD_LOGIC;   					    --Led que indica quando o usuario perdeu o jogo
	c1				 	 : IN STD_LOGIC;   					    --Resultado da comparacao =
	c2				 	 : IN STD_LOGIC;   					    --Resultado de uma comparaçao <=
	tc 				 : IN STD_LOGIC;   					    --Valor do termino de contagem
	ledsLevel		 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);  --Leds que mostram o level do atual do jogo
	regLG_0			 : IN STD_LOGIC;   					    --Ultimo bit a esquerda do registrador dos niveis	
	displayMilhar   : IN STD_LOGIC_VECTOR(6 DOWNTO 0);  --Display de 7 segmentos que mostram a(s) unidade(s) de milhar(es) do tempo descorrido
	displayCentena  : IN STD_LOGIC_VECTOR(6 DOWNTO 0);  --Display de 7 segmentos que mostram a(s) dezena(s) do tempo descorrido
	displaydezena   : IN STD_LOGIC_VECTOR(6 DOWNTO 0);  --Display de 7 segmentos que mostram a(s) centenas(s) do tempo descorrido
	displayUnidade  : IN STD_LOGIC_VECTOR(6 DOWNTO 0)   --Display de 7 segmentos que mostram a(s) unidades(s) do tempo descorrido
	);			

END ENTITY;

ARCHITECTURE operar OF blocoOperacional IS

	BEGIN

END ARCHITECTURE;