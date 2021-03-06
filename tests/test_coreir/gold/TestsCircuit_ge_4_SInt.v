module SGE4 (input [3:0] I0, input [3:0] I1, output  O);
wire  inst0_out;
coreir_sge inst0 (.in0(I0), .in1(I1), .out(inst0_out));
assign O = inst0_out;
endmodule

module TestsCircuit_ge_4_SInt (input signed [3:0] I0, input signed [3:0] I1, output  O);
wire  inst0_O;
SGE4 inst0 (.I0(I0), .I1(I1), .O(inst0_O));
assign O = inst0_O;
endmodule

