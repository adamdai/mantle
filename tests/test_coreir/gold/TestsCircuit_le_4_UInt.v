module ULE4 (input [3:0] I0, input [3:0] I1, output  O);
wire  inst0_out;
coreir_ule inst0 (.in0(I0), .in1(I1), .out(inst0_out));
assign O = inst0_out;
endmodule

module TestsCircuit_le_4_UInt (input [3:0] I0, input [3:0] I1, output  O);
wire  inst0_O;
ULE4 inst0 (.I0(I0), .I1(I1), .O(inst0_O));
assign O = inst0_O;
endmodule

