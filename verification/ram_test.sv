class ram_test; 
  	virtual ram_inf vif_drv; 
  	virtual ram_inf vif_mon; 
  	virtual ram_inf vif_ref; 

  	environment env; 
	
  	function new(virtual ram_inf vif_drv, virtual ram_inf vif_mon, virtual ram_inf vif_ref ); 
    	this.vif_drv = vif_drv; 
    	this.vif_mon = vif_mon; 
    	this.vif_ref = vif_ref; 
  	endfunction 

  	task run(); 
     	env = new(vif_drv, vif_mon, vif_ref ); 
     	env.build; 
     	env.start; 
  	endtask 

endclass 
