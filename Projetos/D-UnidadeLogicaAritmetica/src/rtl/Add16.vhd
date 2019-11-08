-- Elementos de Sistemas
-- by Luciano Soares
-- Add16.vhd

-- Soma dois valores de 16 bits
-- ignorando o carry mais significativo

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Add16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		b   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Add16 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.
  signal c : STD_LOGIC_VECTOR(15 downto 0);

  component FullAdder is
    port(
      a,b,c:      in STD_LOGIC;   -- entradas
      soma,vaium: out STD_LOGIC   -- sum e carry
    );
  end component;

begin
  -- Implementação vem aqui!
  add1: FullAdder port map (a(0), b(0), '0', q(0), c(0));
  add2: FullAdder port map (a(1), b(1), c(0), q(1), c(1));
  add3: FullAdder port map (a(2), b(2), c(1), q(2), c(2));
  add4: FullAdder port map (a(3), b(3), c(2), q(3), c(3));
  add5: FullAdder port map (a(4), b(4), c(3), q(4), c(4));
  add6: FullAdder port map (a(5), b(5), c(4), q(5), c(5));
  add7: FullAdder port map (a(6), b(6), c(5), q(6), c(6));
  add8: FullAdder port map (a(7), b(7), c(6), q(7), c(7));
  add9: FullAdder port map (a(8), b(8), c(7), q(8), c(8));
  add10: FullAdder port map (a(9), b(9), c(8), q(9), c(9));
  add11: FullAdder port map (a(10), b(10), c(9), q(10), c(10));
  add12: FullAdder port map (a(11), b(11), c(10), q(11), c(11));
  add13: FullAdder port map (a(12), b(12), c(11), q(12), c(12));
  add14: FullAdder port map (a(13), b(13), c(12), q(13), c(13));
  add15: FullAdder port map (a(14), b(14), c(13), q(14), c(14));
  add16: FullAdder port map (a(15), b(15), c(14), q(15), c(15));

end architecture;
