`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/29 23:09:14
// Design Name: 
// Module Name: all_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module all_top(
     clk, sys_rst, hsync, vsync, vga_r, vga_g, vga_b, OV7670_SIOC, OV7670_SIOD, OV7670_RESET, OV7670_PWDN, OV7670_XCLK, OV7670_PCLK, OV7670_HREF, OV7670_VSYNC, OV7670_D, ERROR_LED, led, led2,
    
     rst_pin,        // Active HIGH reset (from pin)
   
     // RS232 signals
     rxd_pin,        // RS232 RXD pin
     txd_pin,        // RS232 RXD pin
   
     // Loopback selector
     lb_sel_pin,     // Loopback selector 
     //BT 
      bt_pw_on,
      bt_master_slave,
      bt_sw_hw,
      bt_rst_n,
      bt_sw,
      sw_pin,
       
     //seg7
      seg7_0_7bit,
      seg7_1_7bit,
      seg7_0_an,
      seg7_1_an,
      seg7_0_dp,
      seg7_1_dp,
     // LED outputs
//      led_pins,
   
      t
    );
    input           clk;
    input           sys_rst;
    output       OV7670_SIOC;
    inout        OV7670_SIOD;
    output       OV7670_RESET;
    output       OV7670_PWDN;
    output       OV7670_XCLK;
    input        OV7670_PCLK,OV7670_HREF,OV7670_VSYNC;
    input  [7:0] OV7670_D ;
    output          hsync;
    output          vsync;
    output [3:0]    vga_r;
    output [3:0]    vga_g;
    output [3:0]    vga_b;
    output ERROR_LED;
    output led;
    output led2;
    
     input            rst_pin;        // Active HIGH reset (from pin)
   
     // RS232 signals
     input            rxd_pin;        // RS232 RXD pin
     output           txd_pin;        // RS232 RXD pin
   
     // Loopback selector
     input            lb_sel_pin;     // Loopback selector 
     //BT 
       output bt_pw_on;
       output bt_master_slave;
       output bt_sw_hw;
       output bt_rst_n;
       output bt_sw;
       input  [5:0]  sw_pin;
       
     //seg7
       output     [6:0] seg7_0_7bit;
       output     [6:0] seg7_1_7bit;
       output     [3:0] seg7_0_an;
       output     [3:0] seg7_1_an;
       output     seg7_0_dp;
       output     seg7_1_dp;
     // LED outputs
//       output     [15:0] led_pins;
   
       output  t;
       
       bt_uart bt_uart(
           .clk_pin(clk),
           .rst_pin(rst_pin),        // Active HIGH reset (from pin)
         
           // RS232 signals
           .rxd_pin(rxd_pin),        // RS232 RXD pin
           .txd_pin(txd_pin),        // RS232 RXD pin
         
           // Loopback selector
           .lb_sel_pin(lb_sel_pin),     // Loopback selector 
           //BT 
            .bt_pw_on(bt_pw_on),
            .bt_master_slave(bt_master_slave),
            .bt_sw_hw(bt_sw_hw),
            .bt_rst_n(bt_rst_n),
            .bt_sw(bt_sw),
            .sw_pin(sw_pin),
             
           //seg7
            .seg7_0_7bit(seg7_0_7bit),
            .seg7_1_7bit(seg7_1_7bit),
            .seg7_0_an(seg7_0_an),
            .seg7_1_an(seg7_1_an),
            .seg7_0_dp(seg7_0_dp),
            .seg7_1_dp(seg7_1_dp),
           // LED outputs
//            .led_pins(led_pins),
         
            .t(t)
       );
       
       top_flyinglogo top_flyinglogo(
            .clk(clk),
            .sys_rst(sys_rst), 
            .hsync(hsync), 
            .vsync(vsync), 
            .vga_r(vga_r), 
            .vga_g(vga_g), 
            .vga_b(vga_b), 
            .OV7670_SIOC(OV7670_SIOC), 
            .OV7670_SIOD(OV7670_SIOD), 
            .OV7670_RESET(OV7670_RESET), 
            .OV7670_PWDN(OV7670_PWDN), 
            .OV7670_XCLK(OV7670_XCLK), 
            .OV7670_PCLK(OV7670_PCLK), 
            .OV7670_HREF(OV7670_HREF), 
            .OV7670_VSYNC(OV7670_VSYNC), 
            .OV7670_D(OV7670_D), 
            .ERROR_LED(ERROR_LED), 
            .led(led), 
            .led2(led2)
            
       );
       
       
endmodule
