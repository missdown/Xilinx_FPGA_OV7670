/*
OV7670_CAPTURE OV7670_CAPTURE (
.rst( ), 
.pclk( ) , 
.href ( ), 
.vsync( ),
.din ( ),

buff_dout( ),
buff_wr( ),
buff_addr( )

);
*/

module OV7670_CAPTURE (
        input rst, pclk , href , vsync,
        input [7:0] din ,
        input  wire istatus,
        output reg [0:0] buff_dout,
        output reg  buff_wr,
        output reg [19:0] buff_addr,
        output reg t8_valid
    );

    wire  [7:0] data8 = din ;
    wire  wr8 = href ;

    reg [7:0] t8 ;
//    reg t8_valid ;
    wire wr16 ;
    wire [15:0] data16 ;

    always @ (posedge pclk)if ( wr8  )t8 <= data8;
    always @ (posedge pclk)
       if ( vsync | rst )
           t8_valid<=0;
       else if (wr8)
           t8_valid <= !t8_valid;

    assign wr16 = t8_valid & wr8 ;
    assign data16 = { t8[7:0] , data8[7:0] } ;

    wire [8:0]R = {data16[15:11], 3'b0};
    wire [8:0]G = {data16[10:5], 2'b0};
    wire [8:0]B = {data16[4:0], 3'b0};
//    wire [8:0]Cb = (- 44 * R - 87 * G + 131 * B) / 256 + 128 ;
//    wire [8:0]Cr = (131 * R - 110 * G - 21 * B) / 256 + 128 ;

    //output reg [11:0] buff_dout,
    //output reg  buff_wr,
    always@ (posedge pclk)  buff_wr <= wr16 ;
    
    always@ (posedge pclk) 
        begin
//                buff_dout <= ((Cr >= 137) && (Cr <= 173) && (Cb >= 77) && (Cr <= 127 )) ? 1'b0 : 1'b1;
              buff_dout <= (((R > 95)&&(G > 40)&&(B > 20)&&(R > B)&&((R - B) > 15)&&(R > G)&&((R - G) > 15))||(R > 200)&&(G > 210)&&(B > 170)&&(R > B)&&((R - B) <= 15)&&(G > B)) ? 1'b0:1'b1;
//              buff_dout <= (30 * R + 59 * G + 11 * B) > 3150 ? 1'b1 : 1'b0;
        end


    //output reg [18:0] buff_addr
//    reg  vsyncr ;
//    always@(posedge pclk)
//       begin
//         vsyncr <= vsync ;
//       end

    always@ (posedge pclk)
        if ( vsync | rst )
            buff_addr <= istatus ? 0 : 307200;
        else if (buff_wr)
            buff_addr<=buff_addr+1;

endmodule
