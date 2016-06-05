--DESCRIÇÃO: Conversor de binario para dISplay de 7 segmentos

--REFERENCIA:	https://en.wikipedia.org/wiki/Double_dabble
--					http://www.deathbylogic.com/2013/12/binary-to-binary-coded-decimal-bcd-converter/

--Autores: Debora Emili Costa Oliveira 
--			  Igor Macedo Silva
--			  Jose Gamleira do Rego Neto

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
	
--Entidade do conversor de binario para display de 7 segmentos
ENTITY conversorDisplay7segmentos IS
	--Entradas e saidas do conversor
	PORT(
	--Entradas
	cont				 : IN STD_LOGIC_VECTOR(11 DOWNTO 0); --Resultado obtido no contador
	--Saidas
	displayMilhar   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); --DISplay de 7 segmentos que mostram a(s) unidade(s) de milhar(es) do tempo descorrido
	displayCentena  : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); --DISplay de 7 segmentos que mostram a(s) dezena(s) do tempo descorrido
	displayDezena   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); --DISplay de 7 segmentos que mostram a(s) centenas(s) do tempo descorrido
	displayUnidade  : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)  --DISplay de 7 segmentos que mostram a(s) unidades(s) do tempo descorrido
	);
END ENTITY;

ARCHITECTURE converter OF conversorDisplay7segmentos IS

	SIGNAL hundreds, tens, ones, thousands : STD_LOGIC_VECTOR(3 DOWNTO 0);
	
BEGIN
	bIN_to_bcd : PROCESS (cont)
		-- Variavel INterna para armazenar os bits
		VARIABLE shift : UNSIGNED(27 DOWNTO 0);
		
	  -- ALIAS FOR parts of shIFt regISter
		ALIAS num IS shift(11 DOWNTO 0);
		ALIAS one IS shift(15 DOWNTO 12);
		ALIAS ten IS shift(19 DOWNTO 16);
		ALIAS hun IS shift(23 DOWNTO 20);
		ALIAS tho IS shift(27 DOWNTO 24);
	
	BEGIN
		-- Limpa variaveIS e armazena novo numero
		num := UNSIGNED(cont);
		one := X"0";
		ten := X"0";
		hun := X"0";
		tho := X"0";
		
	  -- Um LOOP de 12 vezes
		FOR i IN 1 to num'LENGTH LOOP
		  -- Confere se alguma variavel eh maior ou igual a 5
			IF one >= 5 THEN
				one := one + 3;
			END IF;
			
			IF ten >= 5 THEN
				ten := ten + 3;
			END IF;
			
			IF hun >= 5 THEN
				hun := hun + 3;
			END IF;
			
		 -- desloca todos para esquerda
			shIFt := SHIFT_LEFT(shift, 1);
		END LOOP;
		
	  -- Manda numeros decimais para conversao
		hundreds		 <= STD_LOGIC_VECTOR(hun);
		tens    		 <= STD_LOGIC_VECTOR(ten);
		ones     	 <= STD_LOGIC_VECTOR(one);
		thousands    <= STD_LOGIC_VECTOR(tho);
	END PROCESS;
	
	WITH ones SELECT 
		displayUnidade <=	"0000001" when "0000",
								"1001111" when "0001",
								"0010010" when "0010",
								"0000110" when "0011",
								"1001100" when "0100",
								"0100100" when "0101",
								"0100000" when "0110",
								"0001111" when "0111",
								"0000000" when "1000",
								"0000100" when "1001",
								"1111111" when others;
		
	WITH tens SELECT
		displayDezena <= 	"0000001" when b"0000",
								"1001111" when "0001",
								"0010010" when "0010",
								"0000110" when "0011",
								"1001100" when "0100",
								"0100100" when "0101",
								"0100000" when "0110",
								"0001111" when "0111",
								"0000000" when "1000",
								"0000100" when "1001",
								"1111111" when others;
		
	WITH hundreds SELECT
		displayCentena <= "0000001" when b"0000",
								"1001111" when "0001",
								"0010010" when "0010",
								"0000110" when "0011",
								"1001100" when "0100",
								"0100100" when "0101",
								"0100000" when "0110",
								"0001111" when "0111",
								"0000000" when "1000",
								"0000100" when "1001",
								"1111111" when others;
		
	WITH thousands SELECT
		displayMilhar <= 	"0000001" when b"0000",
								"1001111" when "0001",
								"0010010" when "0010",
								"0000110" when "0011",
								"1001100" when "0100",
								"0100100" when "0101",
								"0100000" when "0110",
								"0001111" when "0111",
								"0000000" when "1000",
								"0000100" when "1001",
								"1111111" when others;

END ARCHITECTURE;