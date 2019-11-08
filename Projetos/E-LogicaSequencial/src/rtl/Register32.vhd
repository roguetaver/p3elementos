-- Elementos de Sistemas
-- by Luciano Soares
-- Register32.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Register32 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(31 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(31 downto 0)
	);
end entity;

architecture arch of Register32 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

  component Register16 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0)
	);
  end component;

begin

	output0: Register16 port map (clock, input(31 downto 16), load, output(31 downto 16));
	output1: Register16 port map (clock, input(15 downto 0),  load, output(15 downto 0));

end architecture;
