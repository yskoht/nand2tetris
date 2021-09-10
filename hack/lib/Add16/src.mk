p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_Add16 := $(addprefix $(p), Add16.v AddN.v)

include ../FullAdder/src.mk
deps_Add16 := $(src_FullAdder)

src_Add16 := $(_src_Add16) $(deps_Add16)
