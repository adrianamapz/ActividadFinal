library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Clock_Divider is
    Port (
        clk_in : in STD_LOGIC;
        rst    : in STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end Clock_Divider;

architecture Behavioral of Clock_Divider is
    constant DIVIDER_FACTOR : natural := 2; -- Puedes ajustar el factor de división según tus necesidades
    signal count : natural range 0 to DIVIDER_FACTOR - 1 := 0;
begin
    process(clk_in, rst)
    begin
        if rst = '1' then
            count <= 0;
            clk_out <= '0';
        elsif rising_edge(clk_in) then
            if count = DIVIDER_FACTOR - 1 then
                count <= 0;
                clk_out <= not clk_out;
            else
                count <= count + 1;
            end if;
        end if;
    end process;
end Behavioral;
