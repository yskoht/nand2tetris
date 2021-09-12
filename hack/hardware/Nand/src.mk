p := $(dir $(lastword $(MAKEFILE_LIST)))
src_Nand := $(addprefix $(p), Nand.v)
