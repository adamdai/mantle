module UGT4 (input [3:0] I0, input [3:0] I1, output  O);
wire  inst0_out;
coreir_ugt inst0 (.in0(I0), .in1(I1), .out(inst0_out));
assign O = inst0_out;
endmodule

module TestsCircuit_gt_4_Bits_BitsType (input [3:0] I0, input [3:0] I1, output  O0, output  O1);
wire  inst0_O;
UGT4 inst0 (.I0(I0), .I1(I1), .O(inst0_O));
assign O0 = inst0_O;
assign O1 = 1'b0;
endmodule

