--
-- Elementos de Sistemas - Aula 5 - Logica Combinacional
-- Rafael . Corsi @ insper . edu . br 
--
-- Arquivo exemplo para acionar os LEDs e ler os bottoes
-- da placa DE0-CV utilizada no curso de elementos de 
-- sistemas do 3s da eng. da computacao

----------------------------
-- Bibliotecas ieee       --
----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity TopLevel is
	port(
		SW      : in  std_logic_vector(9 downto 0);
		HEX0    : out std_logic_vector(6 downto 0); -- 7seg0
		HEX1    : out std_logic_vector(6 downto 0); -- 7seg1
		HEX2    : out std_logic_vector(6 downto 0); -- 7seg2
		HEX3    : out std_logic_vector(6 downto 0); -- 7seg3
		LEDR    : out std_logic_vector(9 downto 0)
	);
end entity;

----------------------------
-- Implementacao do bloco -- 
----------------------------
architecture rtl of TopLevel is

--------------
-- signals
--------------

---------------
-- implementacao
---------------
begin
 
 HEX0 <= 
 		"1000000" when (sw(3 downto 0) = "0000") else
 		"1111001" when (sw(3 downto 0) = "0001") else
 		"0100100" when (sw(3 downto 0) = "0010") else
 		"0110000" when (sw(3 downto 0) = "0011") else
 		"0011001" when (sw(3 downto 0) = "0100") else
 		"0010010" when (sw(3 downto 0) = "0101") else
 		"0000010" when (sw(3 downto 0) = "0110") else
 		"1111000" when (sw(3 downto 0) = "0111") else
 		"0000000" when (sw(3 downto 0) = "1000") else
 		"0010000" when (sw(3 downto 0) = "1001") else

 		
 		"0001000" when (sw(3 downto 0) = "1010") else
 		"0000011" when (sw(3 downto 0) = "1011") else
 		"1000110" when (sw(3 downto 0) = "1100") else
 		"0100001" when (sw(3 downto 0) = "1101") else
 		"0000110" when (sw(3 downto 0) = "1110") else
 		"0001110";
end rtl;
