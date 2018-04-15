`timescale 1 ns / 1 ns


module top_flyinglogo(clk, sys_rst, hsync, vsync, vga_r, vga_g, vga_b, OV7670_SIOC, OV7670_SIOD, OV7670_RESET, OV7670_PWDN, OV7670_XCLK, OV7670_PCLK, OV7670_HREF, OV7670_VSYNC, OV7670_D, ERROR_LED, led, led2);
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
   
   wire            pclk;
   wire            valid;
   wire [9:0]      h_cnt;
   wire [9:0]      v_cnt;
   reg [11:0]      vga_data;
   reg             current_status = 0;
   reg [19:0]      ram_addr;
   wire [0:0]      douta;
   
   wire            logo_area;
//   reg [9:0]       logo_x;
//   reg [9:0]       logo_y;
   parameter [9:0] logo_length = 10'b1010000000;
   parameter [9:0] logo_hight  = 10'b0111100000;
   
	  dcm_25m u0
         (
          .clk_in1(clk),      // input clk_in1
          // Clock out ports
          .clk_out1(pclk),     // output clk_out1
          
          .reset(sys_rst));   
      assign OV7670_XCLK = pclk ;
      assign OV7670_RESET = !sys_rst;
      cfg_ov7670  I_CFG_OV7670 (
                      .OV7670_SIOC( OV7670_SIOC ),
                      .OV7670_SIOD( OV7670_SIOD ),
                      .OV7670_PWDN( OV7670_PWDN ),
                      .CLK25M( pclk ) ,
                      .rst( sys_rst ) ,
                      .ERROR(ERROR_LED)
                  );        
                  
      always@ (posedge OV7670_VSYNC)
           current_status <= !current_status;

     wire  [0:0] ov2ram_data ;
     wire  ov2ram_wr ;
     wire [19:0] ov2ram_addr ;
     wire test;
     OV7670_CAPTURE OV7670_CAPTURE (
                        .rst( sys_rst ),
                        .pclk( OV7670_PCLK ) ,
                        .href ( OV7670_HREF ),
                        .vsync( OV7670_VSYNC ),
                        .istatus(current_status),
                        .din ( OV7670_D ),
                        .buff_dout( ov2ram_data ),
                        .buff_wr( ov2ram_wr ),
                        .buff_addr( ov2ram_addr ),
                        .t8_valid(test)
                    );
	assign led2 = current_status;
    assign led = test;
	DPRAM_wrapper u1 (
	.BRAM_PORTA_addr(ov2ram_addr),
    .BRAM_PORTA_clk(pclk),
    .BRAM_PORTA_din(ov2ram_data),
    .BRAM_PORTA_en(1'b1),
    .BRAM_PORTA_we(ov2ram_wr),
    
    .BRAM_PORTB_addr(ram_addr),
    .BRAM_PORTB_clk(pclk),
    .BRAM_PORTB_dout(douta),
    .BRAM_PORTB_en(1'b1));

	vga_640x480 u2 (
		.pclk(pclk), 
		.reset(sys_rst), 
		.hsync(hsync), 
		.vsync(vsync), 
		.valid(valid), 
		.h_cnt(h_cnt), 
		.v_cnt(v_cnt)
		);
 
   assign logo_area = ((v_cnt >= 10'b00000000000) & (v_cnt <= logo_hight) & (h_cnt >= 10'b00000000000) & (h_cnt <= logo_length)) ? 1'b1 : 
                      1'b0;
   
   
   always @(posedge pclk)
   begin
      if (sys_rst == 1'b1)
         vga_data <= 12'b000000000000;
      else 
      begin
         if (valid == 1'b1)
         begin
               ram_addr <= ram_addr + 1;
               if(douta == 1'b0)
                   begin
                       vga_data <= 12'b000000000000;
                   end
               else
                   begin
                       vga_data <= 12'b111111111111;
                   end
         end
         else
             begin
                vga_data <= 12'b111111111111;
                if (v_cnt == 0)
                   begin
                        ram_addr <= current_status ? 307200 : 0;
                    end
             end
      end
   end
   
   assign vga_r = vga_data[11:8];
   assign vga_g = vga_data[7:4];
   assign vga_b = vga_data[3:0];
   
endmodule