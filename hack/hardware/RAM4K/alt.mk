p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_RAM4K := $(addprefix $(p), RAM4K_alt.v)

include ../RAM/src.mk
deps_RAM4K := $(src_RAM)

src_RAM4K := $(_src_RAM4K) $(deps_RAM4K)
