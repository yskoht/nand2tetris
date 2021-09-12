p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_RAM8 := $(addprefix $(p), RAM8_alt.v)

include ../RAM/src.mk
deps_RAM8 := $(src_RAM)

src_RAM8 := $(_src_RAM8) $(deps_RAM8)
