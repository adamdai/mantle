module xor8_wrapped (input [7:0] I0, input [7:0] I1, output [7:0] O);
wire [7:0] inst0_out;
coreir_xor inst0 (.in0(I0), .in1(I1), .out(inst0_out));
assign O = inst0_out;
endmodule

module fold_xor48 (input [7:0] I0, input [7:0] I1, input [7:0] I2, input [7:0] I3, output [7:0] O);
wire [7:0] inst0_O;
wire [7:0] inst1_O;
wire [7:0] inst2_O;
xor8_wrapped inst0 (.I0(I0), .I1(I1), .O(inst0_O));
xor8_wrapped inst1 (.I0(inst0_O), .I1(I2), .O(inst1_O));
xor8_wrapped inst2 (.I0(inst1_O), .I1(I3), .O(inst2_O));
assign O = inst2_O;
endmodule

