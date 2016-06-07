--DESCRIÃ‡ÃƒO: Unidade de controle do processador dedicado de um jogo

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
	c2				 	 : IN STD_LOGIC;   					   --Resultado de uma comparaÃ§ao <=
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
	PROCESS(b1,b2,tc,c1,c2,regLG_0,reset)
	BEGIN
		CASE ea IS
			WHEN 	INICIAL =>			led_0 <= '0'; led_1 <= '0';
											loadCont <= '0'; clearCont <= '1';
											loadRegLim <= '1'; clearRegLim <= '0';	ctrlMuxRegLim <= '1';
											loadRegLG <= '0'; clearRegLG <= '1';
											loadTemp <= '0'; clearTemp <= '1';
											loadRegTemp <= '0'; clearRegTemp <='1';
											
											IF (b1 = '1') THEN
												pe <= TEMPOALEATORIO;
											ELSE
												pe <= INICIAL;
											END IF;
									
			WHEN	TEMPOALEATORIO =>	led_0 <= '0'; led_1 <= '0';
											loadCont <= '1'; clearCont <= '0';
											loadRegLim <= '0'; clearRegLim <= '0';	ctrlMuxRegLim <= '0';
											loadRegLG <= '0'; clearRegLG <= '0';
											loadTemp <= '0'; clearTemp <= '1';
											loadRegTemp <= '0'; clearRegTemp <='1';
											
											IF (c1 = '1') THEN
												pe <= ACENDELED;
											ELSE
												pe <= TEMPOALEATORIO;
											END IF;
											
			WHEN	ACENDELED =>		led_0 <= '1'; led_1 <= '0';
											loadCont <= '0'; clearCont <= '1';
											loadRegLim <= '0'; clearRegLim <= '0';	ctrlMuxRegLim <= '0';
											loadRegLG <= '0'; clearRegLG <= '0';
											loadTemp <= '0'; clearTemp <= '0';
											loadRegTemp <= '0'; clearRegTemp <='0';
											
											pe <= ESPERABOTAO;
											
			WHEN	ESPERABOTAO =>		led_0 <= '1'; led_1 <= '0';
											loadCont <= '1'; clearCont <= '0';
											loadRegLim <= '0'; clearRegLim <= '0';	ctrlMuxRegLim <= '0';
											loadRegLG <= '0'; clearRegLG <= '0';
											loadTemp <= '0'; clearTemp <= '0';
											loadRegTemp <= '1'; clearRegTemp <='0';
											
											IF (b2 = '1' AND c2 = '0') THEN
												pe <= ACERTOU;
											ELSIF (b2 = '0' AND c2 = '0') THEN
												pe <= ESPERABOTAO;
											ELSE
												pe <= PERDEU;
											END IF;
											
			WHEN	ACERTOU =>			led_0 <= '0'; led_1 <= '0';
											loadCont <= '0'; clearCont <= '0';
											loadRegLim <= '1'; clearRegLim <= '0';	ctrlMuxRegLim <= '0';
											loadRegLG <= '1'; clearRegLG <= '0';
											loadTemp <= '0'; clearTemp <= '1';
											loadRegTemp <= '1'; clearRegTemp <='0';
											
											pe <= ESPERA;
											
			WHEN 	ESPERA =>			led_0 <= '0'; led_1 <= '0';
											loadCont <= '0'; clearCont <= '0';
											loadRegLim <= '0'; clearRegLim <= '0';	ctrlMuxRegLim <= '0';
											loadRegLG <= '0'; clearRegLG <= '0';
											loadTemp <= '1'; clearTemp <= '0';
											loadRegTemp <= '0'; clearRegTemp <='0';
											
											IF (regLG_0 = '1' AND tc = '1') THEN
												pe <= INICIAL;
											ELSIF (regLG_0 = '0' AND tc = '1') THEN
												pe <= TEMPOALEATORIO;
											ELSE
												pe <= ESPERA;
											END IF;
											
			WHEN	PERDEU =>			led_0 <= '0'; led_1 <= '1';
											loadCont <= '0'; clearCont <= '0';
											loadRegLim <= '0'; clearRegLim <= '0';	ctrlMuxRegLim <= '0';
											loadRegLG <= '0'; clearRegLG <= '0';
											loadTemp <= '0'; clearTemp <= '0';
											loadRegTemp <= '0'; clearRegTemp <='0';
											
											IF (reset = '1') THEN
												pe <= INICIAL;
											ELSE
												pe <= PERDEU;
											END IF;
		END CASE;
	END PROCESS;
	
	PROCESS(clk)
	BEGIN
		IF RISING_EDGE(clk) THEN
			ea <= pe;
		END IF;
	END PROCESS;

	clock50MHz <= clk50MHz;
	
END ARCHITECTURE;