-- Elementos de Sistemas
-- by Luciano Soares
-- Ram512.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Ram512 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 8 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch of Ram512 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.
  
component DMux8Way is
 	port ( 
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC;
			q2:  out STD_LOGIC;
			q3:  out STD_LOGIC;
			q4:  out STD_LOGIC;
			q5:  out STD_LOGIC;
			q6:  out STD_LOGIC;
			q7:  out STD_LOGIC);
  end component;
			
component Mux8Way16 is
    port (
  			a:   in  STD_LOGIC_VECTOR(15 downto 0);
  			b:   in  STD_LOGIC_VECTOR(15 downto 0);
  			c:   in  STD_LOGIC_VECTOR(15 downto 0);
  			d:   in  STD_LOGIC_VECTOR(15 downto 0);
  			e:   in  STD_LOGIC_VECTOR(15 downto 0);
  			f:   in  STD_LOGIC_VECTOR(15 downto 0);
  			g:   in  STD_LOGIC_VECTOR(15 downto 0);
  			h:   in  STD_LOGIC_VECTOR(15 downto 0);
  			sel: in  STD_LOGIC_VECTOR(2 downto 0);	
  			q:   out STD_LOGIC_VECTOR(15 downto 0));
  end component;
  
component Ram64 is
	port (
			clock:   in  STD_LOGIC;
			input:   in  STD_LOGIC_VECTOR(15 downto 0);
			load:    in  STD_LOGIC;
			address: in  STD_LOGIC_VECTOR( 5 downto 0);
			output:  out STD_LOGIC_VECTOR(15 downto 0));
	end component;
  
signal vetor1,vetor2,vetor3,vetor4,vetor5,vetor6,vetor7,vetor8: STD_LOGIC;
signal outA, outB, outC, outD, outE, outF, outG, outH :std_logic_vector(15 downto 0);
	

begin

	dmux: DMux8Way port map(load,address(8 downto 6),vetor1,vetor2,vetor3,vetor4,vetor5,vetor6,vetor7,vetor8);
	
	a: Ram64 port map(clock, input, vetor1, address(5 downto 0), outA);
	b: Ram64 port map(clock, input, vetor2, address(5 downto 0), outB);
	c: Ram64 port map(clock, input, vetor3, address(5 downto 0), outC);
	d: Ram64 port map(clock, input, vetor4, address(5 downto 0), outD);
	e: Ram64 port map(clock, input, vetor5, address(5 downto 0), outE);
	f: Ram64 port map(clock, input, vetor6, address(5 downto 0), outF);
	g: Ram64 port map(clock, input, vetor7, address(5 downto 0), outG);
	h: Ram64 port map(clock, input, vetor8, address(5 downto 0), outH);
	
	
	mux: Mux8Way16 port map(outA, outB, outC, outD, outE, outF, outG, outH, address(8 downto 6), output);



end architecture;
