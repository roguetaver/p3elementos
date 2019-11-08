-- Elementos de Sistemas
-- by Luciano Soares
-- FullAdder.vhd

-- Implementa Full Adder

Library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
	port(
		a,b,c:      in STD_LOGIC;   -- entradas
		soma,vaium: out STD_LOGIC   -- sum e carry
	);
end entity;

architecture rtl of FullAdder is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

begin
  -- Implementação vem aqui!

-- FEITO EM AULA
--soma <= ((not c) and (a xor b)) or ((not a) and (not b) and c ) or (a and b and c);

--vaium <= (b and c) or (a and ((not b and c) or (b and (not c))));


soma <= (a xor b) xor c; -- formas reduzidas
vaium <= (a and b) or (b and c) or (a and c); -- formas reduzidas



end architecture;
