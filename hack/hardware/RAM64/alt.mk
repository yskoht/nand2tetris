p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_RAM64 := $(addprefix $(p), RAM64_alt.v)

include ../RAM/src.mk
deps_RAM64 := $(src_RAM)

src_RAM64 := $(_src_RAM64) $(deps_RAM64)
