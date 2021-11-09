# FIFO tester makefile

CC := iverilog
TARGET1 = fifo_est.v
OUTPUT0 = fifo.out
OUTPUT1 = fifo.vcd
TESTBENCH0 = testbench.v

YPATH := ../TCL
VFLAGS := -I ../../include -I ../memory
CLN_FLS := *.o *.out *.vcd

all:
	yosys -s $(YPATH)/fifo.tcl
	sed -i 's/fifo/fifo_est/' $(TARGET1)
	sed -i 's/data_out/data_out_est/g' $(TARGET1)
	sed -i 's/almost_full/almost_full_est/g' $(TARGET1)
	sed -i 's/almost_empty/almost_empty_est/g' $(TARGET1)
	sed -i 's/true_dpram_sclk/true_dpram_sclk_est/' $(TARGET1)
	emacs --batch $(TESTBENCH0) -f verilog-batch-auto
	@echo "Compilando Verilog"
	$(CC) -o $(OUTPUT0) $(TESTBENCH0) $(VFLAGS)
	vvp $(OUTPUT0)
wave:
	gtkwave $(OUTPUT1)
clean:
	rm -rf $(CLN_FLS)

