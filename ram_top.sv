`include "ram.v" 
`include "ram_package.sv" 
`include "ram_interface.sv" 

module ram_top(); 

    import ram_package::*;  
    
	logic clk; 
    logic reset; 
 
 	initial clk = 1'b0;
  	initial forever #10 clk = ~clk; // Period is 20ns --> Frequency is 50Mhz 
  
  	initial begin 
    reset = 0;
    repeat(4) @(posedge clk);
    reset = 1;
    repeat(50) @(posedge clk);
    reset = 0;
    repeat(3) @(posedge clk);
    reset = 1;
    end 

	ram_inf intrf(clk,reset); 
	
	ram RAM(.data_in(intrf.data_in), .write_enb(intrf.write_enb), .read_enb(intrf.read_enb),.data_out(intrf.data_out), .address(intrf.address), .clk(clk), .reset(reset) ); 

	initial begin 
		ram_test test; 
		test = new(intrf.DRIVER, intrf.MONITOR ); 
		test.run(); 
      	
		$finish;
	end 

endmodule 
