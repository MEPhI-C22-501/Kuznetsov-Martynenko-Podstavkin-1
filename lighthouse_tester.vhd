library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lighthouse_tester is
    port(o_clk, o_rst, o_clr : out std_logic;
         o_timeToLight, o_timeToFadeOut : out unsigned(3 downto 0);
         o_clockPeriod : out integer);
end entity;

architecture lighthouse_tester_arch of lighthouse_tester is
    constant clockPeriod : time := 1 sec;
    signal clk : std_logic := '1';

    begin

    clk <= not clk after clockPeriod / 2;
    o_clk <= clk;
    
    process
    begin
        o_rst <= '0';
        o_clr <= '0';
        wait for clockPeriod * 15;
        o_timeToLight <= x"F";
        o_timeToFadeOut <= x"2";
        o_rst <= '1';
        wait for 16 * clockPeriod;
        o_rst <= '0';
        o_clr <= '1';
        wait for 20 * clockPeriod;
        o_timeToLight <= x"F";
        o_timeToFadeOut <= x"2";
        o_rst <= '1';
        wait;

    end process;
end architecture;