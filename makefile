CC := iverilog

INC_DIR := include
SRC_DIR := src

VFLAGS := -I $(INC_DIR) -I SRC_DIR


all:



clean:
	rm -rf *.o *.vcd *.out