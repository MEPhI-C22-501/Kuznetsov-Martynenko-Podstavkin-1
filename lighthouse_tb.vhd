library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lighthouse_tb is
end entity;

architecture lightHouse_tb_arch of lighthouse_tb is

    signal timeToLight : unsigned(3 downto 0);
    signal timeToFadeOut : unsigned(3 downto 0);
    signal clk : std_logic;
    signal rst : std_logic;
    signal clr : std_logic;

    begin
    lighthouse_tester : entity work.lighthouse_tester(lighthouse_tester_arch) port map(
        o_clk => clk,
        o_rst => rst,
        o_clr => clr,
        o_timeToLight => timeToLight,
        o_timeToFadeOut => timeToFadeOut
    );

    lighthouse : entity work.lighthouse(lighthouse_arch) port map(
        i_clk => clk,
        i_rst => rst,
        i_clr => clr,
        i_timeToLight => timeToLight,
        i_timeToFadeOut => timeToFadeOut 
    );

end architecture;