--DESCRIÇÃO: Processador dedicado de um jogo

--Autores: Debora Emili Costa Oliveira 
--			  Igor Macedo Silva
--			  Jose Gamleira do Rego Neto

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;
	
--Entidade de topo do processador dedicado
ENTITY processadorDedicado IS
	--Entradas e saidas do processador dedicado	
	PORT(
	--Entradas
	b1 				 : IN STD_LOGIC;						   --Botao Inicalizador
	b2 				 : IN STD_LOGIC;   					   --Botao para apertar quando acender o led
	reset				 : IN STD_LOGIC;						   --Botao de reset
	clk				 : IN STD_LOGIC;						   --Clock usado no processador dedicado
	
	--Saidas
	led_0 			 : IN STD_LOGIC;   					   --Led que indica quando o botao b2 deve ser apertado
	led_1				 : IN STD_LOGIC;   					   --Led que indica quando o usuario perdeu o jogo
	ledsLevel		 : IN STD_LOGIC_VECTOR(4 DOWNTO 0); --Leds que mostram o level do atual do jogo 
	displayMilhar   : IN STD_LOGIC_VECTOR(6 DOWNTO 0); --Display de 7 segmentos que mostram a(s) unidade(s) de milhar(es) do tempo descorrido
	displayCentena  : IN STD_LOGIC_VECTOR(6 DOWNTO 0); --Display de 7 segmentos que mostram a(s) dezena(s) do tempo descorrido
	displaydezena   : IN STD_LOGIC_VECTOR(6 DOWNTO 0); --Display de 7 segmentos que mostram a(s) centenas(s) do tempo descorrido
	displayUnidade  : IN STD_LOGIC_VECTOR(6 DOWNTO 0)  --Display de 7 segmentos que mostram a(s) unidades(s) do tempo descorrido
	);		

END ENTITY;

ARCHITECTURE processar OF processadorDedicado IS

	BEGIN

END ARCHITECTURE;