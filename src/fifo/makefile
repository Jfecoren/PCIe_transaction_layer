# FIFO tester makefile

CC := iverilog
YPATH := ../TCL
VFLAGS := -I ../../include -I ../memory

TARGET = fifo
TESTBENCH = testbench
OUTPUT = fifo

CLN_FLS := *.o *.out *.vcd

all: yosys emacs icarus

yosys:
	yosys -s $(YPATH)/fifo.tcl
	sed -i 's/fifo/fifo_str/' $(TARGET)_str.v
	sed -i 's/data_out/data_out_str/g' $(TARGET)_str.v
	sed -i 's/almost_full/almost_full_str/g' $(TARGET)_str.v
	sed -i 's/almost_empty/almost_empty_str/g' $(TARGET)_str.v
	sed -i 's/true_dpram_sclk/true_dpram_sclk_str/' $(TARGET)_str.v

emacs:
	emacs --batch $(TESTBENCH).v -f verilog-batch-auto

icarus:
	@echo "Compilando Verilog"
	$(CC) -o $(OUTPUT).out $(TESTBENCH).v $(VFLAGS)
	vvp $(OUTPUT).out
	@echo "\nFinished. \nUse <make wave> to open signal visualizer, or <make gtk> to open default signals view."

wave:
	gtkwave $(TARGET).vcd
gtk:
	gtkwave $(TARGET).gtkw

clean:
	rm -rf $(CLN_FLS)
	rm -rf $(TARGET)_str.v