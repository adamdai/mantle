module NOr2 (input [1:0] I, output  O);
wire  inst0_O;
LUT2 #(.INIT(4'h1)) inst0 (.I0(I[0]), .I1(I[1]), .O(inst0_O));
assign O = inst0_O;
endmodule

module NOr2x4 (input [3:0] I0, input [3:0] I1, output [3:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
NOr2 inst0 (.I({I1[0],I0[0]}), .O(inst0_O));
NOr2 inst1 (.I({I1[1],I0[1]}), .O(inst1_O));
NOr2 inst2 (.I({I1[2],I0[2]}), .O(inst2_O));
NOr2 inst3 (.I({I1[3],I0[3]}), .O(inst3_O));
assign O = {inst3_O,inst2_O,inst1_O,inst0_O};
endmodule

