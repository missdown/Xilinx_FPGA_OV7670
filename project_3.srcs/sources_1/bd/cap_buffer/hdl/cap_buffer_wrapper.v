//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
//Date        : Sat Dec 23 21:02:57 2017
//Host        : LAPTOP-QQOKKQGQ running 64-bit major release  (build 9200)
//Command     : generate_target cap_buffer_wrapper.bd
//Design      : cap_buffer_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module cap_buffer_wrapper
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

  cap_buffer cap_buffer_i
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
