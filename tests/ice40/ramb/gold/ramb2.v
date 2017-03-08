module main (input  I0, input  I1, input  I2, input  I3, input  I4, input  I5, input  I6, output  D1, output  D0, input  CLKIN);
wire [15:0] inst0_RDATA;
SB_RAM40_4K #(.INIT_1(256'hFFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000),
.INIT_0(256'hFFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000),
.INIT_3(256'hFFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000),
.INIT_2(256'hFFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000),
.INIT_5(256'hFFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000),
.INIT_4(256'hFFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000),
.INIT_7(256'hFFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000),
.INIT_6(256'hFFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000),
.INIT_9(256'hFFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000),
.INIT_8(256'hFFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000),
.INIT_A(256'hFFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000),
.INIT_C(256'hFFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000),
.READ_MODE(3),
.INIT_E(256'hFFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000),
.INIT_D(256'hFFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000),
.INIT_F(256'hFFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000),
.WRITE_MODE(3),
.INIT_B(256'hFFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000FF0000)) inst0 (.RDATA(inst0_RDATA), .RADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,I5,I4}), .RCLK(CLKIN), .RCLKE(1'b1), .RE(1'b1), .WCLK(CLKIN), .WCLKE(1'b1), .WE(I6), .WADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,I3,I2}), .MASK({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}), .WDATA({1'b0,1'b0,1'b0,1'b0,I1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,I0,1'b0,1'b0,1'b0}));
assign D1 = inst0_RDATA[11];
assign D0 = inst0_RDATA[3];
endmodule

