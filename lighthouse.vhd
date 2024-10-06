library ieee;
use  ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lighthouse is
  port(i_timeToLight, i_timeToFadeOut : in unsigned(3 downto 0);
       i_clk, i_rst, i_clr : in std_logic;
       o_power : out std_logic;
       o_counter : out unsigned(3 downto 0));
end entity;

architecture lighthouse_arch of lighthouse is
  constant refTimeToLight : unsigned(3 downto 0) := x"A";
  constant refTimeToFadeOut : unsigned(3 downto 0) := x"5";
  signal timeToLight : unsigned(3 downto 0) := refTimeToLight;
  signal timeToFadeOut : unsigned(3 downto 0) := refTimeToFadeOut;
  signal counter : unsigned(3 downto 0) := timeToLight;
  signal power_copy : std_logic := '1';
  begin
  process(i_clk) is
    begin
      if(rising_edge(i_rst)) then
        timeToLight <= i_timeToLight;
        timeToFadeOut <= i_timeToFadeOut;
      elsif(rising_edge(i_clr)) then 
        timeToLight <= refTimeToLight;
        timeToFadeOut <= refTimeToFadeOut;
      end if;

      if(rising_edge(i_clk)) then
        counter <= counter - 1;
        if(counter = x"1") then
          if(power_copy = '1') then 
            counter <= timeToFadeOut;
          else 
            counter <= timeToLight;
          end if;
          power_copy <=  not power_copy;
        end if; 
      end if;

    end process;
    process(counter, power_copy)
    begin
    o_counter <= counter;
    o_power <= power_copy;
    end process;

end architecture;