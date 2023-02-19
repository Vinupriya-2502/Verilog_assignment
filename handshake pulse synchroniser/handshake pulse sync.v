`timescale 1ns / 1ps

module hdshk_pulse_sync (
    input  clk_a,
    input  sig_a,
    input  clk_b,
    output reg sig_b,
    output reg busy
);

    reg b1   =1'b0;
    reg b2   = 1'b0; 
    reg b3   = 1'b0;
    reg a1   = 1'b0;
    reg a2   =1'b0;
    reg a3   = 1'b0;
  
    wire mux1;
    wire mux2;

    assign busy = a3 | a1;
    assign sig_b = b2 & ~b3;
    assign mux1 = (a3 == 1'b1) ? 1'b0 : a1;
  assign mux2 = (sig_a == 1'b1) ? 1'b1 : mux1;
  always@(posedge clk_a)
    begin
      a1<=mux2;
      a2<=b2;
      a3<=a2;
    end
always @(posedge clk_b) 
  begin
        b1 <= a1;
        b2 <= b1;
        b3 <= b2;
        end
endmodule
