class reference_model;
   	
	transaction trans_obj;
   	mailbox #(transaction) mbx_dr;
   	mailbox #(transaction) mbx_rs;
   	
	bit [7:0] MEM [31:0];

  	function new(mailbox #(transaction) mbx_dr, mailbox #(transaction) mbx_rs );
    	this.mbx_dr = mbx_dr;
    	this.mbx_rs = mbx_rs;
   	endfunction

  	task start();
    	for(int i=0; i<`num_of_trans; i++)
     	begin
      		trans_obj = new();
      		mbx_dr.get(trans_obj);
       		begin 
        		if(trans_obj.write_enb)
         		begin
         			MEM[trans_obj.address] = trans_obj.data_in;
        			$display("REFERENCE MODEL DATA IN MEMORY MEM[ADDRESS]=%d",MEM[trans_obj.address],$time);
        		end
        		if(trans_obj.read_enb)
         		begin
         			trans_obj.data_out = MEM[trans_obj.address];
        			$display("REFERENCE MODEL DATA OUT FROM MEMORY data_out=%d",trans_obj.data_out,$time);
       			end
       		end
      		mbx_rs.put(trans_obj);
     	end 
  	endtask

endclass
