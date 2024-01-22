library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity trisTestbench Is
end trisTestbench;

Architecture behavior of trisTestbench Is
	Component top
	 port(reset : in STD_LOGIC;
        clk : in std_logic;
        b0,b1,b2,b3,b4,b5,b6,b7,b8 : in STD_LOGIC;
        data_out : out std_logic);
	End Component;
	
	-- INPUT
	signal reset : STD_LOGIC := '0';
	signal b0,b1,b2,b3,b4,b5,b6,b7,b8 : STD_LOGIC := '0';
	signal clk : STD_LOGIC := '0';
	
	-- OUTPUT
	signal data_out : std_logic;
	
begin
	t : top PORT MAP(
		b0 => b0,
		b1 => b1,
		b2 => b2,
		b3 => b3,
		b4 => b4,
		b5 => b5,
		b6 => b6,
		b7 => b7,
		b8 => b8,
		clk => clk,
		data_out => data_out,
        reset => reset);
		 
	process
	begin
		-- GAME SIMULATION
		
		-- reset 
		wait for 15 ms; 
		reset <= '1';
		wait for 15 ms; 
		reset <= '0';
		
		-- mossa O in 0
		wait for 15 ms; 
		b0 <= '1';
		wait for 15 ms; 
		b0 <= '0';	
		
		-- mossa X in 1
		wait for 15 ms; 
		b1 <= '1';
		wait for 15 ms; 
		b1 <= '0';
		
		-- mossa O in 3
		wait for 15 ms; 
		b3 <= '1';
		wait for 15 ms; 
		b3 <= '0';
		
		-- mossa X in 1
		wait for 15 ms; 
		b4 <= '1';
		wait for 15 ms; 
		b4 <= '0';
		
		-- mossa O in 1
		wait for 15 ms; 
		b6 <= '1';
		wait for 15 ms; 
		b6 <= '0';
		
		-- mossa X in 7
		wait for 15 ms; 
		b7 <= '1';
		wait for 15 ms; 
		b7 <= '0';
		
		-- mossa O in 8
		wait for 15 ms; 
		b8 <= '1';
		wait for 15 ms; 
		b8 <= '0';
		
		-- reset 
		wait for 15 ms; 
		reset <= '1';
		wait for 15 ms; 
		reset <= '0';
		
		-- mossa O in 7
		wait for 15 ms; 
		b7 <= '1';
		wait for 15 ms; 
		b7 <= '0';
		
		wait;
		
	end process;
end behavior;