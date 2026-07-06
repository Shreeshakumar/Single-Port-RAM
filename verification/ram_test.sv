class ram_test; 
  	virtual ram_inf vif_drv; 
  	virtual ram_inf vif_mon; 
  	//virtual ram_inf ref_vif; 

  	environment env; 
	
  	function new(virtual ram_inf vif_drv, virtual ram_inf vif_mon ); 
    	this.vif_drv = vif_drv; 
    	this.vif_mon = vif_mon; 
    	//this.ref_vif=ref_vif; 
  	endfunction 

  	task run(); 
     	env = new(vif_drv, vif_mon ); 
     	env.build; 
     	env.start; 
  	endtask 

endclass 
