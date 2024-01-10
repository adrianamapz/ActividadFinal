library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Sprite is
    Port (
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        display_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Sprite;

architecture Behavioral of Sprite is
    type Sprite_Array is array (0 to 2, 0 to 2) of STD_LOGIC_VECTOR(7 downto 0);
    signal sprite1 : Sprite_Array := (
        (others => "00000000"),
        (others => "00000000"),
        (others => "00000000")
    );
    signal sprite2 : Sprite_Array := (
        (others => "11111111"),
        (others => "11111111"),
        (others => "11111111")
    );
    
    signal sprite_position_x1, sprite_position_y1, sprite_position_x2, sprite_position_y2 : STD_LOGIC_VECTOR(2 downto 0) := "000";
begin
    process(clk, rst)
    begin
        if rst = '1' then
            sprite_position_x1 <= "000";
            sprite_position_y1 <= "000";
            sprite_position_x2 <= "100"; -- Cambia las posiciones iniciales según tus necesidades
            sprite_position_y2 <= "100";
        elsif rising_edge(clk) then
            sprite_position_x1 <= "000";
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            display_out <= sprite1(to_integer(unsigned(sprite_position_x1)))(to_integer(unsigned(sprite_position_y1))) and
                           sprite2(to_integer(unsigned(sprite_position_x2)))(to_integer(unsigned(sprite_position_y2)));
        end if;
    end process;
end Behavioral;
