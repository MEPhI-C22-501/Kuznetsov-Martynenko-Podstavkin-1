library ieee;
use ieee.std_logic_1164.all;

entity test is
end entity;

architecture testst of test is
    constant fr : integer := 100e6;
    constant per  : time := 1000 ms / fr;
    signal clock : std_logic := '1';
    begin
        process is
        begin
            wait for per/2;
            clock <= not clock;
		if(clock'event or clock = '1') then
                    report "I hate VHDL";
		end if; 
        end process;
end architecture;