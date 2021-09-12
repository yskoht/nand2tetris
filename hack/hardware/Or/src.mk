p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_Or := $(addprefix $(p), Or.v)

include ../Nand/src.mk
include ../Not/src.mk
deps_Or := $(src_Nand) $(src_Not)

src_Or := $(_src_Or) $(deps_Or)
