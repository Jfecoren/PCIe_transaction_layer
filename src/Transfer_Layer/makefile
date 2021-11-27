# FIFO tester makefile

CC := iverilog
TARGET1 = tcl_synth.v
OUTPUT0 = transferLayer.out
OUTPUT1 = transferLayer.vcd
TESTBENCH0 = testbench.v

YPATH := ../TCL
VFLAGS := -I ../../include -I ../memory -I ../referee_1 -I ../referee_2 -I ../State_Machine
CLN_FLS := *.o *.out *.vcd

all: yosys emacs icarus
yosys:
	yosys -s $(YPATH)/tcl.tcl
	sed -i 's/tcl/tcl_synth/' $(TARGET1)
	sed -i 's/counterValid/counterValid_synth/g' $(TARGET1)
	sed -i 's/counterOut/counterOut_synth/g' $(TARGET1)
	sed -i 's/dataOutputP0/dataOutputP0_synth/g' $(TARGET1)
	sed -i 's/dataOutputP1/dataOutputP1_synth/g' $(TARGET1)
	sed -i 's/dataOutputP2/dataOutputP2_synth/g' $(TARGET1)
	sed -i 's/dataOutputP3/dataOutputP3_synth/g' $(TARGET1)
	sed -i 's/maquinaEstados/maquinaEstados_synth/g' $(TARGET1)
	sed -i 's/bancoContadores/bancoContadores_synth/g' $(TARGET1)
	sed -i 's/c0/c0_synth/g' $(TARGET1)
	sed -i 's/c1/c1_synth/g' $(TARGET1)
	sed -i 's/c2/c2_synth/g' $(TARGET1)
	sed -i 's/c3/c3_synth/g' $(TARGET1)
	sed -i 's/c4/c4_synth/g' $(TARGET1)
	sed -i 's/arbitro1/arbitro1_synth/g' $(TARGET1)
	sed -i 's/arbitro2/arbitro2_synth/g' $(TARGET1)
	sed -i 's/multiplexorEntrada/multiplexorEntrada_synth/g' $(TARGET1)
	sed -i 's/multiplexorSalida/multiplexorSalida_synth/g' $(TARGET1)
	sed -i 's/demultiplexor/demultiplexor_synth/g' $(TARGET1)
	sed -i 's/fifoIn/fifoIn_synth/g' $(TARGET1)
	sed -i 's/fifoInP0/fifoInP0_synth/g' $(TARGET1)
	sed -i 's/fifoInP1/fifoInP1_synth/g' $(TARGET1)
	sed -i 's/fifoInP2/fifoInP2_synth/g' $(TARGET1)
	sed -i 's/fifoInP3/fifoInP3_synth/g' $(TARGET1)
	sed -i 's/fifoOutP0/fifoOutP0_synth/g' $(TARGET1)
	sed -i 's/fifoOutP1/fifoOutP1_synth/g' $(TARGET1)
	sed -i 's/fifoOutP2/fifoOutP2_synth/g' $(TARGET1)
	sed -i 's/fifoOutP3/fifoOutP3_synth/g' $(TARGET1)
	sed -i 's/state_machine/state_machine_synth/g' $(TARGET1)
	sed -i 's/mux/mux_synth/g' $(TARGET1)
	sed -i 's/contador/contador_synth/g' $(TARGET1)
	sed -i 's/referee_1/referee_1_synth/g' $(TARGET1)
	sed -i 's/referee_2/referee_2_synth/g' $(TARGET1)
	sed -i 's/multiplexIn/multiplexIn_synth/g' $(TARGET1)
	sed -i 's/multiplexOut/multiplexOut_synth/g' $(TARGET1)
	sed -i 's/demultiplex/demultiplex_synth/g' $(TARGET1)
	sed -i 's/fifo/fifo_synth/g' $(TARGET1)
	sed -i 's/true_dpram_sclk/true_dpram_sclk_synth/g' $(TARGET1)
	sed -i 's/buffer3x/buffer3x_synth/g' $(TARGET1)
	sed -i 's/buffer2x/buffer2x_synth/g' $(TARGET1)
emacs:
	emacs --batch $(TESTBENCH0) -f verilog-batch-auto
icarus:
	@echo "Compilando Verilog"
	$(CC) -o $(OUTPUT0) $(TESTBENCH0)
	vvp $(OUTPUT0)
wave:
	gtkwave $(OUTPUT1)
gtk:
	gtkwave Transfer_layer_seq_view.gtkw
clean:
	rm -rf $(CLN_FLS)

