// Code your design here
module areset_sync #(parameter STAGES=2)(
  input clk,             
  input async_rst_i,     
  output reg sync_rst_o 
);

reg [STAGES-1:0] flipflops;

(* ASYNC_REG = "true" *) reg [STAGES-1:0] async_reg;

always @(posedge clk) begin
  async_reg <= flipflops;
  flipflops <= {async_reg[STAGES-2:0], async_rst_i};
  sync_rst_o <= flipflops[STAGES-1];
end
endmodule
