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
	clk50MHz			 : IN STD_LOGIC;							 --Clock usado no Registrador PN
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
	cont				 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);--Resultado obtido no contador
	c1				 	 : OUT STD_LOGIC;   					    --Resultado da comparacao =
	c2				 	 : OUT STD_LOGIC;   					    --Resultado de uma comparaçao <=
	tc 				 : OUT STD_LOGIC;   					    --Valor do termino de contagem
	ledsLevel		 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0); --Leds que mostram o level do atual do jogo
	regLG_0			 : OUT STD_LOGIC;   					    --Ultimo bit a esquerda do registrador dos niveis	
	displayMilhar   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); --Display de 7 segmentos que mostram a(s) unidade(s) de milhar(es) do tempo descorrido
	displayCentena  : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); --Display de 7 segmentos que mostram a(s) dezena(s) do tempo descorrido
	displaydezena   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); --Display de 7 segmentos que mostram a(s) centenas(s) do tempo descorrido
	displayUnidade  : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)  --Display de 7 segmentos que mostram a(s) unidades(s) do tempo descorrido
	);			

END ENTITY;

ARCHITECTURE operar OF blocoOperacional IS
	
	--Componente do contador
	COMPONENT contador
	--Entradas e saidas do contador
	PORT(
		--Entradas
		clk				 : IN STD_LOGIC;						    --Clock usado no processador dedicado
		loadCont		    : IN STD_LOGIC; 						    --Sinal de load para o contador
		clearCont		 : IN STD_LOGIC; 						    --Sinal de clear para o contador
		--Saidas
		cont				 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)  --Resultado obtido no contador
		);
	END COMPONENT;
	
	--Entidade do registrador do tempo limite para apertar o botao depois do led acesso
	COMPONENT registradorLim
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
	END COMPONENT;	
		
	--Entidade do registrador dos leds do processador dedicado
	COMPONENT registradorLeds
		--Entradas e saidas do registrador dos leds
		PORT(
		--Entradas
		clk				 : IN STD_LOGIC;						   --Clock usado no processador dedicado
		loadRegLG	 	 : IN STD_LOGIC;							--Sinal de load para o resgistradores dos leds dos niveis
		clearRegLG	 	 : IN STD_LOGIC;							--Sinal de clear para o resgistradores dos leds dos niveis
		
		--Saidas
		ledsLevel		 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)  --Leds que mostram o level do atual do jogo 
		);
	END COMPONENT;	
	
	--Entidade do temporizador para o bloco operacional
	COMPONENT temporizador
		--Entradas e saidas do temporizador
		PORT(
		--Entradas
		clk				 : IN STD_LOGIC;						    --Clock usado no processador dedicado
		loadTemp	 	    : IN STD_LOGIC;							 --Sinal de load para o temporizador
		clearTemp	 	 : IN STD_LOGIC;							 --Sinal de clear para o temporizador
		
		--Saidas
		tc			  		 : OUT STD_LOGIC 							--Valor obtido no contador 
		);
	END COMPONENT;
	
	--Entidade do registrador de numeros aleatorios para o processador dedicado
	COMPONENT registradorPN
		--Entradas e saidas do registrador PN
		PORT(
		--Entradas
		clk				 : IN STD_LOGIC;						     --Clock usado no processador dedicado
		--Saidas
		RegPN			    : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)  --Valor aleatorio do registrador PN
		);
	END COMPONENT;
	
	--Sinal para contador
	SIGNAL signal_Cont,signal_RegLim, signal_RegPN : STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL signal_clk : STD_LOGIC;
	
	BEGIN
	--------------------------------------------------------------------------
	
	CT : contador PORT MAP(clk =>clk,
									 loadCont =>loadCont,
									 clearCont =>clearCont,
									 cont =>signal_Cont
									 );
	
	--------------------------------------------------------------------------

	REGLIM : registradorLim PORT MAP(clk=>clk,
												loadRegLim=>loadRegLim,
												clearRegLim=>clearRegLim,
												ctrlMuxRegLim=>ctrlMuxRegLim,
												RegLim=>signal_RegLim
												);
   
	--------------------------------------------------------------------------
											
	REGLEDS : registradorLeds PORT MAP (clk=>clk,
												   loadRegLG=>loadRegLG,
													clearRegLG=>loadRegLG,
													ledsLevel=>ledsLevel
													);								 
	
	--------------------------------------------------------------------------

	TP : temporizador PORT MAP(clk=>clk,
										loadTemp=>loadTemp,
										clearTemp=>loadTemp,
										tc=>tc
									   );	
										
	--------------------------------------------------------------------------									

	RegPN : registradorPN PORT MAP(clk=>clk50MHz,
											 RegPN=>signal_RegPN
											 );
											 
	--------------------------------------------------------------------------										 

END ARCHITECTURE;