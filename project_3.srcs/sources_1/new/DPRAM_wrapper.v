//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4.2 (win64) Build 1494164 Fri Feb 26 04:18:56 MST 2016
//Date        : Sun Oct 02 23:06:13 2016
//Host        : MS-20160614LQQV running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target DPRAM_wrapper.bd
//Design      : DPRAM_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module DPRAM_wrapper
   (BRAM_PORTA_addr,
    BRAM_PORTA_clk,
    BRAM_PORTA_din,
    BRAM_PORTA_en,
    BRAM_PORTA_we,
    BRAM_PORTB_addr,
    BRAM_PORTB_clk,
    BRAM_PORTB_dout,
    BRAM_PORTB_en);
  input [19:0]BRAM_PORTA_addr;
  input BRAM_PORTA_clk;
  input [0:0]BRAM_PORTA_din;
  input BRAM_PORTA_en;
  input [0:0]BRAM_PORTA_we;
  input [19:0]BRAM_PORTB_addr;
  input BRAM_PORTB_clk;
  output [0:0]BRAM_PORTB_dout;
  input BRAM_PORTB_en;

  wire [19:0]BRAM_PORTA_addr;
  wire BRAM_PORTA_clk;
  wire [0:0]BRAM_PORTA_din;
  wire BRAM_PORTA_en;
  wire [0:0]BRAM_PORTA_we;
  wire [19:0]BRAM_PORTB_addr;
  wire BRAM_PORTB_clk;
  wire [0:0]BRAM_PORTB_dout;
  wire BRAM_PORTB_en;

  cap_buffer DPRAM_i
       (.BRAM_PORTA_addr(BRAM_PORTA_addr),
        .BRAM_PORTA_clk(BRAM_PORTA_clk),
        .BRAM_PORTA_din(BRAM_PORTA_din),
        .BRAM_PORTA_en(BRAM_PORTA_en),
        .BRAM_PORTA_we(BRAM_PORTA_we),
        .BRAM_PORTB_addr(BRAM_PORTB_addr),
        .BRAM_PORTB_clk(BRAM_PORTB_clk),
        .BRAM_PORTB_dout(BRAM_PORTB_dout),
        .BRAM_PORTB_en(BRAM_PORTB_en));
endmodule
