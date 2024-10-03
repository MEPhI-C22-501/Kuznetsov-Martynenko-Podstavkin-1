library ieee;
use  ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lighthouse is
  port(i_timeToLight, i_timeToFadeOut : in unsigned(3 downto 0);
       i_clk, i_rst, i_clr : in std_logic;
       o_power : out std_logic);
end entity;

architecture lighthouse_arch of lighthouse is
  constant refTimeToLight : unsigned(3 downto 0) := x"A";
  constant refTimeToFadeOut : unsigned(3 downto 0) := x"5";
  signal timeToLight : unsigned(3 downto 0) := refTimeToLight;
  signal timeToFadeOut : unsigned(3 downto 0) := refTimeToFadeOut;
  signal counter : unsigned(3 downto 0);
  signal power_copy : std_logic := '0';
  begin
  o_power <= power_copy; 
  process(i_clk) is
    begin
      if(i_rst = '1') then
        timeToLight <= i_timeToLight;
        timeToFadeOut <= i_timeToFadeOut;
      elsif(i_clr = '1') then 
        timeToLight <= refTimeToLight;
        timeToFadeOut <= refTimeToFadeOut;
      end if;
      if(power_copy'event and power_copy = '0') then 
        counter <= timeToFadeOut;
      elsif(power_copy'event and power_copy = '1') then 
        counter <= timeToLight;
      end if;
      if(i_clk'event and i_clk = '1') then
        counter <= counter - 1;
        if(counter = x"0") then
          o_power <= not power_copy;
          power_copy <=  not power_copy;
        end if; 
      end if;
    end process;

end architecture;