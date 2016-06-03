--DESCRIÇÃO: Conversor de binario para display de 7 segmentos

--Autores: Debora Emili Costa Oliveira 
--			  Igor Macedo Silva
--			  Jose Gamleira do Rego Neto

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;
	
--Entidade do conversor de binario para display de 7 segmentos
ENTITY conversorDisplay7segmentos IS
	--Entradas e saidas do conversor
	PORT(
	--Entradas
	cont				 : IN STD_LOGIC_VECTOR(11 DOWNTO 0); --Resultado obtido no contador
	
	--Saidas
	displayMilhar   : IN STD_LOGIC_VECTOR(6 DOWNTO 0); --Display de 7 segmentos que mostram a(s) unidade(s) de milhar(es) do tempo descorrido
	displayCentena  : IN STD_LOGIC_VECTOR(6 DOWNTO 0); --Display de 7 segmentos que mostram a(s) dezena(s) do tempo descorrido
	displaydezena   : IN STD_LOGIC_VECTOR(6 DOWNTO 0); --Display de 7 segmentos que mostram a(s) centenas(s) do tempo descorrido
	displayUnidade  : IN STD_LOGIC_VECTOR(6 DOWNTO 0)  --Display de 7 segmentos que mostram a(s) unidades(s) do tempo descorrido
	);
END ENTITY;

ARCHITECTURE converter OF conversorDisplay7segmentos IS

	BEGIN

END ARCHITECTURE;