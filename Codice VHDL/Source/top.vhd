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
    
    component debounce
	   port(
	    reset : in STD_LOGIC;
        clk : in STD_LOGIC;
        btn : in STD_LOGIC;
        btn_debounced : out std_logic);
    end component;
    
    signal outComm : std_logic_vector(0 to 23);
    signal btn0,btn1,btn2,btn3,btn4,btn5,btn6,btn7,btn8 : std_logic := '0';
begin

    ua : uart PORT MAP(
		clk => clk,
		reset => reset,
        data_out => data_out,
        data_in => outComm);
    
    db0 : debounce PORT MAP(
		clk => clk,
        reset => reset,
        btn => b0, 
        btn_debounced => btn0);
        
    db1 : debounce PORT MAP(
		clk => clk,
        reset => reset,
        btn => b1, 
        btn_debounced => btn1);  
        
    db2 : debounce PORT MAP(
		clk => clk,
        reset => reset,
        btn => b2, 
        btn_debounced => btn2);
            
    db3 : debounce PORT MAP(
		clk => clk,
        reset => reset,
        btn => b3, 
        btn_debounced => btn3);
        
    db4 : debounce PORT MAP(
		clk => clk,
        reset => reset,
        btn => b4, 
        btn_debounced => btn4);
        
    db5 : debounce PORT MAP(
		clk => clk,
        reset => reset,
        btn => b5, 
        btn_debounced => btn5);
        
    db6 : debounce PORT MAP(
		clk => clk,
        reset => reset,
        btn => b6, 
        btn_debounced => btn6);
        
    db7 : debounce PORT MAP(
		clk => clk,
        reset => reset,
        btn => b7, 
        btn_debounced => btn7);
        
    db8 : debounce PORT MAP(
		clk => clk,
        reset => reset,
        btn => b8, 
        btn_debounced => btn8);                          
    
    tr : tris port map(
        clk => clk,
        reset => reset,
        b0 => btn0,
        b1 => btn1,
        b2 => btn2,
        b3 => btn3,
        b4 => btn4,
        b5 => btn5,
        b6 => btn6,
        b7 => btn7,
        b8 => btn8,
       outC => outComm);

end Structural;