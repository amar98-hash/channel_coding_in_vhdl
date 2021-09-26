
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity conv_sim_tb is
--  Port ( );
end conv_sim_tb;

architecture Behavioral of conv_sim_tb is
 --component  declaration for Unit Under Test(UUT)
 
 COMPONENT conv_enc is
 PORT(
    din : IN std_logic;
    z: OUT std_logic_vector(1 downto 0);
    clk : IN std_logic;
 
    --i_rstb                                  : in  std_logic;
    reset                            : in  std_logic;
    valid_in                           : in  std_logic;
     valid_out                           : out  std_logic
 );
end COMPONENT;

signal reset, valid_in, clk, din, valid_out : std_logic;
signal z : std_logic_vector(1 downto 0);

BEGIN

uut : conv_enc port map(
reset=>reset,
valid_in=>valid_in,
valid_out=>valid_out,
 clk=>clk,
 din=>din,
z=>z
);

reset <= '1', '0' after 80 ns;
valid_in<= '0', '1' after 120 ns;

proc1: process
begin 
din<='0';
wait for 100 ns;
din<='1';
wait for 100 ns;

end process;

proc2: process
begin 
clk<='0';
wait for 40 ns;
clk<='1';
wait for 40 ns;

end process;



END;