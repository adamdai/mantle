module Sub4_cin1_cout (input [3:0] I0, input [3:0] I1, output [3:0] O, output  COUT);
wire  inst0_O5;
wire  inst0_O6;
wire  inst1_O;
wire  inst2_O5;
wire  inst2_O6;
wire  inst3_O;
wire  inst4_O5;
wire  inst4_O6;
wire  inst5_O;
wire  inst6_O5;
wire  inst6_O6;
wire  inst7_O;
LUT6_2 #(.INIT(64'h4444444444444443)) inst0 (.I0(I0[0]), .I1(I1[0]), .I5(1'b1), .O5(inst0_O5), .O6(inst0_O6));
MUXCY inst1 (.DI(inst0_O5), .CI(1'b1), .S(inst0_O6), .O(inst1_O));
LUT6_2 #(.INIT(64'h4444444444444443)) inst2 (.I0(I0[1]), .I1(I1[1]), .I5(1'b1), .O5(inst2_O5), .O6(inst2_O6));
MUXCY inst3 (.DI(inst2_O5), .CI(inst1_O), .S(inst2_O6), .O(inst3_O));
LUT6_2 #(.INIT(64'h4444444444444443)) inst4 (.I0(I0[2]), .I1(I1[2]), .I5(1'b1), .O5(inst4_O5), .O6(inst4_O6));
MUXCY inst5 (.DI(inst4_O5), .CI(inst3_O), .S(inst4_O6), .O(inst5_O));
LUT6_2 #(.INIT(64'h4444444444444443)) inst6 (.I0(I0[3]), .I1(I1[3]), .I5(1'b1), .O5(inst6_O5), .O6(inst6_O6));
MUXCY inst7 (.DI(inst6_O5), .CI(inst5_O), .S(inst6_O6), .O(inst7_O));
assign O = {inst6_O6,inst4_O6,inst2_O6,inst0_O6};
assign COUT = inst7_O;
endmodule

module UGT4 (input [3:0] I0, input [3:0] I1, output  O);
wire [3:0] inst0_O;
wire  inst0_COUT;
wire  inst1_O;
Sub4_cin1_cout inst0 (.I0(I1), .I1(I0), .O(inst0_O), .COUT(inst0_COUT));
LUT1 #(.INIT(2'h1)) inst1 (.I0(inst0_COUT), .O(inst1_O));
assign O = inst1_O;
endmodule

