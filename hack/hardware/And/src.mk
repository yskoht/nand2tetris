p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_And := $(addprefix $(p), And.v)

include ../Nand/src.mk
include ../Not/src.mk
deps_And := $(src_Nand) $(src_Not)

src_And := $(_src_And) $(deps_And)
