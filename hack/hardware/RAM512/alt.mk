p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_RAM512 := $(addprefix $(p), RAM512_alt.v)

include ../RAM/src.mk
deps_RAM512 := $(src_RAM)

src_RAM512 := $(_src_RAM512) $(deps_RAM512)
