module NXOr2 (input [1:0] I, output  O);
wire  inst0_O;
SB_LUT4 #(.LUT_INIT(16'h9999)) inst0 (.I0(I[0]), .I1(I[1]), .I2(1'b0), .I3(1'b0), .O(inst0_O));
assign O = inst0_O;
endmodule

module NXOr2x8 (input [7:0] I0, input [7:0] I1, output [7:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O;
wire  inst7_O;
NXOr2 inst0 (.I({I1[0],I0[0]}), .O(inst0_O));
NXOr2 inst1 (.I({I1[1],I0[1]}), .O(inst1_O));
NXOr2 inst2 (.I({I1[2],I0[2]}), .O(inst2_O));
NXOr2 inst3 (.I({I1[3],I0[3]}), .O(inst3_O));
NXOr2 inst4 (.I({I1[4],I0[4]}), .O(inst4_O));
NXOr2 inst5 (.I({I1[5],I0[5]}), .O(inst5_O));
NXOr2 inst6 (.I({I1[6],I0[6]}), .O(inst6_O));
NXOr2 inst7 (.I({I1[7],I0[7]}), .O(inst7_O));
assign O = {inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O};
endmodule

