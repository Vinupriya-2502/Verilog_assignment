// Code your testbench here
// or browse Examples
module areset_sync_tb;

  reg clk;
  reg async_rst_i;
  wire sync_rst_o;

  areset_sync_tb areset_sync (
    .clk(clk),
    .async_rst_i(async_rst_i),
    .sync_rst_o(sync_rst_o)
  );

  always #5 clk = ~clk;
   
  initial begin
	  clk=0;
    async_rst_i = 1;
    #10 async_rst_i = 0;
    #100 $finish;
  end
  
  always @(posedge clk) begin
    $display("sync_rst_o = %b", sync_rst_o);
  end
 
  initial begin
	$dumpfile("dump.vcd");
	$dumpvars(1);
end
endmodule
