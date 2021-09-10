p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_Not := $(addprefix $(p), Not.v)

include ../Nand/src.mk
deps_Not := $(src_Nand)

src_Not := $(_src_Not) $(deps_Not)
