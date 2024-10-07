library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lighthouse_tester is
    port(o_clk, o_rst, o_load : out std_logic;
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
        o_load <= '0';
        wait for clockPeriod * 8;
        o_timeToLight <= x"7";
        o_timeToFadeOut <= x"3";
        o_load <= '1';
        wait for clockPeriod;
        o_load <= '0';
        wait for 10 * clockPeriod;
        o_rst <= '1';
        wait for clockPeriod;
        o_rst <= '0';
        wait for 15 * clockPeriod;
        o_timeToLight <= x"7";
        o_timeToFadeOut <= x"3";
        o_load <= '1';
        wait for clockPeriod;
        o_load <= '0';
        wait;

    end process;
end architecture;