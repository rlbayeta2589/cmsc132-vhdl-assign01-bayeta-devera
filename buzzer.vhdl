library IEEE;
    use IEEE.std_logic_1164.all;                    

entity buzzer is
    port (
        alarm: out std_logic;                       
        in_gates: in std_logic_vector(2 downto 0);
        out_gates: in std_logic_vector(2 downto 0)
    );
end entity buzzer;

architecture buzz of buzzer is                      
begin
    process

    --
    --      put the process and code for getting the value
    --  of alarm here :D
    --

    end process;
end architecture buzz;                              