CC = iverilog
TARGET0 = referee_2.v
TARGET1 = referee_2_est.v
OUTPUT0 = referee_2.out
OUTPUT1 = referee_2.vcd
TESTBENCH0 = testbench.v
YPATH = ../TCL
VFLAGS = -I ../../include

all:
	yosys -s $(YPATH)/referee_2.tcl
	sed -i 's/referee_2/referee_2_est/' $(TARGET1)
	sed -i 's/cuenta/cuenta_est/g' $(TARGET1)
	emacs --batch $(TESTBENCH0) -f verilog-batch-auto
	@echo "Compilando Verilog"
	$(CC) -o $(OUTPUT0) $(TESTBENCH0) $(VFLAGS)
	vvp $(OUTPUT0)
	@echo "\nFin. Utilice <make wave> para generar onda del archivo, o <make clean> par borrar los archivos temporales."
wave:
	gtkwave $(OUTPUT1)

clean:
	rm -f $(OUTPUT0)
	rm -f $(OUTPUT1)