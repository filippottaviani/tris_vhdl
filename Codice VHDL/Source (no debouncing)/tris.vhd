library ieee;
use ieee.std_logic_1164.all;
 
entity tris is
    port(reset : in STD_LOGIC;
        clk : in STD_LOGIC;
        b0,b1,b2,b3,b4,b5,b6,b7,b8 : in STD_LOGIC;
        outC : out std_logic_vector(0 to 23));
end tris;
 
architecture behavioral of tris is
    
    type state is (reset_state, turnX, turnO, idle);
    
    signal next_state : state := reset_state;
    signal curr_state : state := reset_state;
    signal command : integer range 0 to 10 := 9;
    
begin
    -- LETTURA INPUT
    process(clk, reset)
    begin
        if reset = '1' then
            command <= 9; -- reset
        elsif rising_edge(clk) then
            if b0  = '1' then command <= 0; -- casella 0    
            elsif b1 = '1' then command <= 1; -- casella 1
            elsif b2 = '1' then command <= 2; -- casella 2
            elsif b3 = '1' then command <= 3; -- casella 3
            elsif b4 = '1' then command <= 4; -- casella 4
            elsif b5 = '1' then command <= 5; -- casella 5
            elsif b6 = '1' then command <= 6; -- casella 6
            elsif b7 = '1' then command <= 7; -- casella 7
            elsif b8 = '1' then command <= 8; -- casella 8
            else command <= 10; -- bottone 1 -> 0
            end if;
        end if;
    end process;
    
    -- TRIGGER DELLA MACCHINA A STATI
    process(clk)
    begin
         if rising_edge(clk) then
            case command is
                when 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 =>  curr_state <= next_state;
                when 9 => curr_state <= reset_state;
                when 10 => curr_state <= idle;
                end case;
         end if;
    end process; 
    
    -- MACCHINA A STATI
    process(command)
        variable x_wins : boolean := False;
        variable o_wins : boolean := False;
        variable tie : boolean := True;
        variable grid : std_logic_vector(0 to 17) := "000000000000000000";
        variable outComm : std_logic_vector(0 to 23) := "000000000000000000000000";
        variable result : std_logic_vector(1 downto 0) := "00";
    begin
    if rising_edge(clk) then
        case curr_state is 
            when turnO => 
                 if command /= 9 and command /= 10 then
                     if grid(command) = '0' and grid(command + 9) = '0' then
                        grid(command + 9) := '1'; -- posiziono i segno O
                        
                        o_wins := False;
                        x_wins := False;
                        tie := True;
                        
                        -- controllo vittoria verticale e orizzontale O
                        for i in 0 to 2 loop
                            if grid(i+9) = '1' and grid(i+3+9) = '1' and grid(i+6+9) = '1' then o_wins := True; -- controllo colonne
                            elsif grid((3*i)+9) = '1' and grid((3*i)+10) = '1' and grid((3*i)+11) = '1' then o_wins := True; -- controllo righe
                            end if;
                        end loop;
                        
                        -- controllo vittoria verticale e orizzontale X
                        for i in 0 to 2 loop
                            if grid(i) = '1' and grid(i+3) = '1' and grid(i+6) = '1' then x_wins := True; -- controllo colonne
                            elsif grid(3*i) = '1' and grid((3*i)+1) = '1' and grid((3*i)+2) = '1' then x_wins := True; -- controllo righe
                            end if;
                        end loop;
                        
                        -- controllo vittoria diagonale X
                        if grid(0) = '1' and grid(4) = '1' and grid(8) = '1' then x_wins := True;  -- controllo diagonale \
                        elsif grid(2) = '1' and grid(4) = '1' and grid(6) = '1' then x_wins := True; -- controllo diagonale /
                        end if;
                        
                        -- controllo vittoria diagonale O
                        if grid(9) = '1' and grid(13) = '1' and grid(17) = '1' then o_wins := True; -- controllo diagonale \
                        elsif grid(11) = '1' and grid(13) = '1' and grid(15) = '1' then o_wins := True;  -- controllo diagonale /
                        end if;
                        
                        -- controllo pareggio
                        for i in 0 to 8 loop
                            if grid(i) = '0' and grid(i+9)  = '0' then tie := False;
                            end if;
                         end loop;
                        
                        -- codifica del risultato
                        if o_wins then result := "01";  -- O ha vinto             
                        elsif x_wins then result := "01"; -- X ha vinto  
                        elsif tie then result := "11"; -- Pareggio
                        else result := "00";-- Nessun vincitore
                        end if;
                        
                        -- codifica output e segnali d'uscita
                        outComm := '0' & grid & '0' & result & "00";
                        outC <= outComm;
                        
                        next_state <= turnX;
                    end if;
                end if;
            
            when turnX => 
                 if command /= 9 and command /= 10 then
                     if grid(command) = '0' and grid(command + 9) = '0' then
                        grid(command) := '1'; -- posiziono i segno X
                        
                        o_wins := False;
                        x_wins := False;
                        tie := True;
                        
                        -- controllo vittoria verticale e orizzontale O
                        for i in 0 to 2 loop
                            if grid(i+9) = '1' and grid(i+3+9) = '1' and grid(i+6+9) = '1' then o_wins := True; -- controllo colonne
                            elsif grid((3*i)+9) = '1' and grid((3*i)+10) = '1' and grid((3*i)+11) = '1' then o_wins := True; -- controllo righe
                            end if;
                        end loop;
                        
                        -- controllo vittoria verticale e orizzontale X
                        for i in 0 to 2 loop
                            if grid(i) = '1' and grid(i+3) = '1' and grid(i+6) = '1' then x_wins := True; -- controllo colonne
                            elsif grid(3*i) = '1' and grid((3*i)+1) = '1' and grid((3*i)+2) = '1' then x_wins := True; -- controllo righe
                            end if;
                        end loop;
                        
                        -- controllo vittoria diagonale X
                        if grid(0) = '1' and grid(4) = '1' and grid(8) = '1' then x_wins := True;  -- controllo diagonale \
                        elsif grid(2) = '1' and grid(4) = '1' and grid(6) = '1' then x_wins := True; -- controllo diagonale /
                        end if;
                        
                        -- controllo vittoria diagonale O
                        if grid(9) = '1' and grid(13) = '1' and grid(17) = '1' then o_wins := True; -- controllo diagonale \
                        elsif grid(11) = '1' and grid(13) = '1' and grid(15) = '1' then o_wins := True;  -- controllo diagonale /
                        end if;
                        
                        -- controllo pareggio
                        for i in 0 to 8 loop
                            if grid(i) = '0' and grid(i+9)  = '0' then tie := False;
                            end if;
                         end loop;
                        
                        -- codifica del risultato
                        if o_wins then result := "01";  -- O ha vinto             
                        elsif x_wins then result := "01"; -- X ha vinto  
                        elsif tie then result := "11"; -- Pareggio
                        else result := "00";-- Nessun vincitore
                        end if;
                        
                        -- codifica output e segnali d'uscita
                        outComm := '0' & grid & '0' & result & "00";
                        outC <= outComm;
                        
                        next_state <= turnO;
                    end if;
                end if;
                
            when reset_state =>                    
                grid := "000000000000000000";
                result := "00";
                outC <= "100000000000000000000000";
                next_state <= turnO;
                
            when idle =>
                outC <= "000000000000000000000000";
        end case;   
        
        end if;   
    end process;
end behavioral;

                        
