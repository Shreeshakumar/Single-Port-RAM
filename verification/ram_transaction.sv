class transaction;

	rand bit [7:0]	data_in;
	randc bit [4:0]	address;
	rand bit 	 	write_enb, read_enb;

	bit [7:0]		data_out;
	
	constraint wr_rd_value {{write_enb,read_enb} inside {[0:3]};	}
	//constraint wr_rd_not_equal {{write_enb,read_enb} != 2'b11;		}

	virtual function transaction copy();
		copy = new();
		copy.data_in 	= this.data_in;
		copy.address 	= this.address;
		copy.write_enb 	= this.write_enb;
		copy.read_enb 	= this.read_enb;
		return copy;
	endfunction

endclass

