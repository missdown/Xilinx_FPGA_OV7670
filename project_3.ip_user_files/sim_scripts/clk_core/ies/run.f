-makelib ies/xil_defaultlib -sv \
  "E:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "E:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies/xpm \
  "E:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../../sources_1/ip/clk_core/clk_core_clk_wiz.v" \
  "../../../../../sources_1/ip/clk_core/clk_core.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

