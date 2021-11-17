CC = iverilog
TARGET0 = contador.v
TARGET1 = contador_est.v
OUTPUT0 = contador.out
OUTPUT1 = contador.vcd
TESTBENCH0 = BancoPruebas.v
YPATH = ../TCL
VFLAGS = -I ../../include

all:
	yosys -s $(YPATH)/contador.tcl
	sed -i 's/contador/contador_est/' $(TARGET1)
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

