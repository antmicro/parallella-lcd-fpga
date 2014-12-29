-------------------------------------------------------------------------------
-- system_axi_dispctrl_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library axi_dispctrl_v1_00_a;
use axi_dispctrl_v1_00_a.all;

entity system_axi_dispctrl_0_wrapper is
  port (
    REF_CLK_I : in std_logic;
    PXL_CLK_O : out std_logic;
    VDMA_CLK_O : out std_logic;
    PXL_CLK_5X_O : out std_logic;
    LOCKED_O : out std_logic;
    FSYNC_O : out std_logic;
    HSYNC_O : out std_logic;
    VSYNC_O : out std_logic;
    DE_O : out std_logic;
    RED_O : out std_logic_vector(7 downto 0);
    GREEN_O : out std_logic_vector(7 downto 0);
    BLUE_O : out std_logic_vector(7 downto 0);
    ENABLE_O : out std_logic;
    DEBUG_O : out std_logic_vector(31 downto 0);
    S_AXI_ACLK : in std_logic;
    S_AXI_ARESETN : in std_logic;
    S_AXI_AWADDR : in std_logic_vector(31 downto 0);
    S_AXI_AWVALID : in std_logic;
    S_AXI_WDATA : in std_logic_vector(31 downto 0);
    S_AXI_WSTRB : in std_logic_vector(3 downto 0);
    S_AXI_WVALID : in std_logic;
    S_AXI_BREADY : in std_logic;
    S_AXI_ARADDR : in std_logic_vector(31 downto 0);
    S_AXI_ARVALID : in std_logic;
    S_AXI_RREADY : in std_logic;
    S_AXI_ARREADY : out std_logic;
    S_AXI_RDATA : out std_logic_vector(31 downto 0);
    S_AXI_RRESP : out std_logic_vector(1 downto 0);
    S_AXI_RVALID : out std_logic;
    S_AXI_WREADY : out std_logic;
    S_AXI_BRESP : out std_logic_vector(1 downto 0);
    S_AXI_BVALID : out std_logic;
    S_AXI_AWREADY : out std_logic;
    S_AXIS_TREADY : out std_logic;
    S_AXIS_ACLK : in std_logic;
    S_AXIS_ARESETN : in std_logic;
    S_AXIS_TDATA : in std_logic_vector(31 downto 0);
    S_AXIS_TVALID : in std_logic;
    S_AXIS_TLAST : in std_logic;
    S_AXIS_TSTRB : in std_logic_vector(3 downto 0)
  );
end system_axi_dispctrl_0_wrapper;

architecture STRUCTURE of system_axi_dispctrl_0_wrapper is

  component axi_dispctrl is
    generic (
      C_S_AXI_DATA_WIDTH : INTEGER;
      C_S_AXI_ADDR_WIDTH : INTEGER;
      C_S_AXI_MIN_SIZE : std_logic_vector;
      C_USE_WSTRB : INTEGER;
      C_DPHASE_TIMEOUT : INTEGER;
      C_BASEADDR : std_logic_vector;
      C_HIGHADDR : std_logic_vector;
      C_FAMILY : STRING;
      C_NUM_REG : INTEGER;
      C_NUM_MEM : INTEGER;
      C_SLV_AWIDTH : INTEGER;
      C_SLV_DWIDTH : INTEGER;
      C_USE_BUFR_DIV5 : INTEGER;
      C_RED_WIDTH : INTEGER;
      C_GREEN_WIDTH : INTEGER;
      C_BLUE_WIDTH : INTEGER;
      C_S_AXIS_MM2S_TDATA_WIDTH : INTEGER
    );
    port (
      REF_CLK_I : in std_logic;
      PXL_CLK_O : out std_logic;
      VDMA_CLK_O : out std_logic;
      PXL_CLK_5X_O : out std_logic;
      LOCKED_O : out std_logic;
      FSYNC_O : out std_logic;
      HSYNC_O : out std_logic;
      VSYNC_O : out std_logic;
      DE_O : out std_logic;
      RED_O : out std_logic_vector((C_RED_WIDTH-1) downto 0);
      GREEN_O : out std_logic_vector((C_GREEN_WIDTH-1) downto 0);
      BLUE_O : out std_logic_vector((C_BLUE_WIDTH-1) downto 0);
      ENABLE_O : out std_logic;
      DEBUG_O : out std_logic_vector(31 downto 0);
      S_AXI_ACLK : in std_logic;
      S_AXI_ARESETN : in std_logic;
      S_AXI_AWADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      S_AXI_AWVALID : in std_logic;
      S_AXI_WDATA : in std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      S_AXI_WSTRB : in std_logic_vector(((C_S_AXI_DATA_WIDTH/8)-1) downto 0);
      S_AXI_WVALID : in std_logic;
      S_AXI_BREADY : in std_logic;
      S_AXI_ARADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      S_AXI_ARVALID : in std_logic;
      S_AXI_RREADY : in std_logic;
      S_AXI_ARREADY : out std_logic;
      S_AXI_RDATA : out std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      S_AXI_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_RVALID : out std_logic;
      S_AXI_WREADY : out std_logic;
      S_AXI_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_BVALID : out std_logic;
      S_AXI_AWREADY : out std_logic;
      S_AXIS_TREADY : out std_logic;
      S_AXIS_ACLK : in std_logic;
      S_AXIS_ARESETN : in std_logic;
      S_AXIS_TDATA : in std_logic_vector((C_S_AXIS_MM2S_TDATA_WIDTH-1) downto 0);
      S_AXIS_TVALID : in std_logic;
      S_AXIS_TLAST : in std_logic;
      S_AXIS_TSTRB : in std_logic_vector((C_S_AXIS_MM2S_TDATA_WIDTH/8)-1 downto 0)
    );
  end component;

begin

  axi_dispctrl_0 : axi_dispctrl
    generic map (
      C_S_AXI_DATA_WIDTH => 32,
      C_S_AXI_ADDR_WIDTH => 32,
      C_S_AXI_MIN_SIZE => X"000001ff",
      C_USE_WSTRB => 0,
      C_DPHASE_TIMEOUT => 8,
      C_BASEADDR => X"75c00000",
      C_HIGHADDR => X"75c0ffff",
      C_FAMILY => "zynq",
      C_NUM_REG => 1,
      C_NUM_MEM => 1,
      C_SLV_AWIDTH => 32,
      C_SLV_DWIDTH => 32,
      C_USE_BUFR_DIV5 => 1,
      C_RED_WIDTH => 8,
      C_GREEN_WIDTH => 8,
      C_BLUE_WIDTH => 8,
      C_S_AXIS_MM2S_TDATA_WIDTH => 32
    )
    port map (
      REF_CLK_I => REF_CLK_I,
      PXL_CLK_O => PXL_CLK_O,
      VDMA_CLK_O => VDMA_CLK_O,
      PXL_CLK_5X_O => PXL_CLK_5X_O,
      LOCKED_O => LOCKED_O,
      FSYNC_O => FSYNC_O,
      HSYNC_O => HSYNC_O,
      VSYNC_O => VSYNC_O,
      DE_O => DE_O,
      RED_O => RED_O,
      GREEN_O => GREEN_O,
      BLUE_O => BLUE_O,
      ENABLE_O => ENABLE_O,
      DEBUG_O => DEBUG_O,
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARESETN => S_AXI_ARESETN,
      S_AXI_AWADDR => S_AXI_AWADDR,
      S_AXI_AWVALID => S_AXI_AWVALID,
      S_AXI_WDATA => S_AXI_WDATA,
      S_AXI_WSTRB => S_AXI_WSTRB,
      S_AXI_WVALID => S_AXI_WVALID,
      S_AXI_BREADY => S_AXI_BREADY,
      S_AXI_ARADDR => S_AXI_ARADDR,
      S_AXI_ARVALID => S_AXI_ARVALID,
      S_AXI_RREADY => S_AXI_RREADY,
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_RDATA => S_AXI_RDATA,
      S_AXI_RRESP => S_AXI_RRESP,
      S_AXI_RVALID => S_AXI_RVALID,
      S_AXI_WREADY => S_AXI_WREADY,
      S_AXI_BRESP => S_AXI_BRESP,
      S_AXI_BVALID => S_AXI_BVALID,
      S_AXI_AWREADY => S_AXI_AWREADY,
      S_AXIS_TREADY => S_AXIS_TREADY,
      S_AXIS_ACLK => S_AXIS_ACLK,
      S_AXIS_ARESETN => S_AXIS_ARESETN,
      S_AXIS_TDATA => S_AXIS_TDATA,
      S_AXIS_TVALID => S_AXIS_TVALID,
      S_AXIS_TLAST => S_AXIS_TLAST,
      S_AXIS_TSTRB => S_AXIS_TSTRB
    );

end architecture STRUCTURE;

