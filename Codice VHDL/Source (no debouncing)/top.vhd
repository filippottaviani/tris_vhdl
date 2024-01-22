library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    Port (clk : in std_logic;
        reset: in std_logic;
        b0,b1,b2,b3,b4,b5,b6,b7,b8 : in STD_LOGIC;
        data_out : out std_logic);
end top;

architecture Structural of top is

    component uart
        Port(clk : in std_logic;
            reset : in STD_LOGIC;
            data_in : in std_logic_vector(0 to 23);
            data_out : out std_logic);
	end Component;
	
	component tris
	   port(reset : in STD_LOGIC;
        clk : in STD_LOGIC;
        b0,b1,b2,b3,b4,b5,b6,b7,b8 : in STD_LOGIC;
        outC : out std_logic_vector(0 to 23));
    end component;
    
    signal outComm : std_logic_vector(0 to 23);
begin

    ua : uart PORT MAP(
		clk => clk,
		reset => reset,
        data_out => data_out,
        data_in => outComm);                        
    
    tr : tris port map(
        clk => clk,
        reset => reset,
        b0 => b0,
        b1 => b1,
        b2 => b2,
        b3 => b3,
        b4 => b4,
        b5 => b5,
        b6 => b6,
        b7 => b7,
        b8 => b8,
       outC => outComm);

end Structural;