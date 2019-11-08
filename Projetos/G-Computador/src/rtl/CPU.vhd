-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: CPU.vhd
-- date: 4/4/2017

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CPU is
  port(
    clock:       in  STD_LOGIC;                        -- sinal de clock para CPU
    reset:       in  STD_LOGIC;                        -- reinicia toda a CPU (inclusive o Program Counter)
    inM:         in  STD_LOGIC_VECTOR(15 downto 0);    -- dados lidos da memória RAM
    instruction: in  STD_LOGIC_VECTOR(17 downto 0);    -- instrução (dados) vindos da memória ROM
    outM:        out STD_LOGIC_VECTOR(15 downto 0);    -- dados para gravar na memória RAM
    writeM:      out STD_LOGIC;                        -- faz a memória RAM gravar dados da entrada
    addressM:    out STD_LOGIC_VECTOR(14 downto 0);    -- envia endereço para a memória RAM
    pcout:       out STD_LOGIC_VECTOR(14 downto 0)     -- endereço para ser enviado a memória ROM
    );
end entity;

architecture arch of CPU is

 component Mux16 is
    port (
      a:   in  STD_LOGIC_VECTOR(15 downto 0);
      b:   in  STD_LOGIC_VECTOR(15 downto 0);
      sel: in  STD_LOGIC;
      q:   out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;

  component ALU is
    port (
      x,y:   in STD_LOGIC_VECTOR(15 downto 0);
      zx:    in STD_LOGIC;
      nx:    in STD_LOGIC;
      zy:    in STD_LOGIC;
      ny:    in STD_LOGIC;
      f:     in STD_LOGIC;
      no:    in STD_LOGIC;
      zr:    out STD_LOGIC;
      ng:    out STD_LOGIC;
      saida: out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;

  component Register16 is
    port(
      clock:   in std_logic;
      input:   in STD_LOGIC_VECTOR(15 downto 0);
      load:    in std_logic;
      output: out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;

  component pc is
    port(
      clock     : in  STD_LOGIC;
      increment : in  STD_LOGIC;
      load      : in  STD_LOGIC;
      reset     : in  STD_LOGIC;
      input     : in  STD_LOGIC_VECTOR(15 downto 0);
      output    : out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;

  component ControlUnit is
    port(
      instruction                 : in STD_LOGIC_VECTOR(17 downto 0);
      zr,ng                       : in STD_LOGIC;
      muxALUI_A                   : out STD_LOGIC;
      muxAM                       : out STD_LOGIC;
      muxAMD_ALU                  : out STD_LOGIC;
      muxSD_ALU                   : out STD_LOGIC;                     -- mux que seleciona entre reg. S
      zx, nx, zy, ny, f, no       : out STD_LOGIC;
      loadA, loadD, loadS, loadM, loadPC : out STD_LOGIC
      );
  end component;

  signal c_muxALUI_A: STD_LOGIC;
  signal c_muxAM: STD_LOGIC;
  signal c_muxAMD_ALU: STD_LOGIC;
  signal c_muxSD_ALU: STD_LOGIC;
  signal c_zx: STD_LOGIC;
  signal c_nx: STD_LOGIC;
  signal c_zy: STD_LOGIC;
  signal c_ny: STD_LOGIC;
  signal c_f: STD_LOGIC;
  signal c_no: STD_LOGIC;
  signal c_loadA: STD_LOGIC;
  signal c_loadD: STD_LOGIC;
  signal c_loadS: STD_LOGIC;
  signal c_loadPC: STD_LOGIC;
  signal c_zr: std_logic := '0';
  signal c_ng: std_logic := '0';

  signal s_muxALUI_Aout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_muxAM_out: STD_LOGIC_VECTOR(15 downto 0);
  signal s_muxAMD_ALUout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_muxSDout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_regAout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_regDout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_regSout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_ALUout: STD_LOGIC_VECTOR(15 downto 0);

  signal s_pcout: STD_LOGIC_VECTOR(15 downto 0);

  
begin

ULA: ALU port map(s_muxSDout,s_muxAMD_ALUout, c_zx, c_nx, c_zy, c_ny, c_f, c_no, c_zr, c_ng, s_ALUout);

muxSD : Mux16 port map(s_regSout,s_regDout, c_muxSD_ALU, s_muxSDout);

muxAMD : Mux16 port map(s_regDout, s_muxAM_out, c_muxAMD_ALU, s_muxAMD_ALUout);

muxAM : Mux16 port map(s_regAout, inM, c_muxAM, s_muxAM_out);

muxALU : Mux16 port map(s_ALUout, instruction(15 downto 0), c_muxALUI_A, s_muxALUI_Aout);

regS : Register16 port map(clock, s_ALUout, c_loadS, s_regSout);

regD : Register16 port map(clock, s_ALUout, c_loadD, s_regDout);

regA : Register16 port map(clock, s_muxALUI_Aout, c_loadA, s_regAout);

PCn : PC port map(clock, '1', c_loadPC, reset, s_regAout, s_pcout);

c_unit : ControlUnit port map(instruction, c_zr, c_ng, c_muxALUI_A, c_muxAM, c_muxAMD_ALU, 
  c_muxSD_ALU, c_zx, c_nx, c_zy, c_ny, c_f, c_no, c_loadA, c_loadD, c_loadS, writeM ,c_loadPC);


addressM <= s_regAout(14 downto 0);
outM <= s_ALUout;
pcout <= s_pcout(14 downto 0);

end architecture;
