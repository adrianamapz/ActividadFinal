
Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;
Use IEEE.STD_LOGIC_ARITH.ALL;
Use IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity vga is
    Port (
        Clk : in STD_LOGIC;
        Rst : in STD_LOGIC;
        Vga_hsync : out STD_LOGIC;
        Vga_vsync : out STD_LOGIC;
        Vga_red, vga_green, vga_blue : out STD_LOGIC_VECTOR(3 downto 0);
        Vga_blank : out STD_LOGIC
    );
End vga;

Architecture Behavioral of vga is
    Constant H_SYNC_TIME : natural := 96;  -- # ciclos de reloj para sincronizacion horizontal
    Constant H_BACK_PORCH : natural := 48; -- # de ciclos de reloj para el porche posterior horizontal
    Constant H_FRONT_PORCH : natural := 16;-- # de ciclos de reloj para el porche frontal horizontal
    Constant V_SYNC_TIME : natural := 2;   -- # de lineas de sincronizacion vertical
    Constant V_BACK_PORCH : natural := 33; -- # de lineas para el porche posterior vertical
    Constant V_FRONT_PORCH : natural := 10;-- # de lineas para el porche frontal vertical
    Constant SCREEN_WIDTH : natural := 640; -- resolucion horizontal
    Constant SCREEN_HEIGHT : natural := 480;-- resolucion vertical


End Behavioral; 
