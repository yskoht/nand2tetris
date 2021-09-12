p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_Inc16 := $(addprefix $(p), Inc16.v IncN.v)

include ../Add16/src.mk
deps_Inc16 := $(src_Add16)

src_Inc16 := $(_src_Inc16) $(deps_Inc16)
