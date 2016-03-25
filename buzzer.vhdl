--------------------------------------------------------------------------------
--
--      BAYETA REYNALDO III L.                  
--      DE VERA ADRIAN A
--
--      CMSC 132 T-5L
--      Lecture Programming Assignment
--
--      Filename: buzzer.vhdl
--      Description: behavioral approach for alarm problem
--                      stated in lecture assignment
--
--------------------------------------------------------------------------------

library IEEE;
    use IEEE.std_logic_1164.all;                    -- Library Statements

entity buzzer is
    port (
        alarm: out std_logic;                       -- Entity Definition
        in_gates: in std_logic_vector(2 downto 0);
        out_gates: in std_logic_vector(2 downto 0)
    );
end entity buzzer;

architecture buzz of buzzer is                      -- Architecture Definition
begin
    process (
        in_gates(2), in_gates(1), in_gates(0),
        out_gates(2),out_gates(1), out_gates(0)) is -- activate when any input changes
    begin
        
        alarm <= (in_gates(2) or in_gates(1) or in_gates(0)) and
                    (out_gates(2) or out_gates(1) or out_gates(0));

    end process;
end architecture buzz;                              -- end of architecture