CC = iverilog
TARGET = counters
OUTPUT = $(TARGET)

TESTBENCH = testbench
YPATH = ../TCL
VFLAGS = -I ../../include

all: yosys emacs icarus

yosys:
	yosys -s $(YPATH)/$(TARGET).tcl
	sed -i 's/counters/counters_str/' $(TARGET)_str.v
	sed -i 's/counts/counts_str/g' $(TARGET)_str.v
emacs:
	emacs --batch $(TESTBENCH).v -f verilog-batch-auto

icarus:
	@echo "Compiling Verilog"
	$(CC) -o $(OUTPUT).out $(TESTBENCH).v $(VFLAGS)
	vvp $(OUTPUT).out
	@echo "\nFinished. \nUse <make wave> to open signal visualizer, or <make gtk> to open default signals view."

wave:
	gtkwave $(OUTPUT).vcd

gtk:
	gtkwave $(OUTPUT).gtkw

clean:
	rm -f $(TARGET)_str.v
	rm -f *.o *.out *.vcd

