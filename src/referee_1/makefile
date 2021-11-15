# FIFO tester makefile

CC := iverilog
YPATH := ../TCL
VFLAGS := -I ../../include

TARGET = referee_1
OUTPUT = referee_1
TESTBENCH = testbench

CLN_FLS := *.o *.out *.vcd

all: yosys emacs icarus

yosys:
	yosys -s $(YPATH)/$(TARGET).tcl
	sed -i 's/referee_2/referee_2_str/' $(TARGET)_str.v
	sed -i 's/push_signal/push_signal_str/g' $(TARGET)_str.v
	sed -i 's/pop_signal/pop_signal_str/g' $(TARGET)_str.v
	sed -i 's/data_out/data_out_str/g' $(TARGET)_str.v

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