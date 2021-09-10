
p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_Xor := $(addprefix $(p), Xor.v)

include ../Nand/src.mk
include ../Not/src.mk
deps_Xor := $(src_Nand) $(src_Not)

src_Xor := $(_src_Xor) $(deps_Xor)
