module main (input  I0, input  I1, input  I2, input  I3, input  I4, input  I5, input  I6, output  D1, output  D0, input  CLKIN);
wire [15:0] inst0_RDATA;
SB_RAM40_4K #(.WRITE_MODE(1),
.READ_MODE(1),
.INIT_0(256'h00FF00FC00F300F000CF00CC00C300C0003F003C00330030000F000C00030000),
.INIT_1(256'h03FF03FC03F303F003CF03CC03C303C0033F033C03330330030F030C03030300),
.INIT_2(256'h0CFF0CFC0CF30CF00CCF0CCC0CC30CC00C3F0C3C0C330C300C0F0C0C0C030C00),
.INIT_3(256'h0FFF0FFC0FF30FF00FCF0FCC0FC30FC00F3F0F3C0F330F300F0F0F0C0F030F00),
.INIT_4(256'h30FF30FC30F330F030CF30CC30C330C0303F303C30333030300F300C30033000),
.INIT_5(256'h33FF33FC33F333F033CF33CC33C333C0333F333C33333330330F330C33033300),
.INIT_6(256'h3CFF3CFC3CF33CF03CCF3CCC3CC33CC03C3F3C3C3C333C303C0F3C0C3C033C00),
.INIT_7(256'h3FFF3FFC3FF33FF03FCF3FCC3FC33FC03F3F3F3C3F333F303F0F3F0C3F033F00),
.INIT_8(256'hC0FFC0FCC0F3C0F0C0CFC0CCC0C3C0C0C03FC03CC033C030C00FC00CC003C000),
.INIT_9(256'hC3FFC3FCC3F3C3F0C3CFC3CCC3C3C3C0C33FC33CC333C330C30FC30CC303C300),
.INIT_A(256'hCCFFCCFCCCF3CCF0CCCFCCCCCCC3CCC0CC3FCC3CCC33CC30CC0FCC0CCC03CC00),
.INIT_B(256'hCFFFCFFCCFF3CFF0CFCFCFCCCFC3CFC0CF3FCF3CCF33CF30CF0FCF0CCF03CF00),
.INIT_C(256'hF0FFF0FCF0F3F0F0F0CFF0CCF0C3F0C0F03FF03CF033F030F00FF00CF003F000),
.INIT_D(256'hF3FFF3FCF3F3F3F0F3CFF3CCF3C3F3C0F33FF33CF333F330F30FF30CF303F300),
.INIT_E(256'hFCFFFCFCFCF3FCF0FCCFFCCCFCC3FCC0FC3FFC3CFC33FC30FC0FFC0CFC03FC00),
.INIT_F(256'hFFFFFFFCFFF3FFF0FFCFFFCCFFC3FFC0FF3FFF3CFF33FF30FF0FFF0CFF03FF00)) inst0 (.RDATA(inst0_RDATA), .RADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,I5,I4}), .RCLK(CLKIN), .RCLKE(1'b1), .RE(1'b1), .WCLK(CLKIN), .WCLKE(1'b1), .WE(I6), .WADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,I3,I2}), .MASK({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}), .WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,I1,1'b0,I0}));
assign D1 = inst0_RDATA[2];
assign D0 = inst0_RDATA[0];
endmodule

