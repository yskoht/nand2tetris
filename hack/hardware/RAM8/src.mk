p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_RAM8 := $(addprefix $(p), RAM8.v RAM8N.v)

include ../Register/src.mk
include ../Mux8Way16/src.mk
include ../DMux8Way/src.mk
deps_RAM8 := $(src_Register) $(src_Mux8Way16) $(src_DMux8Way)

src_RAM8 := $(_src_RAM8) $(deps_RAM8)
