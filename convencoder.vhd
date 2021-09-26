library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity conv_enc is
Port ( din : in std_logic; ---Input
clk : in std_logic; ---Clock
reset : in std_logic; ---Reset
valid_in : in std_logic; ---Valid Input
z : out std_logic_vector(1 downto 0); -- Ouput data
valid_out : out std_logic -- Output valid signal
);

end conv_enc;

architecture Behavioral of conv_enc is

signal a : std_logic;
signal b : std_logic;

begin

process( clk, reset)
begin
if reset = '1' then
a <= '0';
b <= '0';

z <= "00";
valid_out <= '0';
elsif (clk = '1' and clk'event )then
valid_out <= valid_in;
if valid_in = '1' then
a <= din;
b <= a;
end if;
z(1) <= din xor a xor b;
z(0) <= din xor b;
end if;
end process;

end Behavioral;