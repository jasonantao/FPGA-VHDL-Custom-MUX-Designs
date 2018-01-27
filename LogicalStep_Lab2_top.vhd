library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity LogicalStep_Lab2_top is port (
   clkin_50			: in	std_logic;
	pb					: in	std_logic_vector(3 downto 0);
 	sw   				: in  std_logic_vector(7 downto 0); -- The switch inputs
   leds				: out std_logic_vector(7 downto 0); -- for displaying the switch content
   seg7_data 		: out std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
	seg7_char1  	: out	std_logic;				    		-- seg7 digit1 selector
	seg7_char2  	: out	std_logic				    		-- seg7 digit2 selector
	
); 
end LogicalStep_Lab2_top;

architecture SimpleCircuit of LogicalStep_Lab2_top is
--
-- Components Used ---
------------------------------------------------------------------- 





  component SevenSegment port (
   hex   		:  in  std_logic_vector(3 downto 0);   -- The 4 bit data to be displayed
   sevenseg 	:  out std_logic_vector(6 downto 0)    -- 7-bit outputs to a 7-segment
   ); 
   end component;
	
	
	
	
	
	  component segment7_mux port (
	  
	clk : in std_logic := '0';
	DIN2 : in std_logic_vector(6 downto 0);
	DIN1 : in std_logic_vector(6 downto 0);
	DOUT : out std_logic_vector(6 downto 0);
	DIG2 : out std_logic;
	DIG1 : out std_logic



	
   ); 
   end component;
	
	
	
	
	
	
-- Create any signals, or temporary variables to be used
--
--  std_logic_vector is a signal which can be used for logic operations such as OR, AND, NOT, XOR
--
	signal pb3select  : std_logic;
	
	signal seg7_A		: std_logic_vector(6 downto 0);
	signal hex_A		: std_logic_vector(3 downto 0);
	
	signal hex_B		: std_logic_vector(7 downto 4);
	signal seg7_B		: std_logic_vector(6 downto 0);
	
	--Inputted
	signal sevenseg		: std_logic_vector(7 downto 0);

begin

	hex_A <= sw(3 downto 0);
	hex_B <= sw(7 downto 4);

	
	
	
	
	
   with pb select						     
	sevenseg 				    <= 
										std_logic_vector(unsigned("0000" & hex_A) + unsigned("0000" & hex_B)) when "0111",
											-- "11111111" when others,
										
											"0000" & (hex_A AND hex_B) when "1110", 
											"0000" & (hex_A OR hex_B) when "1101", 
											"0000" & (hex_A XOR hex_B) when "1011",
										
											--"0000" when others;
											hex_B & hex_A when others;
	
									
								
	leds(7 downto 0) <= sevenseg;								
										
-- with pb select 
--	leds(3 downto 0)          <= hex_A AND hex_B when "1110", 
--	                             hex_A OR hex_B when "1101", 
--										  hex_A XOR hex_B when "1011",
--										
--										  "0000" when others;
--	
--	
	INST1: SevenSegment port map(hex_A, SEG7_A);
	INST2: SevenSegment port map(hex_B, SEG7_B);
	INST3: segment7_mux port map(clkin_50, seg7_B, seg7_A, seg7_data, seg7_char2, seg7_char1);
 
 
 
 
 
									
									
										
										
									   
								
 
 
end SimpleCircuit;

