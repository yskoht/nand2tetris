p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_Mux16 := $(addprefix $(p), Mux16.v MuxN.v)

include ../Mux/src.mk
deps_Mux16 := $(src_Mux)

src_Mux16 := $(_src_Mux16) $(deps_Mux16)
