-- Elementos de Sistemas
-- by Luciano Soares
-- Ram4K.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Ram4K is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR(11 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch of Ram4k is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

component Ram512 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 8 downto 0);
		output: out STD_LOGIC_VECTOR(15 downto 0)
	);
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
			sel: in  STD_LOGIC_VECTOR(2  downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0)
		);
end component;

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
			q7:  out STD_LOGIC
		);
end component;

signal  vect0,vect1,vect2,vect3,vect4,vect5,vect6,vect7  														 : STD_LOGIC;
signal  stored_vect0,stored_vect1,stored_vect2,stored_vect3,stored_vect4,stored_vect5,
		stored_vect6,stored_vect7  : STD_LOGIC_VECTOR(15 downto 0);


begin

	vector0_creator: Ram512 port map(clock, input, vect0, address(8 downto 0), stored_vect0);
	vector1_creator: Ram512 port map(clock, input, vect1, address(8 downto 0), stored_vect1);
	vector2_creator: Ram512 port map(clock, input, vect2, address(8 downto 0), stored_vect2);
	vector3_creator: Ram512 port map(clock, input, vect3, address(8 downto 0), stored_vect3);
	vector4_creator: Ram512 port map(clock, input, vect4, address(8 downto 0), stored_vect4);
	vector5_creator: Ram512 port map(clock, input, vect5, address(8 downto 0), stored_vect5);
	vector6_creator: Ram512 port map(clock, input, vect6, address(8 downto 0), stored_vect6);
	vector7_creator: Ram512 port map(clock, input, vect7, address(8 downto 0), stored_vect7);


	chose_memory_destination: DMux8Way port map(load, address(11 downto 9), vect0, vect1, vect2, 
												vect3, vect4, vect5, vect6, vect7);

	read_memory: Mux8Way16 port map(stored_vect0, stored_vect1, stored_vect2, stored_vect3,
	 stored_vect4, stored_vect5, stored_vect6, stored_vect7, address(11 downto 9), output);


end architecture;
