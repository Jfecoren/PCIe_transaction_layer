# FIFO tester makefile

CC := iverilog
YPATH := ../TCL
VFLAGS := -I ../../include

TARGET0 = referee_2
OUTPUT0 = referee_2
TESTBENCH = testbench_2

CLN_FLS := *.o *.out *.vcd

all: yosys emacs icarus

yosys:
	yosys -s $(YPATH)/referees.tcl
	sed -i 's/referee_2/referee_2_str/' $(TARGET0)_str.v
	sed -i 's/push_signal/push_signal_str/g' $(TARGET0)_str.v
	sed -i 's/pop_signal/pop_signal_str/g' $(TARGET0)_str.v
	sed -i 's/data_out/data_out_str/g' $(TARGET0)_str.v

emacs:
	emacs --batch $(TESTBENCH).v -f verilog-batch-auto

icarus:
	@echo "Compilando Verilog"
	$(CC) -o $(OUTPUT0).out $(TESTBENCH).v $(VFLAGS)
	vvp $(OUTPUT0).out
	@echo "\nFinished. \nUse <make wave> to open signal visualizer, or <make gtk> to open default signals view."

wave:
	gtkwave $(TARGET0).vcd
gtk:
	gtkwave $(TARGET0).gtkw

clean:
	rm -rf $(CLN_FLS)
	rm -rf $(TARGET)_str.v