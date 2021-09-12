p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_ALU := $(addprefix $(p), ALU.v ALUN.v)

include ../Mux16/src.mk
include ../Not16/src.mk
include ../Not/src.mk
include ../Add16/src.mk
include ../And16/src.mk
include ../Or8Way/src.mk
deps_ALU := $(src_Mux16) $(src_Not16) $(src_Not) $(src_Add16) $(src_And16) $(src_Or8Way)

src_ALU := $(_src_ALU) $(deps_ALU)
