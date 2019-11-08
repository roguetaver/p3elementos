library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MemoryIO is
   PORT(
     -- Sistema
     CLK_SLOW : IN  STD_LOGIC;
     CLK_FAST : IN  STD_LOGIC;
     RST      : IN  STD_LOGIC;

     -- CPU signals
     ADDRESS  : IN  STD_LOGIC_VECTOR (14 DOWNTO 0);
     INPUT		: IN  STD_LOGIC_VECTOR (15 DOWNTO 0);
     LOAD	  	: IN  STD_LOGIC ;
     OUTPUT		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);

     -- LCD EXTERNAL I/OS
     LCD_CS_N     : OUT   STD_LOGIC;
     LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
     LCD_RD_N     : OUT   STD_LOGIC;
     LCD_RESET_N  : OUT   STD_LOGIC;
     LCD_RS       : OUT   STD_LOGIC;
     LCD_WR_N     : OUT   STD_LOGIC;
     LCD_ON       : OUT   STD_LOGIC := '1';	-- liga e desliga o LCD
     LCD_INIT_OK  : OUT   STD_LOGIC;

     -- I/Os
     SW  : in std_logic_vector(9 downto 0);
     SSEG: OUT std_logic_vector(6 downto 0);
     LED : OUT std_logic_vector(9 downto 0)

		);
end entity;


ARCHITECTURE logic OF MemoryIO IS

  component Screen is
    PORT(
      -- Sistema
      CLK_FAST : IN  STD_LOGIC;
      CLK_SLOW : IN  STD_LOGIC;
      RST 	   : IN  STD_LOGIC;

      -- interface
      INPUT        : IN STD_LOGIC_VECTOR(15 downto 0); -- vetor de pxs
      LOAD         : IN  STD_LOGIC;                    -- grava dado
      ADDRESS      : IN STD_LOGIC_VECTOR(13 downto 0); -- endereço

      -- LCD EXTERNAL I/OS
      LCD_INIT_OK  : OUT STD_LOGIC;
      LCD_CS_N     : OUT   STD_LOGIC;
      LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
      LCD_RD_N     : OUT   STD_LOGIC;
      LCD_RESET_N  : OUT   STD_LOGIC;
      LCD_RS       : OUT   STD_LOGIC;
      LCD_WR_N     : OUT   STD_LOGIC);
  end component;

  component RAM16K is
    port  (
      clock		: IN STD_LOGIC;
      address	: IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      wren		: IN STD_LOGIC;
      q		   : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
  end component;

  component Register16 is
    port(
      clock:   in STD_LOGIC;
      input:   in STD_LOGIC_VECTOR(15 downto 0);
      load:    in STD_LOGIC;
      output: out STD_LOGIC_VECTOR(15 downto 0));
  end component;

  component Mux4Way16 is
    Port (
      sel : in  STD_LOGIC_VECTOR ( 1 downto 0);
      a   : in  STD_LOGIC_VECTOR (15 downto 0);
      b   : in  STD_LOGIC_VECTOR (15 downto 0);
      c   : in  STD_LOGIC_VECTOR (15 downto 0);
      d   : in  STD_LOGIC_VECTOR (15 downto 0);
      q   : out STD_LOGIC_VECTOR (15 downto 0));
  end component;

  signal seletorMux, seletorDmux : std_logic_vector(1 downto 0);
  signal qRAM : std_logic_vector(15  downto 0);
  signal wRAM : std_logic;
  signal swout: STD_LOGIC_VECTOR(15 downto 0);
  signal wReg : std_logic;
  signal outReg : STD_LOGIC_VECTOR(15 downto 0);
  signal wLCD : std_logic;

begin

-----------------------------------
-- Dicas de uso, screen e RAM16k --
-----------------------------------

--    DISPLAY: Screen  port map (
--          RST         => RST,
--          CLK_FAST    => CLK_FAST,
--          CLK_SLOW    => CLK_SLOW,
--          INPUT       =>
--          LOAD        =>
--          ADDRESS     =>
--          LCD_INIT_OK => LCD_INIT_OK,
--          LCD_CS_N 	  => LCD_CS_N ,
--          LCD_D       => LCD_D,
--          LCD_RD_N 	  => LCD_RD_N,
--          LCD_RESET_N => LCD_RESET_N,
--          LCD_RS 	    => LCD_RS,
--          LCD_WR_N 	  => LCD_WR_N
--    );
  
    screenportmap: Screen  port map (
         RST         => RST,
         CLK_FAST    => CLK_FAST,
         CLK_SLOW    => CLK_SLOW,
         INPUT       => INPUT(15 downto 0),
         LOAD        => wLCD,
         ADDRESS     => ADDRESS(13 downto 0),
         LCD_INIT_OK => LCD_INIT_OK,
         LCD_CS_N     => LCD_CS_N ,
         LCD_D       => LCD_D,
         LCD_RD_N     => LCD_RD_N,
         LCD_RESET_N => LCD_RESET_N,
         LCD_RS       => LCD_RS,
         LCD_WR_N     => LCD_WR_N
   );

    REG : Register16 port map(
      clock => CLK_SLOW,
      input => INPUT,
      load => LOAD,
      output => outReg);


    RAM: RAM16K  PORT MAP(
         clock		=> CLK_FAST,
         address  => ADDRESS(13 downto 0),
         data		  => INPUT(15 downto 0),
         wren     => wRAM,
         q		    => qRAM );



     wRAM <= (not ADDRESS(14)) and LOAD ;

     wLCD <= (LOAD and ADDRESS(14)) when ADDRESS <= "101001010111111" else
             '0'; 

     wReg <= LOAD when ADDRESS <= x"52C0" else
             '0'; 



     OUTPUT <= qRAM when (ADDRESS(14) = '0') else
               swout;
         

    LED <= outReg(9 downto 0);
    swout(9 downto 0) <= SW(9 downto 0);



END logic;
