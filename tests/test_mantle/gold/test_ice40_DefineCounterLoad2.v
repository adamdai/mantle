module FullAdder (input  I0, input  I1, input  CIN, output  O, output  COUT);
wire  inst0_O;
wire  inst1_CO;
SB_LUT4 #(.LUT_INIT(16'h9696)) inst0 (.I0(I0), .I1(I1), .I2(CIN), .I3(1'b0), .O(inst0_O));
SB_CARRY inst1 (.I0(I0), .I1(I1), .CI(CIN), .CO(inst1_CO));
assign O = inst0_O;
assign COUT = inst1_CO;
endmodule

module Add2Cout (input [1:0] I0, input [1:0] I1, output [1:0] O, output  COUT);
wire  inst0_O;
wire  inst0_COUT;
wire  inst1_O;
wire  inst1_COUT;
FullAdder inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(1'b0), .O(inst0_O), .COUT(inst0_COUT));
FullAdder inst1 (.I0(I0[1]), .I1(I1[1]), .CIN(inst0_COUT), .O(inst1_O), .COUT(inst1_COUT));
assign O = {inst1_O,inst0_O};
assign COUT = inst1_COUT;
endmodule

module Mux2 (input [1:0] I, input  S, output  O);
wire  inst0_O;
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst0 (.I0(I[0]), .I1(I[1]), .I2(S), .I3(1'b0), .O(inst0_O));
assign O = inst0_O;
endmodule

module Mux2x2 (input [1:0] I0, input [1:0] I1, input  S, output [1:0] O);
wire  inst0_O;
wire  inst1_O;
Mux2 inst0 (.I({I1[0],I0[0]}), .S(S), .O(inst0_O));
Mux2 inst1 (.I({I1[1],I0[1]}), .S(S), .O(inst1_O));
assign O = {inst1_O,inst0_O};
endmodule

module Register2 (input [1:0] I, output [1:0] O, input  CLK);
wire  inst0_Q;
wire  inst1_Q;
SB_DFF inst0 (.C(CLK), .D(I[0]), .Q(inst0_Q));
SB_DFF inst1 (.C(CLK), .D(I[1]), .Q(inst1_Q));
assign O = {inst1_Q,inst0_Q};
endmodule

module CounterLoad2 (input [1:0] DATA, input  LOAD, output [1:0] O, output  COUT, input  CLK);
wire [1:0] inst0_O;
wire  inst0_COUT;
wire [1:0] inst1_O;
wire [1:0] inst2_O;
Add2Cout inst0 (.I0(inst2_O), .I1({1'b0,1'b1}), .O(inst0_O), .COUT(inst0_COUT));
Mux2x2 inst1 (.I0(inst0_O), .I1(DATA), .S(LOAD), .O(inst1_O));
Register2 inst2 (.I(inst1_O), .O(inst2_O), .CLK(CLK));
assign O = inst2_O;
assign COUT = inst0_COUT;
endmodule

