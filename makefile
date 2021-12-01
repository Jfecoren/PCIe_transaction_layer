CC := iverilog

INC_DIR := include
SRC_DIR := src

VFLAGS := -I $(INC_DIR) -I SRC_DIR


all:	
	make -C ./src/Transfer_Layer/
	make -C ./src/Transfer_Layer/ wave

counter:
	make -C ./src/counters/
	make -C ./src/counters/ wave

fifo:
	make -C ./src/fifo/
	make -C ./src/fifo/ wave

memory:
	make -C ./src/memory/
	make -C ./src/memory/ wave

referee1:
	make -C ./src/referee_1/
	make -C ./src/referee_1/ wave

referee2:
	make -C ./src/referee_2/
	make -C ./src/referee_2/ wave

statemachine:
	make -C ./src/State_Machine/
	make -C ./src/State_Machine/ wave

clean:
	rm -rf *.o *.vcd *.out