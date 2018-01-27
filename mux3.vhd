library ieee;
use ieee.std_logic_1164.all;

entity hex_mux is 
port (
	
		input_1, input_2              : in std_logic_vector(7 downto 0);
		mux_select            : in std_logic;
		output_mux             :out std_logic_vector(7 downto 0)
		
);

end entity hex_mux

architecture mux_logic of hex_mux is 

begin 

with mux_select(0) select

hex_out <= input_1 