Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bounce is
    Port (
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        led : out STD_LOGIC_VECTOR(7 downto 0)
    );
end bounce;

architecture Behavioral of bounce is
    constant MAX_COUNT : natural := 50000000;  --ajusta la f del reloj clk
    signal count : natural range 0 to MAX_COUNT := 0;
    signal direction : STD_LOGIC := '0';
    signal position : natural range 0 to 7 := 0;
begin
    process(clk, rst)
    begin
        if rst = '1' then
            count <= 0;
            direction <= '0';
            position <= 0;
            led <= (others => '0');
        elsif rising_edge(clk) then
            if count = MAX_COUNT - 1 then
                count <= 0;

                if direction = '0' then
                    if position = 7 then
                        direction <= '1';
                    else
                        position <= position + 1;
                    end if;
                else
                    if position = 0 then
                        direction <= '0';
                    else
                        position <= position - 1;
                    end if;
                end if;

                -- Generar la salida hacia el LED
                led <= (others => '0');
                led(position) <= '1';
            else
                count <= count + 1;
            end if;
        end if;
    end process;
end Behavioral;

