CC = iverilog
TARGET0 = state_machine.v
TARGET1 = state_machine_synth.v
OUTPUT0 = state_machine.out
OUTPUT1 = state_machine.vcd
TESTBENCH0 = testbench.v
YPATH = ../TCL
VFLAGS = -I ../../include

all:
	yosys -s $(YPATH)/state_machine.tcl
	sed -i 's/state_machine/state_machine_synth/' $(TARGET1)
	sed -i 's/State/State_est/g' $(TARGET1)
	emacs --batch $(TESTBENCH0) -f verilog-batch-auto
	@echo "Compilando Verilog :D"
	$(CC) -o $(OUTPUT0) $(TESTBENCH0) $(VFLAGS)
	vvp $(OUTPUT0)
	@echo "\nFin. Utilice <make wave> para generar onda del archivo, o <make clean> par borrar los archivos temporales."
wave:
	gtkwave $(OUTPUT1)

clean:
	rm -f $(OUTPUT0)
	rm -f $(OUTPUT1)



