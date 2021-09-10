p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_Bit := $(addprefix $(p), Bit.v)

include ../Mux/src.mk
include ../DFF/src.mk
deps_Bit := $(src_Mux) $(src_DFF)

src_Bit := $(_src_Bit) $(deps_Bit)
