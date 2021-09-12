p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_RAM16K := $(addprefix $(p), RAM16K_alt.v)

include ../RAM/src.mk
deps_RAM16K := $(src_RAM)

src_RAM16K := $(_src_RAM16K) $(deps_RAM16K)
