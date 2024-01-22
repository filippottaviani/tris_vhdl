library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uart is
  Port(clk : in std_logic;
    reset: in std_logic;
    data_in : in std_logic_vector(0 to 23);
    data_out : out std_logic);
end uart;

architecture Behavioral of uart is

type state is (idle, write_start, write0, write1, write2, write3, write4, write5, write6, write7, write8, write9, write10, write11, write12, write13, write14, write15, write16, write17, write18, write19, write20, write21, write22, write23,first_byte_stop, second_byte_stop, second_byte_start, third_byte_start, write_finish); --definizione del tipo per la macchina a stati

signal next_state : state := idle;
signal curr_state : state := idle;

signal clk_baud : std_logic;
begin
    -- DIVISIONE DEL CLOCK
    process(clk)
        variable baud_count : integer range 0 to 10416 := 0;
    begin
        if rising_edge(clk) then 
            if baud_count = 10416 then -- per ottenere un baud rate pari a 9600
                clk_baud <= '1';
                baud_count := 0;
    
            elsif baud_count < 10416 then 
                clk_baud <= '0';
                baud_count := baud_count + 1;
    
            else end if;
        else end if;
    end process;

    -- TRIGGER DELLA MACCHINA A STATI
    process(clk_baud, reset)
    begin
        if (reset='1') then
                curr_state <= idle;
        elsif (rising_edge(clk_baud)) then
                curr_state <= next_state;
        else end if;
     end process;
     

    -- MACCHINA A STATI
    process(curr_state, data_in) 
        variable data_buffer : std_logic_vector(0 to 23) := "000000000000000000000000"; -- per confrontare l'ingresso e non stampare ciclicamente
    begin
     case curr_state is
        when idle =>
            data_out <= '1';
            
            if data_in /= data_buffer and data_in /= "UUUUUU" and data_in /= "000000000000000000000000" then
                next_state <= write_start;
            else 
                next_state <= idle;
            end if;
        when write_start => -- start bit
            data_out <= '0';
            next_state <= write0;
             
        when write0 =>
            data_out <= data_in(0);
            next_state <= write1;
         
        when write1 =>
            data_out <= data_in(1);
            next_state <= write2;
             
        when write2 =>
            data_out <= data_in(2);
            next_state <= write3;
             
        when write3 =>
            data_out <= data_in(3);
            next_state <= write4;
             
        when write4 =>
            data_out <= data_in(4);
            next_state <= write5;
            
        when write5 =>
            data_out <= data_in(5);
            next_state <= write6;
            
        when write6 =>
            data_out <= data_in(6);
            next_state <= write7;
            
        when write7 =>
            data_out <= data_in(7);
            next_state <= first_byte_stop;          
                       
        when first_byte_stop => -- fine primo byte
            data_out <= '1';
            next_state <= second_byte_start;
            
        when second_byte_start => -- inizio secondo byte
            data_out <= '0';
            next_state <= write8;
            
        when write8 =>
            data_out <= data_in(8);
            next_state <= write9;
         
        when write9 =>
            data_out <= data_in(9);
            next_state <= write10;
             
        when write10 =>
            data_out <= data_in(10);
            next_state <= write11;
             
        when write11 =>
            data_out <= data_in(11);
            next_state <= write12;
             
        when write12 =>
            data_out <= data_in(12);
            next_state <= write13;
            
        when write13 =>
            data_out <= data_in(13);
            next_state <= write14;
            
        when write14 =>
            data_out <= data_in(14);
            next_state <= write15;
            
        when write15 =>
            data_out <= data_in(15);
            next_state <= second_byte_stop;
                       
        when second_byte_stop => -- fine secondo byte
            data_out <= '1';
            next_state <= third_byte_start;
            
        when third_byte_start => -- inizio terzo byte
            data_out <= '0';
            next_state <= write16;    
            
        when write16 =>
            data_out <= data_in(16);
            next_state <= write17;
         
        when write17 =>
            data_out <= data_in(17);
            next_state <= write18;
             
        when write18 =>
            data_out <= data_in(18);
            next_state <= write19;
             
        when write19 =>
            data_out <= data_in(19);
            next_state <= write20;
             
        when write20 =>
            data_out <= data_in(20);
            next_state <= write21;
            
        when write21 =>
            data_out <= data_in(21);
            next_state <= write22;
            
        when write22 =>
            data_out <= data_in(22);
            next_state <= write23;
            
        when write23 =>
            data_out <= data_in(23);
            next_state <= write_finish;      
             
        when write_finish => -- stop bit
            data_out <= '1';
            next_state <= idle;
            data_buffer := data_in;
                      
        end case;
    end process;
end Behavioral;