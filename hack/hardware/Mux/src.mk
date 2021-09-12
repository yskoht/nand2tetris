p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_Mux := $(addprefix $(p), Mux.v)

include ../Nand/src.mk
include ../Not/src.mk
deps_Mux := $(src_Nand) $(src_Not)

src_Mux := $(_src_Mux) $(deps_Mux)
