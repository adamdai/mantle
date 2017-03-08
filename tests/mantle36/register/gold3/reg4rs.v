module Register4RS (input [3:0] I, output [3:0] O, input  CLK, input  RESET, input  SET);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
FDRSE #(.INIT(1'h0)) inst0 (.C(CLK), .CE(1'b1), .R(RESET), .S(SET), .D(I[0]), .Q(inst0_Q));
FDRSE #(.INIT(1'h0)) inst1 (.C(CLK), .CE(1'b1), .R(RESET), .S(SET), .D(I[1]), .Q(inst1_Q));
FDRSE #(.INIT(1'h0)) inst2 (.C(CLK), .CE(1'b1), .R(RESET), .S(SET), .D(I[2]), .Q(inst2_Q));
FDRSE #(.INIT(1'h0)) inst3 (.C(CLK), .CE(1'b1), .R(RESET), .S(SET), .D(I[3]), .Q(inst3_Q));
assign O = {inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module main (output [3:0] LED, input  CLKIN, input [5:0] SWITCH);
wire [3:0] inst0_O;
Register4RS inst0 (.I({SWITCH[3],SWITCH[2],SWITCH[1],SWITCH[0]}), .O(inst0_O), .CLK(CLKIN), .RESET(SWITCH[4]), .SET(SWITCH[5]));
assign LED = inst0_O;
endmodule

