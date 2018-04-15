-makelib ies/xil_defaultlib -sv \
  "D:/vivado/Vivado/2017.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/vivado/Vivado/2017.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies/xpm \
  "D:/vivado/Vivado/2017.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../project_3.srcs/sources_1/ip/dcm_25m/dcm_25m_clk_wiz.v" \
  "../../../../project_3.srcs/sources_1/ip/dcm_25m/dcm_25m.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

