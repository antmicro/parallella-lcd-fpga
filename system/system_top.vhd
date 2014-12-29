-------------------------------------------------------------------------------
-- system_top.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system_top is
  port (
    processing_system7_0_MIO : inout std_logic_vector(53 downto 0);
    processing_system7_0_PS_SRSTB_pin : in std_logic;
    processing_system7_0_PS_CLK_pin : in std_logic;
    processing_system7_0_PS_PORB_pin : in std_logic;
    processing_system7_0_DDR_Clk : inout std_logic;
    processing_system7_0_DDR_Clk_n : inout std_logic;
    processing_system7_0_DDR_CKE : inout std_logic;
    processing_system7_0_DDR_CS_n : inout std_logic;
    processing_system7_0_DDR_RAS_n : inout std_logic;
    processing_system7_0_DDR_CAS_n : inout std_logic;
    processing_system7_0_DDR_WEB_pin : out std_logic;
    processing_system7_0_DDR_BankAddr : inout std_logic_vector(2 downto 0);
    processing_system7_0_DDR_Addr : inout std_logic_vector(14 downto 0);
    processing_system7_0_DDR_ODT : inout std_logic;
    processing_system7_0_DDR_DRSTB : inout std_logic;
    processing_system7_0_DDR_DQ : inout std_logic_vector(31 downto 0);
    processing_system7_0_DDR_DM : inout std_logic_vector(3 downto 0);
    processing_system7_0_DDR_DQS : inout std_logic_vector(3 downto 0);
    processing_system7_0_DDR_DQS_n : inout std_logic_vector(3 downto 0);
    processing_system7_0_DDR_VRN : inout std_logic;
    processing_system7_0_DDR_VRP : inout std_logic;
	 I2C_SCL : inout std_logic;
	 I2C_SDA : inout std_logic;
	 I2C_INT_N : in std_logic;
    HSYNC : out std_logic;
    VSYNC : out std_logic;
    PXL_CLK : out std_logic;
    DE : out std_logic;
    RED : out std_logic_vector(5 downto 0);
    GREEN : out std_logic_vector(5 downto 0);
    BLUE : out std_logic_vector(5 downto 0);
	 brigthness_pin : out std_logic;
	 tft_ena : out std_logic;
	 tft_wake_n : out std_logic
  );
end system_top;

architecture STRUCTURE of system_top is

  component system is
    port (
      processing_system7_0_MIO : inout std_logic_vector(53 downto 0);
      processing_system7_0_PS_SRSTB_pin : in std_logic;
      processing_system7_0_PS_CLK_pin : in std_logic;
      processing_system7_0_PS_PORB_pin : in std_logic;
      processing_system7_0_DDR_Clk : inout std_logic;
      processing_system7_0_DDR_Clk_n : inout std_logic;
      processing_system7_0_DDR_CKE : inout std_logic;
      processing_system7_0_DDR_CS_n : inout std_logic;
      processing_system7_0_DDR_RAS_n : inout std_logic;
      processing_system7_0_DDR_CAS_n : inout std_logic;
      processing_system7_0_DDR_WEB_pin : out std_logic;
      processing_system7_0_DDR_BankAddr : inout std_logic_vector(2 downto 0);
      processing_system7_0_DDR_Addr : inout std_logic_vector(14 downto 0);
      processing_system7_0_DDR_ODT : inout std_logic;
      processing_system7_0_DDR_DRSTB : inout std_logic;
      processing_system7_0_DDR_DQ : inout std_logic_vector(31 downto 0);
      processing_system7_0_DDR_DM : inout std_logic_vector(3 downto 0);
      processing_system7_0_DDR_DQS : inout std_logic_vector(3 downto 0);
      processing_system7_0_DDR_DQS_n : inout std_logic_vector(3 downto 0);
      processing_system7_0_DDR_VRN : inout std_logic;
      processing_system7_0_DDR_VRP : inout std_logic;
		processing_system7_0_I2C0_SCL_pin :inout std_logic;
		processing_system7_0_I2C0_SDA_pin :inout std_logic;
		processing_system7_0_I2C0_INT_N_pin : in std_logic;
		processing_system7_0_FCLK_CLK0_pin : out std_logic;
      axi_dispctrl_0_HSYNC_O_pin : out std_logic;
      axi_dispctrl_0_VSYNC_O_pin : out std_logic;
      axi_dispctrl_0_PXL_CLK_O_pin : out std_logic;
      axi_dispctrl_0_DE_O_pin : out std_logic;
      axi_dispctrl_0_RED_O_pin : out std_logic_vector(7 downto 0);
      axi_dispctrl_0_GREEN_O_pin : out std_logic_vector(7 downto 0);
      axi_dispctrl_0_BLUE_O_pin : out std_logic_vector(7 downto 0);
		axi_dispctrl_0_ENABLE_O_pin : out std_logic
    );
  end component;

 attribute BOX_TYPE : STRING;
 attribute BOX_TYPE of system : component is "user_black_box";
 
 signal axi_dispctrl_0_HSYNC_O_pin : std_logic;
 signal axi_dispctrl_0_VSYNC_O_pin : std_logic;
 signal axi_dispctrl_0_PXL_CLK_O_pin : std_logic;
 signal axi_dispctrl_0_DE_O_pin : std_logic;
 signal axi_dispctrl_0_RED_O_pin : std_logic_vector(7 downto 0);
 signal axi_dispctrl_0_GREEN_O_pin : std_logic_vector(7 downto 0);
 signal axi_dispctrl_0_BLUE_O_pin : std_logic_vector(7 downto 0);
 signal axi_dispctrl_0_ENABLE_O_pin : std_logic;
 signal clk_100MHz : std_logic;
begin

	brigthness_pin <= '1';
	
	tft_ena <= axi_dispctrl_0_ENABLE_O_pin;

	HSYNC <= axi_dispctrl_0_HSYNC_O_pin;
	VSYNC <= axi_dispctrl_0_VSYNC_O_pin;
   PXL_CLK <= axi_dispctrl_0_PXL_CLK_O_pin;
   DE <= axi_dispctrl_0_DE_O_pin;
   RED <= axi_dispctrl_0_RED_O_pin (7 downto 2); 
   GREEN <= axi_dispctrl_0_GREEN_O_pin (7 downto 2);
   BLUE <= axi_dispctrl_0_BLUE_O_pin (7 downto 2);
	
	lcd_reset: process (clk_100MHz)
	variable rst_count: integer range 0 to 1_000_000 := 0;
	begin
		if( rising_edge(clk_100MHz) ) then
			if( rst_count = 1_000_000 ) then
				tft_wake_n <= '1';
			else
				tft_wake_n <= '0';
				rst_count := rst_count + 1;
			end if;
		end if;
	end process;

  system_i : system
    port map (
      processing_system7_0_MIO => processing_system7_0_MIO,
      processing_system7_0_PS_SRSTB_pin => processing_system7_0_PS_SRSTB_pin,
      processing_system7_0_PS_CLK_pin => processing_system7_0_PS_CLK_pin,
      processing_system7_0_PS_PORB_pin => processing_system7_0_PS_PORB_pin,
      processing_system7_0_DDR_Clk => processing_system7_0_DDR_Clk,
      processing_system7_0_DDR_Clk_n => processing_system7_0_DDR_Clk_n,
      processing_system7_0_DDR_CKE => processing_system7_0_DDR_CKE,
      processing_system7_0_DDR_CS_n => processing_system7_0_DDR_CS_n,
      processing_system7_0_DDR_RAS_n => processing_system7_0_DDR_RAS_n,
      processing_system7_0_DDR_CAS_n => processing_system7_0_DDR_CAS_n,
      processing_system7_0_DDR_WEB_pin => processing_system7_0_DDR_WEB_pin,
      processing_system7_0_DDR_BankAddr => processing_system7_0_DDR_BankAddr,
      processing_system7_0_DDR_Addr => processing_system7_0_DDR_Addr,
      processing_system7_0_DDR_ODT => processing_system7_0_DDR_ODT,
      processing_system7_0_DDR_DRSTB => processing_system7_0_DDR_DRSTB,
      processing_system7_0_DDR_DQ => processing_system7_0_DDR_DQ,
      processing_system7_0_DDR_DM => processing_system7_0_DDR_DM,
      processing_system7_0_DDR_DQS => processing_system7_0_DDR_DQS,
      processing_system7_0_DDR_DQS_n => processing_system7_0_DDR_DQS_n,
      processing_system7_0_DDR_VRN => processing_system7_0_DDR_VRN,
      processing_system7_0_DDR_VRP => processing_system7_0_DDR_VRP,
		processing_system7_0_I2C0_SCL_pin => I2C_SCL,
		processing_system7_0_I2C0_SDA_pin => I2C_SDA,
		processing_system7_0_I2C0_INT_N_pin => I2C_INT_N,
		processing_system7_0_FCLK_CLK0_pin => clk_100MHz,
      axi_dispctrl_0_HSYNC_O_pin => axi_dispctrl_0_HSYNC_O_pin,
      axi_dispctrl_0_VSYNC_O_pin => axi_dispctrl_0_VSYNC_O_pin,
      axi_dispctrl_0_PXL_CLK_O_pin => axi_dispctrl_0_PXL_CLK_O_pin,
      axi_dispctrl_0_DE_O_pin => axi_dispctrl_0_DE_O_pin,
      axi_dispctrl_0_RED_O_pin => axi_dispctrl_0_RED_O_pin,
      axi_dispctrl_0_GREEN_O_pin => axi_dispctrl_0_GREEN_O_pin,
      axi_dispctrl_0_BLUE_O_pin => axi_dispctrl_0_BLUE_O_pin,
		axi_dispctrl_0_ENABLE_O_pin => axi_dispctrl_0_ENABLE_O_pin
    );

end architecture STRUCTURE;

