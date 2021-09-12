p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_PC := $(addprefix $(p), PC.v PCN.v)

include ../Mux16/src.mk
include ../Register/src.mk
include ../Inc16/src.mk
deps_PC := $(src_Mux16) $(src_Register) $(src_Inc16)

src_PC := $(_src_PC) $(deps_PC)
