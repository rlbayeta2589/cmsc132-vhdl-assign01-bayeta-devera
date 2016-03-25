library IEEE ;
    use IEEE.std_logic_1164.all ;                   
    use IEEE.numeric_std.all ;

entity tb_buzzer is
  constant MAX_COMB: integer := 64;                 
  constant DELAY: time := 10 ns;
end entity ; 

architecture tb of tb_buzzer is                     
    signal alarm: std_logic;
    signal in_gates: std_logic_vector(2 downto 0);
    signal out_gates: std_logic_vector(2 downto 0);
    
    component buzzer is                             
        port (
            alarm: out std_logic;
            in_gates: in std_logic_vector(2 downto 0);
            out_gates: in std_logic_vector(2 downto 0)
        );
    end component;

begin
    UUT: component buzzer port map(alarm, in_gates, out_gates);

    main: process is
        variable temp: unsigned(5 downto 0);        
        variable expected_alarm: std_logic;
        variable error_count: integer := 0;

    begin
        report "Start simulation.";

        for count in 0 to MAX_COMB-1 loop           
            temp := TO_UNSIGNED(count, 6);          
            in_gates(2)  <= std_logic(temp(5));
            in_gates(1)  <= std_logic(temp(4));
            in_gates(0)  <= std_logic(temp(3));
            out_gates(2) <= std_logic(temp(2));
            out_gates(1) <= std_logic(temp(1));
            out_gates(0) <= std_logic(temp(0));

            if( (temp(5)='1' or temp(4)='1' or temp(3)='1') and
                    (temp(2)='1' or temp(1)='1' or temp(0)='1'))
                then expected_alarm := '1';
            else expected_alarm := '0';             
            end if;

            wait for DELAY;

            assert (expected_alarm = alarm)         
                report "ERROR: Expected alarm " & 
                    std_logic'image(expected_alarm) &
                    " at time " & time'image(now);

            if (expected_alarm /= alarm)            
                then error_count := error_count + 1;        
            end if;
        end loop;

        wait for DELAY;

        assert (error_count=0)                      
            report "ERROR: There were " & integer'image(error_count) & " errors!";

        if (error_count=0) then                     
            report "Simulation completed with NO errors.";
        end if;

        wait;
    end process;
end architecture ;                                  