-- Elementos de Sistemas
-- by Luciano Soares
-- Ram64.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Ram64 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR(5 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch of Ram64 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

component Ram8 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR(2 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
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
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
  	end component;

  	component Dmux8Way is
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

signal q0,q1,q2,q3,q4,q5,q6,q7: STD_LOGIC;
signal out0,out1,out2,out3,out4,out5,out6,out7: STD_LOGIC_VECTOR(15 downto 0);
signal outram: STD_LOGIC_VECTOR(15 downto 0);


begin

DM: Dmux8Way port map (load,address(2 downto 0), q0,q1,q2,q3,q4,q5,q6,q7);


r1: Ram8 port map (clock, input(15 downto 0), load, address(2 downto 0),out0);
r2: Ram8 port map (clock, input(15 downto 0), load, address(2 downto 0),out1);
r3: Ram8 port map (clock, input(15 downto 0), load, address(2 downto 0),out2);
r4: Ram8 port map (clock, input(15 downto 0), load, address(2 downto 0),out3);
r5: Ram8 port map (clock, input(15 downto 0), load, address(2 downto 0),out4);
r6: Ram8 port map (clock, input(15 downto 0), load, address(2 downto 0),out5);
r7: Ram8 port map (clock, input(15 downto 0), load, address(2 downto 0),out6);
r8: Ram8 port map (clock, input(15 downto 0), load, address(2 downto 0),out7);



M: Mux8Way16 port map (out0,out1,out2,out3,out4,out5,out6,out7,address(2 downto 0), output);





end architecture;
