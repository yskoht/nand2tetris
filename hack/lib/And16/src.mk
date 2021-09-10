p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_And16 := $(addprefix $(p), And16.v AndN.v)

include ../And/src.mk
deps_And16 := $(src_And)

src_And16 := $(_src_And16) $(deps_And16)
