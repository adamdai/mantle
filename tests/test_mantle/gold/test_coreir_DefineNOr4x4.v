module Invert4_wrapped (input [3:0] I, output [3:0] O);
wire [3:0] inst0_out;
coreir_not inst0 (.in(I), .out(inst0_out));
assign O = inst0_out;
endmodule

module Or4x4 (input [3:0] I0, input [3:0] I1, input [3:0] I2, input [3:0] I3, output [3:0] O);
wire  inst0_out;
wire  inst1_out;
wire  inst2_out;
wire  inst3_out;
orr inst0 (.in({I3[0],I2[0],I1[0],I0[0]}), .out(inst0_out));
orr inst1 (.in({I3[1],I2[1],I1[1],I0[1]}), .out(inst1_out));
orr inst2 (.in({I3[2],I2[2],I1[2],I0[2]}), .out(inst2_out));
orr inst3 (.in({I3[3],I2[3],I1[3],I0[3]}), .out(inst3_out));
assign O = {inst3_out,inst2_out,inst1_out,inst0_out};
endmodule

module NOr44 (input [3:0] I0, input [3:0] I1, input [3:0] I2, input [3:0] I3, output [3:0] O);
wire [3:0] inst0_O;
wire [3:0] inst1_O;
Invert4_wrapped inst0 (.I(inst1_O), .O(inst0_O));
Or4x4 inst1 (.I0(I0), .I1(I1), .I2(I2), .I3(I3), .O(inst1_O));
assign O = inst0_O;
endmodule

