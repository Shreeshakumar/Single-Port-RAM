QUESTA := /home/share/questa.csh
SHELL := /bin/csh
TEST ?= ram_test

.ONESHELL:	
all:
	source $(QUESTA)
	make compile
	make simulate

compile:
	@echo "\t\t\t\t...............................COMPILING CODE..............................."
	source $(QUESTA)
	vlog -sv +acc +cover +fcover -l /simulation/log_file.log verification/ram_top.sv 

simulate:
	@echo "\t\t\t\t...........................SIMULATING TEST = $(TEST) WITH VERBOSITY = $(V)..........................."
	vsim -vopt work.apb_top -voptargs=+acc=npr -assertdebug -l /simulation/log_file.log -coverage -c -do "coverage save -onexit -assert -directive -cvg -codeAll /simulation/ucdb_file.ucdb; run -all; exit"

cover:
	vcover report -html /simulation/ucdb_file.ucdb -htmldir /simulation/covReport -details
	
push:
	git add .
	git commit -m 'commiting'
	git push

