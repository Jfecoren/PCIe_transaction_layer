CC := iverilog
YPATH := ../TCL
VFLAGS := -I ../../include

TARGET := true_dpram_sclk
OUTPUT := memory
TESTBENCH = testbench

all: yosys emacs icarus

yosys:
	yosys -s $(YPATH)/memory.tcl
	sed -i 's/true_dpram_sclk/true_dpram_sclk_str/' $(TARGET)_str.v
	sed -i 's/q_w/q_w_str/g' $(TARGET)_str.v
	sed -i 's/q_r/q_r_str/g' $(TARGET)_str.v
emacs:
	emacs --batch $(TESTBENCH).v -f verilog-batch-auto
icarus:
	@echo "\nCompiling..."
	$(CC) -o $(OUTPUT).out $(TESTBENCH).v $(VFLAGS)
	vvp $(OUTPUT).out
	@echo "\nFinished. \nUse <make wave> to open signal visualizer, or <make gtk> to open default signals view."



wave:
	gtkwave $(OUTPUT).vcd
gtk:
	gtkwave $(OUTPUT).gtkw

clean:
	rm -f $(OUTPUT).out
	rm -f $(OUTPUT).vcd
	rm -f $(TARGET)_str.v
