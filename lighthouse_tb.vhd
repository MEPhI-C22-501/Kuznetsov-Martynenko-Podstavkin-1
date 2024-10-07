library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lighthouse_tb is
end entity;

architecture lightHouse_tb_arch of lighthouse_tb is

    signal timeToLight : unsigned(3 downto 0);
    signal timeToFadeOut : unsigned(3 downto 0);
    signal clk : std_logic;
    signal load : std_logic;
    signal rst : std_logic;
    signal output : std_logic;
    signal counter : unsigned(3 downto 0);

    begin
    lighthouse_tester : entity work.lighthouse_tester(lighthouse_tester_arch) port map(
        o_clk => clk,
        o_load => load,
        o_rst => rst,
        o_timeToLight => timeToLight,
        o_timeToFadeOut => timeToFadeOut
    );

    lighthouse : entity work.lighthouse(lighthouse_arch) port map(
        i_clk => clk,
        i_load => load,
        i_rst => rst,
        i_timeToLight => timeToLight,
        i_timeToFadeOut => timeToFadeOut, 
        o_power => output,
        o_counter => counter
    );

end architecture;