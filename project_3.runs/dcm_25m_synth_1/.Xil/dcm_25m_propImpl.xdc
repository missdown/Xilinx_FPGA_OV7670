set_property SRC_FILE_INFO {cfile:d:/EGO1_Student/OV7725_VGA/project_3/project_3.srcs/sources_1/ip/dcm_25m/dcm_25m.xdc rfile:../../../project_3.srcs/sources_1/ip/dcm_25m/dcm_25m.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
