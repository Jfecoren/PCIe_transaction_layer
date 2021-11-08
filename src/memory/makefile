CC = iverilog
TARGET0 = true_dpram_sclk.v
TARGET1 = true_dpram_sclk_est.v
OUTPUT0 = memoria.out
OUTPUT1 = memoria.vcd
TESTBENCH0 = BancoPruebas.v
YPATH = ../TCL
VFLAGS = -I ../../include

all:
	yosys -s $(YPATH)/memory.tcl
	sed -i 's/true_dpram_sclk/true_dpram_sclk_est/' $(TARGET1)
	sed -i 's/q_w/q_w_est/g' $(TARGET1)
	sed -i 's/q_r/q_r_est/g' $(TARGET1)
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
	rm -f $(TARGET1)
