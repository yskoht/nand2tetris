p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_RAM64 := $(addprefix $(p), RAM64.v RAM64N.v)

include ../RAM8/src.mk
include ../Mux8Way16/src.mk
include ../DMux8Way/src.mk
deps_RAM64 := $(src_RAM8) $(src_Mux8Way16) $(src_DMux8Way)

src_RAM64 := $(_src_RAM64) $(deps_RAM64)
